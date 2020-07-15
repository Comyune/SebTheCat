+++
title = "Exporting a Variable with Type-Casting"
description = "Be careful, Godot only allows native types to be exported to the GUI."
date = "2020-06-07T13:27:15+01:00"
tags = [
  "godot",
  "types",
  "gdscript",
]
categories = [
  "Tips",
]
+++

It is common to want to export variables out of the code and into the GUI.
When you export variables in Godot, your normal methods of casting may not work.

```gdscript
export(Node2D) var gem # doesn't work >:-(
```

__Solution-ish(?):__

You sometimes just can't. Sorry.
Godot only supports certain native types for exporting to the GUI.

```gdscript
var player : Node2D
var gem : Node2D
export var count : Integer # Only native types can be exported
```
