+++
title = "Godot 2DKinematicObject Only Colliding in One Direction"
description = "How to fix 2D collisions in Godot only operating in one direction."
date = "2020-06-07T13:27:15+01:00"
menu = "main"
tags = [
  "2d",
  "godot",
  "collision",
  "problem",
  "phyics",
  "gdscript",
  "gamedev",
]
categories = [
  "Tips",
]
+++

Had an issue where my `KinematicBody2D` would only collide with `StaticBody2D`s in one direction.
Tried switching one-way collisions on and off. Nothing.
Tried changing collision shape to concave. Nothing.

I was an idiot and had my collision logic doing the following:

```gdscript
collision = move_and_collide(velocity)
velocity *= collision.normal
```

Instead I needed to use the `bounce` method on the `KinematicBody2D`. As follows:

```gdscript
collision = move_and_collide(velocity)
velocity = bounce()
```

__More Info:__

https://docs.godotengine.org/en/stable/classes/class_kinematicbody2d.html