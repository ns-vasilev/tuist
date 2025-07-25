---
title: Building your projects with Tuist 1.10.0
category: "product"
tags:
  [
    Tuist,
    release,
    swift,
    project generation,
    xcode,
    apple,
    '1.10.0',
    'fastlane',
    'automation',
  ]
excerpt: This blog post introduces the latest version of Tuist, 1.10 Alma, that starts making projects the source of truth for automation too by providing a standard command, "tuist build", for building projects.
author: pepicrft
---

This week’s release is a bit special because we are shipping a feature that we’ve had in the backlog for a long time; we are expanding Tuist’s convenience to automation by providing a new command: `tuist build`.

## Programmable DSLs

Traditionally, teams have resorted to tools programmable DSL and scripts to expose a CLI interface to interact with their projects.
Fastfiles act as a translation between developers’ intents,
and the actual commands that materialize them.
The problem with this approach is that most teams end up with a non-consistent, non-deterministic, and complex automation flows, with a lot of duplicated code across files.

## Making the manifest files the source of truth

What are we doing differently? Rather than giving developers a DSL where they can define all different flavors of workflows,
we **derive a set of standard commands from their projects defined in manifest files.**

Tuist owns those commands and ensures that they work fast and deterministically.
Moreover,
since we are responsible for the generation of projects as well as the logic of those commands,
we can introduce optimizations without you having to do anything on your end; It’s like having a tooling team codified into a tool.

Since the commands are standard, developers can familiarize themselves with them, and use them in any project defined with Tuist.
The commands are designed to be used with zero arguments. That means that users will be able to run the command without passing any arguments.
If you are familiar with `xcodebuild`,
you probably know that there are some required arguments and that you cannot compile your projects without them.
Users can run `tuist build`,
and the projects will compile.
Tuist infers default values to **provide the best experience to the users**.

## Building your projects

The first automation command that we are shipping with this release is `tuist build`.
When used in a directory that contains a `Project.swift` or a `Workspace.swift`, it builds all buildable schemes of non-transitive projects (i.e., the projects in the current directory).

Build also supports indicating the scheme that you’d like to build:

```bash
tuist build MyApp
```

Since Tuist auto-generates schemes for your targets (default behavior), you can use the name of the target.

## Feedback

We are exploring a new dimension in Tuist,
so your feedback is precious to make sure we provide the best automation experience to users. If you are already using Tuist, you can run `tuist update` and then `tuist build` in any of your projects. Alternatively, you can clone the [Microfeatures repository](https://github.com/tuist/microfeatures-example) and try to use the command there.

You can answer to [this topic](https://community.tuist.io/t/feedback-about-the-build-command/63) on our community forum with ideas, bugs, and concerns that you might have.

## What’s next

While users try this out and we collect feedback from them,
we’ll focus on implementing `tuist test` and `tuist run`.
The latter will allow developers to compile and run the apps from their terminals.
Who knows, maybe at some point developers can work on their projects without opening Xcode at all 🤷‍♀️.
