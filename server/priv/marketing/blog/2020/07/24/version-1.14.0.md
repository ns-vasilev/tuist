---
title: 1.14.0 Spezi, a release packed with improvements
category: "product"
tags: [Tuist, release, swift, project generation, xcode, apple, '1.14.0', 'cache']
excerpt: In this blog post we present the improvements and bug fixes that we included in the version of Tuist 1.14.0
author: pepicrft
type: release
---

Hola 👋,

It's Friday, and that means time for a new Tuist release. With the aim of releasing more often, we are pushing out a new release, 1.14.0, which we named after [Paulaner's Spezi](https://en.wikipedia.org/wiki/Spezi). We are not including major features in this release, but a lot of minor improvements and fixes that will make the experience of using Tuist better. In this also-short blog post, I'll go through those improvements and bug fixes that are part of the release:

### Disable SwiftLint in the generated source files

With the introduction of [synthesized accessors for resources](https://docs.old.tuist.io/guides/resources/) some users reported that SwiftLint failed because it linted the generated files. We [fixed](https://github.com/tuist/tuist/pull/1574) it by adding annotations in the generated files to disable [SwiftLint](https://github.com/realm/SwiftLint) in them.

### Fix the path resolution for synthesized resource accessors

Continuing with fixes in the synthesized resource accessors, some users reported that `Bundle.module` returns an invalid `Bundle` when the target is a framework or an app. That's already [fixed](https://github.com/tuist/tuist/pull/1575) in Tuist 1.14.0

### Read Core Data version from .xcurrentversion

Before this version, developers had to specify the version of the current Core Data model in the project manifest. Since that's information that is already defined in the file `.xcurrentversion` file, users ended up with two sources of truth for the same attribute. From [this version](https://github.com/tuist/tuist/pull/1572), `.xcurrentversion` is used as the source of truth.

### Support generating projects with targets from the cache

We added support for the `--cache` argument to the `generate` command. It used to be an argument only supported by the `focus` command, but now developers can also generate projects with targets from the cache.

### Improve error when a target has the same dependency defined twice.

We've improved the error thrown when a target has the same dependency defined more than once. The error [now includes](https://github.com/tuist/tuist/pull/1573) the name of the target.

And that's it for this week. We wish you all a happy weekend, and we'll be back next Friday with a new release and more and better features to make the experience of working with Xcode great.
