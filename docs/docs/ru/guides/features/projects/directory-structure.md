---
title: Структура директорий
titleTemplate: :title · Проекты · Разработка · Руководства · Tuist
description: Узнайте о структуре Tuist проектов и как их организовать.
---

# Структура директорий {#directory-structure}

Хотя Tuist-проекты обычно применяются для замены проектов Xcode, они не ограничиваются этим вариантом использования. Tuist-проекты также используются для создания других типов проектов, таких как SPM-пакеты, шаблоны, плагины и задачи. В этом документе описывается структура Tuist-проектов и как их организовать. В последующих разделах мы рассмотрим как задавать шаблоны, плагины и задачи.

## Стандартные Tuist-проекты {#standard-tuist-projects}

Tuist-проекты - **наиболее распространенный тип проектов, созданный Туистом.** Они используются для создания приложений, фреймворков и библиотек. В отличие от проектов Xcode, Tuist-проекты заданы с помощью Swift, что делает их более гибкими и простыми для поддержки. Tuist-проекты также более декларативны, что облегчает их чтение и понимание того что они задают. Следующая структура показывает типичный Tuist-проект, который генерирует проект Xcode:

```bash
Tuist.swift
Tuist/
  Package.swift
  ProjectDescriptionHelpers/
Projects/
  App/
    Project.swift
  Feature/
    Project.swift
Workspace.swift
```

- **Каталог Tuist:** Этот каталог имеет две цели. Во-первых, он сигнализирует **где находится корень проекта**. Это позволяет создавать пути относительно корня проекта, а также запускать команды Tuist из любого каталога проекта. Во-вторых, это контейнер для следующих файлов:
  - **ProjectDescriptionHelpers:** Этот каталог содержит Swift-код, доступный во всех манифест-файлах. Манифест-файлы могут использовать `import ProjectDescriptionHelpers`, чтобы использовать код, указанный в этой директории. Использование общего кода полезно для избежания дублирования и обеспечения постоянства в рамках проектов.
  - **Package.swift:** Этот файл содержит зависимости Swift Package для Tuist, для интеграции их в Xcode проекты и для Xcode targets (как [CocoaPods](https://cococapods)) которые настраиваемы и оптимизируемы. Узнайте больше <LocalizedLink href="/guides/features/projects/dependencies">здесь</LocalizedLink>.

- **Корневой каталог**: Корневой каталог проекта, который также содержит папку `Tuist`.
  - <LocalizedLink href="/guides/features/projects/manifests#tuistswift"><bold>Tuist.swift:</bold></LocalizedLink> Этот файл содержит конфигурацию Tuist, разделяемую всеми проектами, рабочими пространствами и окружениями. Например, он может использоваться для отключения автоматической генерации схем или для определения `deployment target` проектов.
  - <LocalizedLink href="/guides/features/projects/manifests#workspace-swift"><bold>Workspace.swift:</bold></LocalizedLink> Этот манифест представляет `Xcode workspace`. Он используется для группировки проектов, а также для добавления дополнительных файлов и схем.
  - <LocalizedLink href="/guides/features/projects/manifests#project-swift"><bold>Project.swift:</bold></LocalizedLink> Этот манифест представляет проект Xcode. Он используется для определения `targets` Xcode, являющихся частью проекта, и их зависимостей.

При взаимодействии с вышеуказанным проектом, команды ожидают найти либо `Workspace.swift` или `Project.swift` файл в рабочей папке или каталоге, указанном с помощью флага `--path`. Манифест должен быть в каталоге или подкаталоге корня проекта, который содержит директорию `Tuist`.

> [!TIP]
> `workspaces` Xcode позволяют разбить проекты на несколько для уменьшения вероятности конфликтов слияний. Если это то, для чего вы используете `workspace`, то он не нужен вам в Tuist. Tuist автоматически генерирует `workspace`, содержащий проекты проекта и их зависимости.

## Swift Пакеты <Badge type="warning" text="beta" /> {#swift-package-badge-typewarning-textbeta-}

Tuist также поддерживает проекты SPM-пакетов. Если вы работаете над пакетом SPM, вам не нужно ничего обновлять. Tuist автоматически найдет ваш коренной `Package.swift` и все возможности Tuist будут работать так, как будто это был манифест файл `Project.swift`.

Для начала запустите `tuist install` и `tuist generate` в вашем SPM-пакете. Теперь у вашего проекта должны быть те же схемы и файлы, которые вы бы увидели при обычной интеграции с Xcode SPM. В дополнение теперь вы можете запускать <LocalizedLink href="/guides/features/build/cache">`tuist cache`</LocalizedLink> и иметь большинство ваших SPM зависимостей и модулей предварительно скомпилированными, что делает последующие сборки чрезвычайно быстрыми.
