+++
title = "Enabling GIT Force Push in SourceTree"
description = "How to enable GIT force push in Source Tree"
date = "2020-08-03"
keywords = [
  "sourcetree",
  "git",
  "force",
  "push",
  "enable"
]
tags = [
  "git"
]
categories = [
  "tips"
]
+++

For some reason [Atlassian SourceTree](https://www.sourcetreeapp.com/) not only disallows force push by default, but actively _hides_ the feature.
I suppose this is to prevent people new to the GIT versioning system from performing destructive operations.

Unfortunately, developers often wrongfully assume SourceTree does not support this feature.
Thankfully there is a very simple way to enable force push in the UI.

<!--more-->

{{< img "force-push.png" "How to enable force push" >}}

After going into the application preferences, there is a tiny checkbox squirreled away which enables force push.

__Warning__

With great power comes great responsibility. Make sure you understand what you're doing in GIT and __never__ I mean __never__ force push over a branch you do not "own". Also, if you force push to the `master` branch while sharing a repo with others, you probably deserve to be murdered in your sleep.

You have been warned.

## Further Reading

[How to use GIT reflog to recover lost commits](http://effectif.com/git/recovering-lost-git-commits)