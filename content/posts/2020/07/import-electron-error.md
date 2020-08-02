+++
title = "Electron Import Error in Renderer Process"
description = "'fs.existsSync is not a function' when importing Electron JS in browser process"
date = "2020-08-02"
tags = [
  "electron",
  "javascript",
]
categories = [
  "SebTheCat.com",
]
+++

Today on stream
we ran into an interesting error where we couldn't import the electron library correctly within the render (browser) process.

<!--more-->

## The Error

```html
index.js?bdb9:7 Uncaught TypeError: fs.existsSync is not a function
    at getElectronPath (index.js?bdb9:7)
    at eval (index.js?bdb9:18)
    at Object../node_modules/electron/index.js (chunk-vendors.js:2325)
    at __webpack_require__ (app.js:849)
    at fn (app.js:151)
    at eval (notes-directory.js?b80e:1)
    at Module../src/plugins/notes-directory.js (app.js:1691)
    at __webpack_require__ (app.js:849)
    at fn (app.js:151)
    at eval (main.js:16)
```

## The Cause

```javascript
import Vue from 'vue'
import electron from 'electron'

Vue.use({
  install: function() {
    console.log('Electron', electron)
  }
})
```

## The Solution

The solution is to circumvent [https://webpack.js.org/](Webpack's)

```javascript
import Vue from 'vue'
const electron = window.require('electron')

Vue.use({
  install: function() {
    console.log('Electron', electron)
  }
})
```

## Resources

* <https://stackoverflow.com/questions/53841364/how-to-resolve-fs-existssync-is-not-a-function>
