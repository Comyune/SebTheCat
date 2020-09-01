+++
title = 'Can not import fsJetPack "cwd"'
date = "2020-08-01"
tags = [
  "javascript",
  "nodejs",
  "error",
]
categories = [
  "Tips",
  "Errors"
]
+++

The `fs-jetpack` library is a fantastic way to interact with the filesystem in NodeJS.

Be careful, I ended up underestimating its simplicity and made the following mistake!

<!--more-->

## The Error

```html
:8080/#/:1 Uncaught (in promise) ReferenceError: Cannot access 'cwd' before initialization
    at NotesDirectory.listDirectory (webpack:///./src/background/model/notes-directory.js?:16)
    at :8080/electron/js2c/browser_init.js:233
    at IpcMainImpl.<anonymous> (:8080/electron/js2c/browser_init.js:233)
    at IpcMainImpl.emit (events.js:223)
    at WebContents.<anonymous> (:8080/electron/js2c/browser_init.js:173)
    at WebContents.emit (events.js:223)
```

## The Cause

```javascript
import fsJetpack from 'fs-jetpack'

const ROOT_PATH = '~/Downloads'

async function getContents() {
  const contents = await fsJetpack.cwd(
    ROOT_PATH
  ).inspectTreeAsync()

  ...
}
```

## The Solution

Don't be a dope like me. You don't need to set the current working directory in
FSJetpack before inspecting the tree.

Instead, you should just inspect it like so:

```javascript
import fsJetpack from 'fs-jetpack'

const ROOT_PATH = '~/Downloads'

async function getContents() {
  const contents = await fsJetpack.inspectTreeAsync( // <-- The fix
    ROOT_PATH
  )

  ...
}
```