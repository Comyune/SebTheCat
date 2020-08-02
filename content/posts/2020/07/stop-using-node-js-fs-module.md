+++
title = "Stop Using Node FS module"
description = "There is a better way to access the filesystem in NodeJS! Use fs-jetpack!"
date = "2020-08-01"
tags = [
  "javascript",
  "node",
]
categories = [
  "Tips"
]
+++

The `nodejs` `fs` module has a delapidated syntax, and is generally just a pain to use.
There is a much better solution available now.

<!--more-->

https://github.com/ablipan/fs-jetpack

The library makes the filesystem a breeze to work with, just look:

```javascript
const path = '~/Downloads'
const directoryItems = await jetpack.inspectTreeAsync(path)
```

That will give you a structured list of all files in a directory recursively with additional attributes (like filesize) and other metadata.

I love it!