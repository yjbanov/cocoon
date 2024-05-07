// Copyright 2020 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:github/github.dart' as github;

import '../foundation/github_checks_util.dart';
import '../model/luci/buildbucket.dart';
import '../model/luci/push_message.dart' as push_message;
import 'buildbucket.dart';
import 'config.dart';
import 'logging.dart';

const String kGithubSummary = '''
**[Understanding a LUCI build failure](https://github.com/flutter/flutter/wiki/Understanding-a-LUCI-build-failure)**

''';

/// Controls triggering builds and updating their status in the Github UI.
class GithubChecksService {
  GithubChecksService(this.config, {GithubChecksUtil? githubChecksUtil})
      : githubChecksUtil = githubChecksUtil ?? const GithubChecksUtil();

  Config config;
  GithubChecksUtil githubChecksUtil;

  static final Set<github.CheckRunConclusion> _failedStatesSet = <github.CheckRunConclusion>{
    github.CheckRunConclusion.cancelled,
    github.CheckRunConclusion.failure,
  };

  /// Updates the Github build status using a [BuildPushMessage] sent by LUCI in
  /// a pub/sub notification.
  /// Relevant APIs:
  ///   https://docs.github.com/en/rest/reference/checks#update-a-check-run
  Future<bool> updateCheckStatus(
    push_message.BuildPushMessage buildPushMessage,
    BuildBucketClient buildBucketClient,
    github.RepositorySlug slug, {
    bool rescheduled = false,
  }) async {
    final push_message.Build? build = buildPushMessage.build;
    if (buildPushMessage.userData.isEmpty) {
      return false;
    }

    if (!buildPushMessage.userData.containsKey('check_run_id') ||
        !buildPushMessage.userData.containsKey('repo_owner') ||
        !buildPushMessage.userData.containsKey('repo_name')) {
      log.severe(
        'UserData did not contain check_run_id,'
        'repo_owner, or repo_name: ${buildPushMessage.userData}',
      );
      return false;
    }
    github.CheckRunStatus status = _statusForResult(build!.status);
    // Only `id` and `name` in the CheckRun are needed.
    // Instead of making an API call to get the details of each check run, we
    // generate the check run with only necessary info.
    final github.CheckRun checkRun = github.CheckRun.fromJson({
      'id': buildPushMessage.userData['check_run_id'] as int?,
      'status': status,
      'check_suite': const {'id': null},
      'started_at': build.createdTimestamp.toString(),
      'conclusion': null,
      'name': build.buildParameters!['builder_name'],
    });
    github.CheckRunConclusion? conclusion =
        (buildPushMessage.build!.result != null) ? _conclusionForResult(buildPushMessage.build!.result) : null;
    final String? url = buildPushMessage.build!.url;
    github.CheckRunOutput? output;
    // If status has completed with failure then provide more details.
    if (taskFailed(buildPushMessage)) {
      if (rescheduled) {
        status = github.CheckRunStatus.queued;
        conclusion = null;
        output = github.CheckRunOutput(
          title: checkRun.name!,
          summary: 'Note: this is an auto rerun. The timestamp above is based on the first attempt of this check run.',
        );
      } else {
        final Build buildbucketBuild = await _getBuildById(
          buildBucketClient,
          buildPushMessage.build!.id,
          fields: 'id,builder,summaryMarkdown',
        );
        final String summary = _getGithubSummary(buildbucketBuild.summaryMarkdown);
        log.fine('From LUCI: ${buildbucketBuild.summaryMarkdown} after summary: $summary');
        output = github.CheckRunOutput(
          title: checkRun.name!,
          summary: _getGithubSummary(buildbucketBuild.summaryMarkdown),
        );
        log.fine('Updating check run with output: [${output.toJson()}]');
      }
    }
    await githubChecksUtil.updateCheckRun(
      config,
      slug,
      checkRun,
      status: status,
      conclusion: conclusion,
      detailsUrl: url,
      output: output,
    );
    return true;
  }

  /// Gets [Build] using its [id] and passing the additional
  /// fields to be populated in the response.
  Future<Build> _getBuildById(BuildBucketClient buildBucketClient, String? id, {String? fields}) async {
    final GetBuildRequest request = GetBuildRequest(id: id, fields: fields);
    return buildBucketClient.getBuild(request);
  }

  /// Check if task has completed with failure.
  bool taskFailed(push_message.BuildPushMessage buildPushMessage) {
    final push_message.Build? build = buildPushMessage.build;
    final github.CheckRunStatus status = _statusForResult(build!.status);
    final github.CheckRunConclusion? conclusion =
        (buildPushMessage.build!.result != null) ? _conclusionForResult(buildPushMessage.build!.result) : null;
    return status == github.CheckRunStatus.completed && _failedStatesSet.contains(conclusion);
  }

  /// Appends triage wiki page to `summaryMarkdown` from LUCI build so that people can easily
  /// reference from github check run page.
  String _getGithubSummary(String? summary) {
    if (summary == null) {
      return '${kGithubSummary}Empty summaryMarkdown';
    }
    // This is an imposed GitHub limit
    const int checkSummaryLimit = 65535;
    // This is to give buffer room incase GitHub lowers the amount.
    const int checkSummaryBufferLimit = checkSummaryLimit - 10000 - kGithubSummary.length;
    // Return the last [checkSummaryBufferLimit] characters as they are likely the most relevant.
    if (summary.length > checkSummaryBufferLimit) {
      final String truncatedSummary = summary.substring(summary.length - checkSummaryBufferLimit);
      summary = '[TRUNCATED...] $truncatedSummary';
    }
    return '$kGithubSummary$summary';
  }

  /// Transforms a [push_message.Result] to a [github.CheckRunConclusion].
  /// Relevant APIs:
  ///   https://developer.github.com/v3/checks/runs/#check-runs
  github.CheckRunConclusion _conclusionForResult(push_message.Result? result) {
    switch (result) {
      case push_message.Result.canceled:
        // Set conclusion cancelled as a failure to ensure developers can retry
        // tasks when builds timeout.
        return github.CheckRunConclusion.failure;
      case push_message.Result.failure:
        return github.CheckRunConclusion.failure;
      case push_message.Result.success:
        return github.CheckRunConclusion.success;
      case null:
        throw StateError('unreachable');
    }
  }

  /// Transforms a [push_message.Status] to a [github.CheckRunStatus].
  /// Relevant APIs:
  ///   https://developer.github.com/v3/checks/runs/#check-runs
  github.CheckRunStatus _statusForResult(push_message.Status? status) {
    switch (status) {
      case push_message.Status.completed:
        return github.CheckRunStatus.completed;
      case push_message.Status.scheduled:
        return github.CheckRunStatus.queued;
      case push_message.Status.started:
        return github.CheckRunStatus.inProgress;
      case null:
        throw StateError('unreachable');
    }
  }
}
