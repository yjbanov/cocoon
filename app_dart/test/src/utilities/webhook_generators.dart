// Copyright 2019 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:cocoon_service/src/service/config.dart';

String generatePullRequestEvent(String action, int number, String baseRef,
        {String login = 'flutter',
        String headRef = 'wait_for_reassemble',
        bool includeCqLabel = false,
        bool isDraft = false,
        bool merged = false,
        String repoFullName = 'flutter/flutter',
        String repoName = 'flutter',
        bool isMergeable = true}) =>
    '''{
  "action": "$action",
  "number": $number,
  "pull_request": {
    "url": "https://api.github.com/repos/$repoFullName/pulls/$number",
    "id": 294034,
    "node_id": "MDExOlB1bGxSZXF1ZXN0Mjk0MDMzODQx",
    "html_url": "https://github.com/$repoFullName/pull/$number",
    "diff_url": "https://github.com/$repoFullName/pull/$number.diff",
    "patch_url": "https://github.com/$repoFullName/pull/$number.patch",
    "issue_url": "https://api.github.com/repos/$repoFullName/issues/$number",
    "number": $number,
    "state": "open",
    "locked": false,
    "title": "Defer reassemble until reload is finished",
    "user": {
      "login": "$login",
      "id": 862741,
      "node_id": "MDQ6VXNlcjg2MjA3NDE=",
      "avatar_url": "https://avatars3.githubusercontent.com/u/8620741?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/flutter",
      "html_url": "https://github.com/flutter",
      "followers_url": "https://api.github.com/users/flutter/followers",
      "following_url": "https://api.github.com/users/flutter/following{/other_user}",
      "gists_url": "https://api.github.com/users/flutter/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/flutter/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/flutter/subscriptions",
      "organizations_url": "https://api.github.com/users/flutter/orgs",
      "repos_url": "https://api.github.com/users/flutter/repos",
      "events_url": "https://api.github.com/users/flutter/events{/privacy}",
      "received_events_url": "https://api.github.com/users/flutter/received_events",
      "type": "User",
      "site_admin": false
    },
    "draft" : "$isDraft",
    "body": "The body",
    "created_at": "2019-07-03T07:14:35Z",
    "updated_at": "2019-07-03T16:34:53Z",
    "closed_at": null,
    "merged_at": "2019-07-03T16:34:53Z",
    "merge_commit_sha": "d22ab7ced21d3b2a5be00cf576d383eb5ffddb8a",
    "assignee": null,
    "assignees": [],
    "requested_reviewers": [],
    "requested_teams": [],
    "labels": [
      {
        "id": 487496476,
        "node_id": "MDU6TGFiZWw0ODc0OTY0NzY=",
        "url": "https://api.github.com/repos/$repoFullName/labels/cla:%20yes",
        "name": "cla: yes",
        "color": "ffffff",
        "default": false
      },
      {
        "id": 284437560,
        "node_id": "MDU6TGFiZWwyODQ0Mzc1NjA=",
        "url": "https://api.github.com/repos/$repoFullName/labels/framework",
        "name": "framework",
        "color": "207de5",
        "default": false
      },
      ${includeCqLabel ? '''
      {
        "id": 283480100,
        "node_id": "MDU6TGFiZWwyODM0ODAxMDA=",
        "url": "https://api.github.com/repos/$repoFullName/labels/tool",
        "color": "5319e7",
        "default": false
      },''' : ''}
      {
        "id": 283480100,
        "node_id": "MDU6TGFiZWwyODM0ODAxMDA=",
        "url": "https://api.github.com/repos/$repoFullName/labels/tool",
        "name": "tool",
        "color": "5319e7",
        "default": false
      }
    ],
    "milestone": null,
    "commits_url": "https://api.github.com/repos/$repoFullName/pulls/$number/commits",
    "review_comments_url": "https://api.github.com/repos/$repoFullName/pulls/$number/comments",
    "review_comment_url": "https://api.github.com/repos/$repoFullName/pulls/comments{/number}",
    "comments_url": "https://api.github.com/repos/$repoFullName/issues/$number/comments",
    "statuses_url": "https://api.github.com/repos/$repoFullName/statuses/be6ff099a4ee56e152a5fa2f37edd10f79d1269a",
    "head": {
      "label": "$login:$headRef",
      "ref": "$headRef",
      "sha": "be6ff099a4ee56e152a5fa2f37edd10f79d1269a",
      "user": {
        "login": "$login",
        "id": 8620741,
        "node_id": "MDQ6VXNlcjg2MjA3NDE=",
        "avatar_url": "https://avatars3.githubusercontent.com/u/8620741?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/flutter",
        "html_url": "https://github.com/flutter",
        "followers_url": "https://api.github.com/users/flutter/followers",
        "following_url": "https://api.github.com/users/flutter/following{/other_user}",
        "gists_url": "https://api.github.com/users/flutter/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/flutter/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/flutter/subscriptions",
        "organizations_url": "https://api.github.com/users/flutter/orgs",
        "repos_url": "https://api.github.com/users/flutter/repos",
        "events_url": "https://api.github.com/users/flutter/events{/privacy}",
        "received_events_url": "https://api.github.com/users/flutter/received_events",
        "type": "User",
        "site_admin": false
      },
      "repo": {
        "id": 131232406,
        "node_id": "MDEwOlJlcG9zaXRvcnkxMzEyMzI0MDY=",
        "name": "$repoName",
        "full_name": "$repoFullName",
        "private": false,
        "owner": {
          "login": "flutter",
          "id": 8620741,
          "node_id": "MDQ6VXNlcjg2MjA3NDE=",
          "avatar_url": "https://avatars3.githubusercontent.com/u/8620741?v=4",
          "gravatar_id": "",
          "url": "https://api.github.com/users/flutter",
          "html_url": "https://github.com/flutter",
          "followers_url": "https://api.github.com/users/flutter/followers",
          "following_url": "https://api.github.com/users/flutter/following{/other_user}",
          "gists_url": "https://api.github.com/users/flutter/gists{/gist_id}",
          "starred_url": "https://api.github.com/users/flutter/starred{/owner}{/repo}",
          "subscriptions_url": "https://api.github.com/users/flutter/subscriptions",
          "organizations_url": "https://api.github.com/users/flutter/orgs",
          "repos_url": "https://api.github.com/users/flutter/repos",
          "events_url": "https://api.github.com/users/flutter/events{/privacy}",
          "received_events_url": "https://api.github.com/users/flutter/received_events",
          "type": "User",
          "site_admin": false
        },
        "html_url": "https://github.com/$repoFullName",
        "description": "Flutter makes it easy and fast to build beautiful mobile apps.",
        "fork": true,
        "url": "https://api.github.com/repos/$repoFullName",
        "forks_url": "https://api.github.com/repos/$repoFullName/forks",
        "keys_url": "https://api.github.com/repos/$repoFullName/keys{/key_id}",
        "collaborators_url": "https://api.github.com/repos/$repoFullName/collaborators{/collaborator}",
        "teams_url": "https://api.github.com/repos/$repoFullName/teams",
        "hooks_url": "https://api.github.com/repos/$repoFullName/hooks",
        "issue_events_url": "https://api.github.com/repos/$repoFullName/issues/events{/number}",
        "events_url": "https://api.github.com/repos/$repoFullName/events",
        "assignees_url": "https://api.github.com/repos/$repoFullName/assignees{/user}",
        "branches_url": "https://api.github.com/repos/$repoFullName/branches{/branch}",
        "tags_url": "https://api.github.com/repos/$repoFullName/tags",
        "blobs_url": "https://api.github.com/repos/$repoFullName/git/blobs{/sha}",
        "git_tags_url": "https://api.github.com/repos/$repoFullName/git/tags{/sha}",
        "git_refs_url": "https://api.github.com/repos/$repoFullName/git/refs{/sha}",
        "trees_url": "https://api.github.com/repos/$repoFullName/git/trees{/sha}",
        "statuses_url": "https://api.github.com/repos/$repoFullName/statuses/{sha}",
        "languages_url": "https://api.github.com/repos/$repoFullName/languages",
        "stargazers_url": "https://api.github.com/repos/$repoFullName/stargazers",
        "contributors_url": "https://api.github.com/repos/$repoFullName/contributors",
        "subscribers_url": "https://api.github.com/repos/$repoFullName/subscribers",
        "subscription_url": "https://api.github.com/repos/$repoFullName/subscription",
        "commits_url": "https://api.github.com/repos/$repoFullName/commits{/sha}",
        "git_commits_url": "https://api.github.com/repos/$repoFullName/git/commits{/sha}",
        "comments_url": "https://api.github.com/repos/$repoFullName/comments{/number}",
        "issue_comment_url": "https://api.github.com/repos/$repoFullName/issues/comments{/number}",
        "contents_url": "https://api.github.com/repos/$repoFullName/contents/{+path}",
        "compare_url": "https://api.github.com/repos/$repoFullName/compare/{base}...{head}",
        "merges_url": "https://api.github.com/repos/$repoFullName/merges",
        "archive_url": "https://api.github.com/repos/$repoFullName/{archive_format}{/ref}",
        "downloads_url": "https://api.github.com/repos/$repoFullName/downloads",
        "issues_url": "https://api.github.com/repos/$repoFullName/issues{/number}",
        "pulls_url": "https://api.github.com/repos/$repoFullName/pulls{/number}",
        "milestones_url": "https://api.github.com/repos/$repoFullName/milestones{/number}",
        "notifications_url": "https://api.github.com/repos/$repoFullName/notifications{?since,all,participating}",
        "labels_url": "https://api.github.com/repos/$repoFullName/labels{/name}",
        "releases_url": "https://api.github.com/repos/$repoFullName/releases{/id}",
        "deployments_url": "https://api.github.com/repos/$repoFullName/deployments",
        "created_at": "2018-04-27T02:03:08Z",
        "updated_at": "2019-06-27T06:56:59Z",
        "pushed_at": "2019-07-03T19:40:11Z",
        "git_url": "git://github.com/$repoFullName.git",
        "ssh_url": "git@github.com:$repoFullName.git",
        "clone_url": "https://github.com/$repoFullName.git",
        "svn_url": "https://github.com/$repoFullName",
        "homepage": "https://flutter.io",
        "size": 94508,
        "stargazers_count": 1,
        "watchers_count": 1,
        "language": "Dart",
        "has_issues": false,
        "has_projects": true,
        "has_downloads": true,
        "has_wiki": true,
        "has_pages": false,
        "forks_count": 0,
        "mirror_url": null,
        "archived": false,
        "disabled": false,
        "open_issues_count": 0,
        "license": {
          "key": "other",
          "name": "Other",
          "spdx_id": "NOASSERTION",
          "url": null,
          "node_id": "MDc6TGljZW5zZTA="
        },
        "forks": 0,
        "open_issues": 0,
        "watchers": 1,
        "default_branch": "$kDefaultBranchName"
      }
    },
    "base": {
      "label": "flutter:$baseRef",
      "ref": "$baseRef",
      "sha": "4cd12fc8b7d4cc2d8609182e1c4dea5cddc86890",
      "user": {
        "login": "flutter",
        "id": 14101776,
        "node_id": "MDEyOk9yZ2FuaXphdGlvbjE0MTAxNzc2",
        "avatar_url": "https://avatars3.githubblahblahblah",
        "gravatar_id": "",
        "url": "https://api.github.com/users/flutter",
        "html_url": "https://github.com/flutter",
        "followers_url": "https://api.github.com/users/flutter/followers",
        "following_url": "https://api.github.com/users/flutter/following{/other_user}",
        "gists_url": "https://api.github.com/users/flutter/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/flutter/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/flutter/subscriptions",
        "organizations_url": "https://api.github.com/users/flutter/orgs",
        "repos_url": "https://api.github.com/users/flutter/repos",
        "events_url": "https://api.github.com/users/flutter/events{/privacy}",
        "received_events_url": "https://api.github.com/users/flutter/received_events",
        "type": "Organization",
        "site_admin": false
      },
      "repo": {
        "id": 31792824,
        "node_id": "MDEwOlJlcG9zaXRvcnkzMTc5MjgyNA==",
        "name": "$repoName",
        "full_name": "$repoFullName",
        "private": false,
        "owner": {
          "login": "flutter",
          "id": 14101776,
          "node_id": "MDEyOk9yZ2FuaXphdGlvbjE0MTAxNzc2",
          "avatar_url": "https://avatars3.githubblahblahblah",
          "gravatar_id": "",
          "url": "https://api.github.com/users/flutter",
          "html_url": "https://github.com/flutter",
          "followers_url": "https://api.github.com/users/flutter/followers",
          "following_url": "https://api.github.com/users/flutter/following{/other_user}",
          "gists_url": "https://api.github.com/users/flutter/gists{/gist_id}",
          "starred_url": "https://api.github.com/users/flutter/starred{/owner}{/repo}",
          "subscriptions_url": "https://api.github.com/users/flutter/subscriptions",
          "organizations_url": "https://api.github.com/users/flutter/orgs",
          "repos_url": "https://api.github.com/users/flutter/repos",
          "events_url": "https://api.github.com/users/flutter/events{/privacy}",
          "received_events_url": "https://api.github.com/users/flutter/received_events",
          "type": "Organization",
          "site_admin": false
        },
        "html_url": "https://github.com/$repoFullName",
        "description": "Flutter makes it easy and fast to build beautiful mobile apps.",
        "fork": false,
        "url": "https://api.github.com/repos/$repoFullName",
        "forks_url": "https://api.github.com/repos/$repoFullName/forks",
        "keys_url": "https://api.github.com/repos/$repoFullName/keys{/key_id}",
        "collaborators_url": "https://api.github.com/repos/$repoFullName/collaborators{/collaborator}",
        "teams_url": "https://api.github.com/repos/$repoFullName/teams",
        "hooks_url": "https://api.github.com/repos/$repoFullName/hooks",
        "issue_events_url": "https://api.github.com/repos/$repoFullName/issues/events{/number}",
        "events_url": "https://api.github.com/repos/$repoFullName/events",
        "assignees_url": "https://api.github.com/repos/$repoFullName/assignees{/user}",
        "branches_url": "https://api.github.com/repos/$repoFullName/branches{/branch}",
        "tags_url": "https://api.github.com/repos/$repoFullName/tags",
        "blobs_url": "https://api.github.com/repos/$repoFullName/git/blobs{/sha}",
        "git_tags_url": "https://api.github.com/repos/$repoFullName/git/tags{/sha}",
        "git_refs_url": "https://api.github.com/repos/$repoFullName/git/refs{/sha}",
        "trees_url": "https://api.github.com/repos/$repoFullName/git/trees{/sha}",
        "statuses_url": "https://api.github.com/repos/$repoFullName/statuses/{sha}",
        "languages_url": "https://api.github.com/repos/$repoFullName/languages",
        "stargazers_url": "https://api.github.com/repos/$repoFullName/stargazers",
        "contributors_url": "https://api.github.com/repos/$repoFullName/contributors",
        "subscribers_url": "https://api.github.com/repos/$repoFullName/subscribers",
        "subscription_url": "https://api.github.com/repos/$repoFullName/subscription",
        "commits_url": "https://api.github.com/repos/$repoFullName/commits{/sha}",
        "git_commits_url": "https://api.github.com/repos/$repoFullName/git/commits{/sha}",
        "comments_url": "https://api.github.com/repos/$repoFullName/comments{/number}",
        "issue_comment_url": "https://api.github.com/repos/$repoFullName/issues/comments{/number}",
        "contents_url": "https://api.github.com/repos/$repoFullName/contents/{+path}",
        "compare_url": "https://api.github.com/repos/$repoFullName/compare/{base}...{head}",
        "merges_url": "https://api.github.com/repos/$repoFullName/merges",
        "archive_url": "https://api.github.com/repos/$repoFullName/{archive_format}{/ref}",
        "downloads_url": "https://api.github.com/repos/$repoFullName/downloads",
        "issues_url": "https://api.github.com/repos/$repoFullName/issues{/number}",
        "pulls_url": "https://api.github.com/repos/$repoFullName/pulls{/number}",
        "milestones_url": "https://api.github.com/repos/$repoFullName/milestones{/number}",
        "notifications_url": "https://api.github.com/repos/$repoFullName/notifications{?since,all,participating}",
        "labels_url": "https://api.github.com/repos/$repoFullName/labels{/name}",
        "releases_url": "https://api.github.com/repos/$repoFullName/releases{/id}",
        "deployments_url": "https://api.github.com/repos/$repoFullName/deployments",
        "created_at": "2015-03-06T22:54:58Z",
        "updated_at": "2019-07-04T02:08:44Z",
        "pushed_at": "2019-07-04T02:03:04Z",
        "git_url": "git://github.com/$repoFullName.git",
        "ssh_url": "git@github.com:$repoFullName.git",
        "clone_url": "https://github.com/$repoFullName.git",
        "svn_url": "https://github.com/$repoFullName",
        "homepage": "https://flutter.dev",
        "size": 65507,
        "stargazers_count": 68944,
        "watchers_count": 68944,
        "language": "Dart",
        "has_issues": true,
        "has_projects": true,
        "has_downloads": true,
        "has_wiki": true,
        "has_pages": false,
        "forks_count": 7987,
        "mirror_url": null,
        "archived": false,
        "disabled": false,
        "open_issues_count": 6536,
        "license": {
          "key": "other",
          "name": "Other",
          "spdx_id": "NOASSERTION",
          "url": null,
          "node_id": "MDc6TGljZW5zZTA="
        },
        "forks": 7987,
        "open_issues": 6536,
        "watchers": 68944,
        "default_branch": "$kDefaultBranchName"
      }
    },
    "_links": {
      "self": {
        "href": "https://api.github.com/repos/$repoFullName/pulls/$number"
      },
      "html": {
        "href": "https://github.com/$repoFullName/pull/$number"
      },
      "issue": {
        "href": "https://api.github.com/repos/$repoFullName/issues/$number"
      },
      "comments": {
        "href": "https://api.github.com/repos/$repoFullName/issues/$number/comments"
      },
      "review_comments": {
        "href": "https://api.github.com/repos/$repoFullName/pulls/$number/comments"
      },
      "review_comment": {
        "href": "https://api.github.com/repos/$repoFullName/pulls/comments{/number}"
      },
      "commits": {
        "href": "https://api.github.com/repos/$repoFullName/pulls/$number/commits"
      },
      "statuses": {
        "href": "https://api.github.com/repos/$repoFullName/statuses/deadbeef"
      }
    },
    "author_association": "MEMBER",
    "draft" : $isDraft,
    "merged": $merged,
    "mergeable": $isMergeable,
    "rebaseable": true,
    "mergeable_state": "draft",
    "merged_by": null,
    "comments": 1,
    "review_comments": 0,
    "maintainer_can_modify": true,
    "commits": 5,
    "additions": 55,
    "deletions": 36,
    "changed_files": 5
  },
  "repository": {
    "id": 1868532,
    "node_id": "MDEwOlJlcG9zaXRvcnkxODY4NTMwMDI=",
    "name": "$repoName",
    "full_name": "$repoFullName",
    "private": false,
    "owner": {
      "login": "flutter",
      "id": 21031067,
      "node_id": "MDQ6VXNlcjIxMDMxMDY3",
      "avatar_url": "https://avatars1.githubusercontent.com/u/21031067?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/flutter",
      "html_url": "https://github.com/flutter",
      "followers_url": "https://api.github.com/users/flutter/followers",
      "following_url": "https://api.github.com/users/flutter/following{/other_user}",
      "gists_url": "https://api.github.com/users/flutter/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/flutter/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/flutter/subscriptions",
      "organizations_url": "https://api.github.com/users/flutter/orgs",
      "repos_url": "https://api.github.com/users/flutter/repos",
      "events_url": "https://api.github.com/users/flutter/events{/privacy}",
      "received_events_url": "https://api.github.com/users/flutter/received_events",
      "type": "User",
      "site_admin": false
    },
    "html_url": "https://github.com/$repoFullName",
    "description": null,
    "fork": false,
    "url": "https://api.github.com/repos/$repoFullName",
    "forks_url": "https://api.github.com/repos/$repoFullName/forks",
    "keys_url": "https://api.github.com/repos/$repoFullName/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/$repoFullName/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/$repoFullName/teams",
    "hooks_url": "https://api.github.com/repos/$repoFullName/hooks",
    "issue_events_url": "https://api.github.com/repos/$repoFullName/issues/events{/number}",
    "events_url": "https://api.github.com/repos/$repoFullName/events",
    "assignees_url": "https://api.github.com/repos/$repoFullName/assignees{/user}",
    "branches_url": "https://api.github.com/repos/$repoFullName/branches{/branch}",
    "tags_url": "https://api.github.com/repos/$repoFullName/tags",
    "blobs_url": "https://api.github.com/repos/$repoFullName/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/$repoFullName/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/$repoFullName/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/$repoFullName/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/$repoFullName/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/$repoFullName/languages",
    "stargazers_url": "https://api.github.com/repos/$repoFullName/stargazers",
    "contributors_url": "https://api.github.com/repos/$repoFullName/contributors",
    "subscribers_url": "https://api.github.com/repos/$repoFullName/subscribers",
    "subscription_url": "https://api.github.com/repos/$repoFullName/subscription",
    "commits_url": "https://api.github.com/repos/$repoFullName/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/$repoFullName/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/$repoFullName/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/$repoFullName/issues/comments{/number}",
    "contents_url": "https://api.github.com/repos/$repoFullName/contents/{+path}",
    "compare_url": "https://api.github.com/repos/$repoFullName/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/$repoFullName/merges",
    "archive_url": "https://api.github.com/repos/$repoFullName/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/$repoFullName/downloads",
    "issues_url": "https://api.github.com/repos/$repoFullName/issues{/number}",
    "pulls_url": "https://api.github.com/repos/$repoFullName/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/$repoFullName/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/$repoFullName/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/$repoFullName/labels{/name}",
    "releases_url": "https://api.github.com/repos/$repoFullName/releases{/id}",
    "deployments_url": "https://api.github.com/repos/$repoFullName/deployments",
    "created_at": "2019-05-15T15:19:25Z",
    "updated_at": "2019-05-15T15:19:27Z",
    "pushed_at": "2019-05-15T15:20:32Z",
    "git_url": "git://github.com/$repoFullName.git",
    "ssh_url": "git@github.com:$repoFullName.git",
    "clone_url": "https://github.com/$repoFullName.git",
    "svn_url": "https://github.com/$repoFullName",
    "homepage": null,
    "size": 0,
    "stargazers_count": 0,
    "watchers_count": 0,
    "language": null,
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": true,
    "forks_count": 0,
    "mirror_url": null,
    "archived": false,
    "disabled": false,
    "open_issues_count": 2,
    "license": null,
    "forks": 0,
    "open_issues": 2,
    "watchers": 0,
    "default_branch": "$kDefaultBranchName"
  },
  "sender": {
    "login": "$login",
    "id": 21031067,
    "node_id": "MDQ6VXNlcjIxMDMxMDY3",
    "avatar_url": "https://avatars1.githubusercontent.com/u/21031067?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/flutter",
    "html_url": "https://github.com/flutter",
    "followers_url": "https://api.github.com/users/flutter/followers",
    "following_url": "https://api.github.com/users/flutter/following{/other_user}",
    "gists_url": "https://api.github.com/users/flutter/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/flutter/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/flutter/subscriptions",
    "organizations_url": "https://api.github.com/users/flutter/orgs",
    "repos_url": "https://api.github.com/users/flutter/repos",
    "events_url": "https://api.github.com/users/flutter/events{/privacy}",
    "received_events_url": "https://api.github.com/users/flutter/received_events",
    "type": "User",
    "site_admin": false
  }
}''';

String generateCheckRunEvent({
  String action = 'created',
  int numberOfPullRequests = 1,
}) {
  String body = '''{
  "action": "$action",
  "check_run": {
    "id": 128620228,
    "node_id": "MDg6Q2hlY2tSdW4xMjg2MjAyMjg=",
    "head_sha": "ec26c3e57ca3a959ca5aad62de7213c562f8c821",
    "external_id": "",
    "url": "https://api.github.com/repos/flutter/flutter/check-runs/128620228",
    "html_url": "https://github.com/flutter/flutter/runs/128620228",
    "details_url": "https://octocoders.io",
    "status": "queued",
    "conclusion": null,
    "started_at": "2019-05-15T15:21:12Z",
    "completed_at": null,
    "output": {
      "title": null,
      "summary": null,
      "text": null,
      "annotations_count": 0,
      "annotations_url": "https://api.github.com/repos/flutter/flutter/check-runs/128620228/annotations"
    },
    "name": "Octocoders-linter",
    "check_suite": {
      "id": 118578147,
      "node_id": "MDEwOkNoZWNrU3VpdGUxMTg1NzgxNDc=",
      "head_branch": "changes",
      "head_sha": "ec26c3e57ca3a959ca5aad62de7213c562f8c821",
      "status": "queued",
      "conclusion": null,
      "url": "https://api.github.com/repos/flutter/flutter/check-suites/118578147",
      "before": "6113728f27ae82c7b1a177c8d03f9e96e0adf246",
      "after": "ec26c3e57ca3a959ca5aad62de7213c562f8c821",
      "pull_requests": [
        {
          "url": "https://api.github.com/repos/flutter/flutter/pulls/2",
          "id": 279147437,
          "number": 2,
          "head": {
            "ref": "changes",
            "sha": "ec26c3e57ca3a959ca5aad62de7213c562f8c821",
            "repo": {
              "id": 186853002,
              "url": "https://api.github.com/repos/flutter/flutter",
              "name": "flutter"
            }
          },
          "base": {
            "ref": "master",
            "sha": "f95f852bd8fca8fcc58a9a2d6c842781e32a215e",
            "repo": {
              "id": 186853002,
              "url": "https://api.github.com/repos/flutter/flutter",
              "name": "flutter"
            }
          }
        }
      ],
      "app": {
        "id": 29310,
        "node_id": "MDM6QXBwMjkzMTA=",
        "owner": {
          "login": "Octocoders",
          "id": 38302899,
          "node_id": "MDEyOk9yZ2FuaXphdGlvbjM4MzAyODk5",
          "avatar_url": "https://avatars1.githubusercontent.com/u/38302899?v=4",
          "gravatar_id": "",
          "url": "https://api.github.com/users/Octocoders",
          "html_url": "https://github.com/Octocoders",
          "followers_url": "https://api.github.com/users/Octocoders/followers",
          "following_url": "https://api.github.com/users/Octocoders/following{/other_user}",
          "gists_url": "https://api.github.com/users/Octocoders/gists{/gist_id}",
          "starred_url": "https://api.github.com/users/Octocoders/starred{/owner}{/repo}",
          "subscriptions_url": "https://api.github.com/users/Octocoders/subscriptions",
          "organizations_url": "https://api.github.com/users/Octocoders/orgs",
          "repos_url": "https://api.github.com/users/Octocoders/repos",
          "events_url": "https://api.github.com/users/Octocoders/events{/privacy}",
          "received_events_url": "https://api.github.com/users/Octocoders/received_events",
          "type": "Organization",
          "site_admin": false
        },
        "name": "octocoders-linter",
        "description": "",
        "external_url": "https://octocoders.io",
        "html_url": "https://github.com/apps/octocoders-linter",
        "created_at": "2019-04-19T19:36:24Z",
        "updated_at": "2019-04-19T19:36:56Z",
        "permissions": {
          "administration": "write",
          "checks": "write",
          "contents": "write",
          "deployments": "write",
          "issues": "write",
          "members": "write",
          "metadata": "read",
          "organization_administration": "write",
          "organization_hooks": "write",
          "organization_plan": "read",
          "organization_projects": "write",
          "organization_user_blocking": "write",
          "pages": "write",
          "pull_requests": "write",
          "repository_hooks": "write",
          "repository_projects": "write",
          "statuses": "write",
          "team_discussions": "write",
          "vulnerability_alerts": "read"
        },
        "events": []
      },
      "created_at": "2019-05-15T15:20:31Z",
      "updated_at": "2019-05-15T15:20:31Z"
    },
    "app": {
      "id": 29310,
      "node_id": "MDM6QXBwMjkzMTA=",
      "owner": {
        "login": "Octocoders",
        "id": 38302899,
        "node_id": "MDEyOk9yZ2FuaXphdGlvbjM4MzAyODk5",
        "avatar_url": "https://avatars1.githubusercontent.com/u/38302899?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/Octocoders",
        "html_url": "https://github.com/Octocoders",
        "followers_url": "https://api.github.com/users/Octocoders/followers",
        "following_url": "https://api.github.com/users/Octocoders/following{/other_user}",
        "gists_url": "https://api.github.com/users/Octocoders/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/Octocoders/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/Octocoders/subscriptions",
        "organizations_url": "https://api.github.com/users/Octocoders/orgs",
        "repos_url": "https://api.github.com/users/Octocoders/repos",
        "events_url": "https://api.github.com/users/Octocoders/events{/privacy}",
        "received_events_url": "https://api.github.com/users/Octocoders/received_events",
        "type": "Organization",
        "site_admin": false
      },
      "name": "octocoders-linter",
      "description": "",
      "external_url": "https://octocoders.io",
      "html_url": "https://github.com/apps/octocoders-linter",
      "created_at": "2019-04-19T19:36:24Z",
      "updated_at": "2019-04-19T19:36:56Z",
      "permissions": {
        "administration": "write",
        "checks": "write",
        "contents": "write",
        "deployments": "write",
        "issues": "write",
        "members": "write",
        "metadata": "read",
        "organization_administration": "write",
        "organization_hooks": "write",
        "organization_plan": "read",
        "organization_projects": "write",
        "organization_user_blocking": "write",
        "pages": "write",
        "pull_requests": "write",
        "repository_hooks": "write",
        "repository_projects": "write",
        "statuses": "write",
        "team_discussions": "write",
        "vulnerability_alerts": "read"
      },
      "events": []
    },
    "pull_requests": [''';

  for (int i = 0; i < numberOfPullRequests; i++) {
    body += '''{
        "url": "https://api.github.com/repos/flutter/flutter/pulls/2",
        "id": 279147437,
        "number": ${i + 2},
        "head": {
          "ref": "changes",
          "sha": "ec26c3e57ca3a959ca5aad62de7213c562f8c821",
          "repo": {
            "id": 186853002,
            "url": "https://api.github.com/repos/flutter/flutter",
            "name": "flutter"
          }
        },
        "base": {
          "ref": "master",
          "sha": "f95f852bd8fca8fcc58a9a2d6c842781e32a215e",
          "repo": {
            "id": 186853002,
            "url": "https://api.github.com/repos/flutter/flutter",
            "name": "flutter"
          }
        }
      }''';
    if (i < numberOfPullRequests - 1) {
      body += ',';
    }
  }
  body += '''],
    "deployment": {
      "url": "https://api.github.com/repos/flutter/flutter/deployments/326191728",
      "id": 326191728,
      "node_id": "MDEwOkRlcGxveW1lbnQzMjYxOTE3Mjg=",
      "task": "deploy",
      "original_environment": "lab",
      "environment": "lab",
      "description": null,
      "created_at": "2021-02-18T08:22:48Z",
      "updated_at": "2021-02-18T09:47:16Z",
      "statuses_url": "https://api.github.com/repos/flutter/flutter/deployments/326191728/statuses",
      "repository_url": "https://api.github.com/repos/flutter/flutter"
    }
  },
  "repository": {
    "id": 186853002,
    "node_id": "MDEwOlJlcG9zaXRvcnkxODY4NTMwMDI=",
    "name": "flutter",
    "full_name": "flutter/flutter",
    "private": false,
    "owner": {
      "login": "flutter",
      "id": 21031067,
      "node_id": "MDQ6VXNlcjIxMDMxMDY3",
      "avatar_url": "https://avatars1.githubusercontent.com/u/21031067?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/flutter",
      "html_url": "https://github.com/flutter",
      "followers_url": "https://api.github.com/users/flutter/followers",
      "following_url": "https://api.github.com/users/flutter/following{/other_user}",
      "gists_url": "https://api.github.com/users/flutter/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/flutter/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/flutter/subscriptions",
      "organizations_url": "https://api.github.com/users/flutter/orgs",
      "repos_url": "https://api.github.com/users/flutter/repos",
      "events_url": "https://api.github.com/users/flutter/events{/privacy}",
      "received_events_url": "https://api.github.com/users/flutter/received_events",
      "type": "User",
      "site_admin": false
    },
    "html_url": "https://github.com/flutter/flutter",
    "description": null,
    "fork": false,
    "url": "https://api.github.com/repos/flutter/flutter",
    "forks_url": "https://api.github.com/repos/flutter/flutter/forks",
    "keys_url": "https://api.github.com/repos/flutter/flutter/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/flutter/flutter/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/flutter/flutter/teams",
    "hooks_url": "https://api.github.com/repos/flutter/flutter/hooks",
    "issue_events_url": "https://api.github.com/repos/flutter/flutter/issues/events{/number}",
    "events_url": "https://api.github.com/repos/flutter/flutter/events",
    "assignees_url": "https://api.github.com/repos/flutter/flutter/assignees{/user}",
    "branches_url": "https://api.github.com/repos/flutter/flutter/branches{/branch}",
    "tags_url": "https://api.github.com/repos/flutter/flutter/tags",
    "blobs_url": "https://api.github.com/repos/flutter/flutter/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/flutter/flutter/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/flutter/flutter/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/flutter/flutter/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/flutter/flutter/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/flutter/flutter/languages",
    "stargazers_url": "https://api.github.com/repos/flutter/flutter/stargazers",
    "contributors_url": "https://api.github.com/repos/flutter/flutter/contributors",
    "subscribers_url": "https://api.github.com/repos/flutter/flutter/subscribers",
    "subscription_url": "https://api.github.com/repos/flutter/flutter/subscription",
    "commits_url": "https://api.github.com/repos/flutter/flutter/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/flutter/flutter/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/flutter/flutter/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/flutter/flutter/issues/comments{/number}",
    "contents_url": "https://api.github.com/repos/flutter/flutter/contents/{+path}",
    "compare_url": "https://api.github.com/repos/flutter/flutter/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/flutter/flutter/merges",
    "archive_url": "https://api.github.com/repos/flutter/flutter/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/flutter/flutter/downloads",
    "issues_url": "https://api.github.com/repos/flutter/flutter/issues{/number}",
    "pulls_url": "https://api.github.com/repos/flutter/flutter/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/flutter/flutter/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/flutter/flutter/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/flutter/flutter/labels{/name}",
    "releases_url": "https://api.github.com/repos/flutter/flutter/releases{/id}",
    "deployments_url": "https://api.github.com/repos/flutter/flutter/deployments",
    "created_at": "2019-05-15T15:19:25Z",
    "updated_at": "2019-05-15T15:21:03Z",
    "pushed_at": "2019-05-15T15:20:57Z",
    "git_url": "git://github.com/flutter/flutter.git",
    "ssh_url": "git@github.com:flutter/flutter.git",
    "clone_url": "https://github.com/flutter/flutter.git",
    "svn_url": "https://github.com/flutter/flutter",
    "homepage": null,
    "size": 0,
    "stargazers_count": 0,
    "watchers_count": 0,
    "language": "Ruby",
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": true,
    "forks_count": 1,
    "mirror_url": null,
    "archived": false,
    "disabled": false,
    "open_issues_count": 2,
    "license": null,
    "forks": 1,
    "open_issues": 2,
    "watchers": 0,
    "default_branch": "master"
  },
  "sender": {
    "login": "flutter",
    "id": 21031067,
    "node_id": "MDQ6VXNlcjIxMDMxMDY3",
    "avatar_url": "https://avatars1.githubusercontent.com/u/21031067?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/flutter",
    "html_url": "https://github.com/flutter",
    "followers_url": "https://api.github.com/users/flutter/followers",
    "following_url": "https://api.github.com/users/flutter/following{/other_user}",
    "gists_url": "https://api.github.com/users/flutter/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/flutter/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/flutter/subscriptions",
    "organizations_url": "https://api.github.com/users/flutter/orgs",
    "repos_url": "https://api.github.com/users/flutter/repos",
    "events_url": "https://api.github.com/users/flutter/events{/privacy}",
    "received_events_url": "https://api.github.com/users/flutter/received_events",
    "type": "User",
    "site_admin": false
  }
}''';
  return body;
}