---
title: Tuist 1.2.0 - Bugfixes, improvements and future direction
category: "product"
tags: [tuist, release, swift, 1.2.0, project generation, xcode, swift]
excerpt: The newest release brings you many bugfixes and improvements. However with the number of contributors steadily growing the team has also been busy thinking and writing about the direction of Tuist. We have a rough plan for Tuist 2.0 and work has started on compiling a manifesto to explain a bit more about the goals and values of the project.
author: vytis
---

We are slowly learning how to do smaller bi-weekly releases. This release was planned for last week but it was postponed because there were not enough changes. However lots of new things got merged recently and Tuist 1.2.0 is here for you to enjoy!

## New contributors

Firstly, warm welcome to another first-time Tuist contributor [Maciej Piotrowski](https://github.com/paciej00) 👏👏👏. He improved the API introduced in the previous release for excluding files from a target. It makes exclude patterns more flexible which can be very useful when migrating an existing project to Tuist!

## Future of Tuist

There are plenty of ideas floating around what other features Tuist should have and [Pedro](https://github.com/pepicrft) laid them out in nicely in [The journey towards Tuist 2.0](https://github.com/tuist/tuist/issues/951). In addition, he also opened a work-in-progress PR for Tuist's [manifesto](https://github.com/tuist/tuist/pull/952). With more and more people joining the project it's very important to lay down the core principles in writing to ensure that everyone is up to speed. For more practical information we also have a new [Best Practices](https://docs.old.tuist.io/building-at-scale/best-practices/) section on the website. It is quite short at the moment, but will contain a growing list of things that can be useful for both new Tuist users and developers trying to improve their setup.

## Focus on improving performance

A common complaint, especially for bigger projects, is the time it takes to generate the project. The main focus until this point was adding features, but time has come to start thinking about performance. End of last year [Kas](https://github.com/kwridan) proposed an [idea](https://github.com/tuist/tuist/issues/820) to start performance testing. First part of this initiative already got [merged](https://github.com/tuist/tuist/pull/890). The [Fixture Generator](https://github.com/tuist/tuist/tree/main/projects/fixturegen) tool will allow us to easily generate a project with potentially hundreds of targets and iron out performance issues much more systematically. It is just the beginning and the plan is eventually to integrate performance testing as part of GitHub checks so we can be sure that adding new features would not have an impact on project generation times.

## Full Changelog

Of all the things mentioned, there are also plenty of bugfixes and improvements in this release. The full changelog can be found on the [release page](https://github.com/tuist/tuist/releases/tag/1.2.0).
