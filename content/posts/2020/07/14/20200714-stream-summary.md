+++
title = "July 13th 2020 - Stream Summary"
description = "Developing a productivity application using Electron, Typescript and VueJS"
date = "2020-07-13"
tags = [
  "electron",
  "typescript",
  "vuejs",
  "frontend",
  "javascript",
  "productivity",
]
categories = [
  "Streams",
]
+++

## The Stream {{% fontawesome twitch %}}

Today we started development on a productivity tool called __SeeWhy__.
It's an integrated markdown editor, file browser and automation tool.

[__Come and enjoy the stream live!__](https://twitch.tv/comyune) 

Or you can check out our [past videos here](https://www.twitch.tv/comyune/videos).


## Source Code {{% fontawesome github %}}

The boilerplate repository we put together yesterday is available on __Github.com__ here:


[__{{% fontawesome github %}} Comyune/electron-typescript-vue-boilerplate__](https://github.com/Comyune/electron-typescript-vue-boilerplate)

<!--more-->


## Overview

__SeeWhy__ is the combination of a few things:

* A simple markdown editor.
* A digital workflow based on the "bullet journal" pattern.
* A file browser which revolves around directory traversal using primarily keyboard shortcuts.
* An simple automation tool which uses markdown, JSON and TOML as the input for content pipelines.


## Tooling

We will be using the following technologies and tools:

* __Electron__ to provide the basic "application" wrapper, which will allow us to easily deploy our application as a MacOS, Windows, iOS and Android application all-in-one.

* __VueJS__ to provide us with a framework for the application UI.

* __Typescript__ a typed language that compiles to Javascript, to make development as error-free as possible.

* __ESLint__ a code formatting tool for JavaScript which ensures we adhere to industry standard formatting.

* __Jest__ a unit testing framework for testing JavaScript components.

* __Cypress__ an E2E testing framework for automating complex UI interactions through the browser.

* __Babel__ a JavaScript transpiler which ensures we can use the latest ECMAScript features in our project.

* __SASS__ a CSS preprocessor which allows a number of useful CSS utility functions.

* __Spectron__ a unit testing framework specifically to test Electron applications.


## Boilerplate

Yesterday we spent most of the day setting up our boilerplate project.
As you can see above, we had a complex list of requirements, and getting all these tools to play nice with eachother was... I'm going to go with "fun".

We tried a number of different boilerplate projects available for
free online, but unfortunately none of them seemed to provide _exactly_ what
we were really after.

We tried many of the boilerplates
[here](https://github.com/sindresorhus/awesome-electron#boilerplates) to no avail.

Ultimately, we started fresh using the `vue-cli-service` and the `vue ui` command. We set up a `VueJS` project with `ESLint`, `Typescript`, `Jest`, `Cypress` and `Dart-SASS`.

Then we installed the [__electron-builder__ plugin for __VueJS__](https://nklayman.github.io/vue-cli-plugin-electron-builder/).
We configured this correctly, but hit a snag.

It seems a bug in the newer versions of __Electron__ caused the __Typescript__ compiler to trip. We were able to version lock our `@node/types` package to `12.12.21` to ensure we had the correct typing available. [Github issue electron/electron#23701](https://github.com/electron/electron/issues/23701) 


## Useful Resources {{% fontawesome link %}}

### Electron

* [__Electron Homepage__ - Documentation and resources for getting started with Electron](https://www.electronjs.org/docs/tutorial/application-architecture#using-electron-apis)
* [__Awesome Electron__ - Recommended Resources for Electron development](https://github.com/sindresorhus/awesome-electron)
* [__Electron Builder__ - Build and release tools for Electron projects](https://www.electron.build/)
* [__Electron Forge__ - An alternative build and release tool for Electron projects](https://www.electronforge.io/)
* [__Electron Repository__ - Git repository for the Electron codebase](https://github.com/electron/electron)
* [__Spectron__ - Unit testing tools for Electron](https://www.electronjs.org/spectron)

### VueJS

* [__Awesome Vue__ - Recommended Resources for VueJS development](https://github.com/vuejs/awesome-vue)
* [__VueJS Devtools for Chrome__ - Chrome extension for debugging VueJS code](https://chrome.google.com/webstore/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd/related)
* [__VueJS Typescript Documentation__ - A Guide for getting started with Vue using Typescript](https://vuejs.org/v2/guide/typescript.html)
* [__Element UI Vue Plugin__ - A VueJS plugin for using the Element UI framework in Vue](https://github.com/ElementUI/vue-cli-plugin-element)
* [__Vue CLI__ - Development tool to build and configure Vue applications](https://cli.vuejs.org/)

### Other

* [__LogLevel__ - a minimal logging package for NodeJS and Javascript projects](https://github.com/pimterry/loglevel)
* [__Jest__ - a unit testing tool for Javascript](https://jestjs.io/docs/en/configuration)
* [__Dart-SASS vs. Node-SASS__ A comparison on Stack Overflow](https://stackoverflow.com/questions/56150402/vue-cli-css-pre-processor-option-dart-sass-vs-node-sass)
* [__EditorConfig for Typescript__ - Microsoft's recommended editor settings for Typescript projects](https://github.com/microsoft/TypeScript/blob/master/.editorconfig)