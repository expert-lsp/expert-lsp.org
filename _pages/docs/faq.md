---
title: FAQ
layout: ExpertLspOrg.DocLayout
section: Help
order: 2
---

## How can I install it?

Please see the installation instructions [here](/docs/installation).

## VSCode/Cursor/Etc extension?

- [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/items?itemName=ExpertLSP.expert)
- [Open VSX Registry](https://open-vsx.org/extension/ExpertLSP/expert)

## Nightly releases?

We have nightly [releases](https://github.com/elixir-lang/expert/releases/tag/nightly) published once a day.

We will continue to publish the nightly releases even after we publish the first versioned release.

## Can I get Credo in my editor?

We are still working out how to best support common tools like Credo that provide project diagnostics. At this time, no Credo or other plugins are supported.

## Why are the projects in 3 different GitHub orgs?

We chose to put the main Expert repository in the [elixir-lang](https://github.com/elixir-lang) organization to signal the importance of the project to the Elixir language ecosystem. We created the [expert-lsp](https://github.com/expert-lsp) GitHub organization for any related projects like the website and VSCode extension that don't necessarily need to go in the main `elixir-lang` org.

Spitfire and GenLSP were already [elixir-tools](https://github.com/elixir-tools) projects.

## What is the best way to contribute?

In the near future, look for a `CONTRIBUTING.md` file in the repository. It will explain the best way to report bugs, propose features, and contribute to the project.

In general, the best way to contribute is to use the software and submit detailed bug reports.

## What about 1.0?

We haven't discussed what 1.0 will look like yet.

## How can I sponsor?

Please see the sponsors page [here](/sponsors).

## Can I sponsor on GitHub?

You can sponsor folks individually on GitHub, but you cannot sponsor the "project" on GitHub.

## Is there a logo?

Not yet! If you want to submit something for consideration, please send me an email with your idea/mockup/design to mitch at mitchellhanberg dot com. Please only send original work, I will not consider any GenAI submissions.

## Where can I learn more about the history of the project?

Please see the [History](/history) page for the origin story.

## How did you combine Lexical and Next LS?

We started with the Lexical codebase since it was the more complicated one, then altered it to use components from Next LS like using [Burrito](https://www.youtube.com/watch?v=2vIw2fb9DxA) for releases, [GenLSP](https://github.com/elixir-tools/gen_lsp) for the LSP abstraction and soon will be exploring other parts of Next LS like using SQLite.

You can see more details in my (Mitch) talk at [CodeBeam America 2025](https://www.youtube.com/watch?v=2vIw2fb9DxA) for more information.

