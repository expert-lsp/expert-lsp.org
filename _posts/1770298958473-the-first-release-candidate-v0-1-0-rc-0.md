---
layout: ExpertLspOrg.PostLayout
title: "The First Release Candidate"
date: February 22, 2026 12:15:00 PM EST
permalink: /:title/
authors: [mitch]
tags: []
---

Hello everyone!

After many months of work, we have cut the first (and second!) release candidate [v0.1.0-rc.1](https://github.com/elixir-lang/expert/releases/tag/v0.1.0-rc.1) for the Expert language server. This has been a huge effort by a number of people and we thank you for the patience and support!

This release marks that effort to [combine Lexical and Next LS](https://www.youtube.com/watch?v=2vIw2fb9DxA) has reached stability and developers can migrate over without fear that their development workflow will be broken.

Before we dive into the release candidate, let's thank the project sponsors, contributors, and review the milestones we've set up.

> [!note] TLDR
> We have published the first release candidate of Expert and need your help by trying it out and reporting bugs. We appreciate all the help.
>
> Do not hesitate to open an issue if you run into problems, have a question about the documentation, or have trouble getting it set up.

## Funding

As of today, the project is financially sponsored by the following companies. This money is donated to the [Erlang Ecosystem Foundation](https://erlef.org/) and is earmarked for Expert development. This money can be distributed to people working full time on Expert. Please see the [Sponsors](/sponsors) for more information.

- [Tauspace](https://www.tauspace.com/)
- [River](https://river.com/)
- [Enigmatic SA](https://enigmatic.swiss/)
- [Fly](https://fly.io/) (Emeritus)

These funds are currently helping to pay [Lucas San Roman](https://github.com/Doorgan) to work on Expert full time. Lucas has been working mostly full time on Expert since June of 2025.

There are also several companies dedicating employees to Expert development.

- [Paweł Świątkowski](https://github.com/katafrakt) from [Jump](https://jump.ai/)
- [Piotr Figiela](https://github.com/Draggu) from [Software Mansion](https://swmansion.com/)

## Contributors

We have been blessed to have had an influx of contributors since we founded Expert. Some hearken back to Lexical and Next LS, as well as brand new contributors.

- **Lucas San Roman** ([Doorgan](https://github.com/Doorgan)): The first person to start working on Expert full time, funded by the EEF earmarked funds. Lucas has been absolutely instrumental in finishing the integration of Lexical and Next LS into what we know as Expert today.
- **Cameron Duley** ([Moosieus](https://github.com/Moosieus)): Cameron has built up the entirety of the [Expert extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ExpertLSP.expert).
- **Paweł Świątkowski** ([katafrakt](https://github.com/katafrakt)): Has been consistently providing patches and new features driven from real world usage at Jump.
- **Gabriel Pereira** ([gp-pereira](https://github.com/gp-pereira)): Integrated his library [Refactorex](https://github.com/gp-pereira/refactorex) into Expert, bringing support for a litany of refactors. You can read his paper on building Refactorex (includes shoutouts to [GenLSP](https://github.com/elixir-tools/gen_lsp) and [Sourceror](https://github.com/doorgan/sourceror)) [here](https://doi.org/10.5753/se4fp.2025.13088)!

A list of all contributors since ElixirConf 2025 (as of early February 2026):

| | | | |
|---|---|---|---|
| [Dorgan](https://github.com/doorgan) | [Paweł Świątkowski](https://github.com/katafrakt) | [Tomasz Mazur](https://github.com/AHGIJMKLKKZNPJKQR) | [Paul Gideon Dann](https://github.com/giddie) |
| [Dan Janowski](https://github.com/danj3) | [Leon Qadirie](https://github.com/leonqadirie) | [Peter Ullrich](https://github.com/PJUllrich) | [Gabriel Oliveira](https://github.com/ogabriel) |
| [Mitchell Hanberg](https://github.com/mhanberg) | [Joram Schrijver](https://github.com/jorams) | [Eksperimental](https://github.com/eksperimental) | [Rolf Andersen](https://github.com/rmand97) |
| [Amadeus Folego](https://github.com/badosu) | [Cameron Duley](https://github.com/Moosieus) | [Rock Neurotiko](https://github.com/rockneurotiko) | [Thanabodee Charoenpiriyakij](https://github.com/wingyplus) |
| [Ryan Despain](https://github.com/soisyourface) | [Arran Øystein Kostveit Gabriel](https://github.com/arrangabriel) | [Kevin Schweikert](https://github.com/kevinschweikert) | [Luca Hagel](https://github.com/luhagel) |
| [Worming](https://github.com/worming004) | [Hugo Baraúna](https://github.com/hugobarauna) | [Niklas H](https://github.com/niklas) | [Damir Batinović](https://github.com/Damirados) |
| [Andy LeClair](https://github.com/andyleclair) | [José Valim](https://github.com/josevalim) | [Nicolò G.](https://github.com/nickgnd) | [Hovis](https://github.com/hovissimo) |
| [afterlook](https://github.com/afterlook) | [Adam C. Stephens](https://github.com/adamcstephens) | [Rasheed Atanda](https://github.com/heywhy) | [Ang](https://github.com/kianmeng) |
| [Mikael Muszynski](https://github.com/linduxed) | [rktjmp](https://github.com/rktjmp) | [Flávio Escobar](https://github.com/flavioescobar) | [Wilhelm Kirschbaum](https://github.com/wkirschbaum) |
| [Oliver Kriska](https://github.com/oliver-kriska) | [Erick Navarro](https://github.com/erickgnavar) | [Artem Solomatin](https://github.com/solar05) | [Maks E.](https://github.com/salfum) |
| [Brian Cardarella](https://github.com/bcardarella) |  |  |  |

## v0.1.0-rc.1

Shortly after our public announcement during [José's keynote at ElixirConf 2025](https://youtu.be/BUOTLZOyLvc?t=1427), I triaged the work into GitHub issues and organized them into milestones. These milestones are the priority list for contributors needing to decide what to work on.

We are prioritizing stability first, then integrating missing features from Next LS and ElixirLS, and then brand new features.

- [v0.1](https://github.com/elixir-lang/expert/milestone/1): Captures all work to get Expert to be ready to be daily driven by intrepid early adopters. We continuously add bugs to this milestone as we find them. This also included getting it running on Windows, which was missing from [Lexical](https://github.com/lexical-lsp/lexical) and [Next LS](https://github.com/elixir-tools/next-ls).
- [v0.2](https://github.com/elixir-lang/expert/milestone/2): Captures work to integrate missing features from [Next LS](https://github.com/elixir-tools/next-ls).
- [v0.3](https://github.com/elixir-lang/expert/milestone/3): Captures work to integrate missing features from [ElixirLS](https://github.com/elixir-lsp/elixir-ls).
- [v0.4](https://github.com/elixir-lang/expert/milestone/4): Captures any new features not present in either [Lexical](https://github.com/lexical-lsp/lexical), [Next LS](https://github.com/elixir-tools/next-ls), or [ElixirLS](https://github.com/elixir-lsp/elixir-ls).

## Features

You can check out the [documentation](/docs) to see a list of all features and some videos of them in action.

A quick list includes:

- Compiler Diagnostics
- Completions
- Document Symbols (Code Outline, Breadrumbs)
- Go to definition
- Monorepo support (Workspace folders)
- Workspace symbols
- Refactors (Code Actions)
- Documentation on Hover
- Formatting

## Code

If you'd like to contribute or open an issue, you can find our various projects here.

- [elixir-lang/expert](https://github.com/elixir-lang/expert): the Expert source code
- [expert-lsp/vscode-expert](https://github.com/expert-lsp/vscode-expert): the Visual Studio Code extension
- [elixir-tools/spitfire](https://github.com/elixir-tools/spitfire): our error tolerant Elixir parser
- [elixir-tools/gen_lsp](https://github.com/elixir-tools/gen_lsp): the language server protocol process abstraction
- [expert-lsp/expert-lsp.org](https://github.com/expert-lsp/expert-lsp.org): the source code to this website

## How to help

Please try the release candidate and report any bugs you come across! Getting bug reports with proper reproduction cases along with all relevant information like your `.expert/expert.log`, OS, Elixir version, Erlang version, project size, etc is extremely helpful.

## FAQ

<details>
<summary class="font-bold">How can I install it?</summary>

Please see the installation instructions [here](/docs/installation).

</details>

<details class="mt-4">
<summary class="font-bold">VSCode/Cursor/Etc extension?</summary>

- [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/items?itemName=ExpertLSP.expert)
- [Open VSX Registry](https://open-vsx.org/extension/ExpertLSP/expert)

</details>

<details class="mt-4">
<summary class="font-bold">Nightly releases?</summary>

We have nightly [releases](https://github.com/elixir-lang/expert/releases/tag/nightly) published once a day.

We will continue to publish the nightly releases even after we publish the first versioned release.

</details>

<details class="mt-4">
<summary class="font-bold">Can I get Credo in my editor?</summary>

We are still working out how to best support common tools like Credo that provide project diagnostics. At this time, no Credo or other plugins are supported.

</details>

<details class="mt-4">
<summary class="font-bold">Why are the projects in 3 different GitHub orgs?</summary>

We chose to put the main Expert repository in the [elixir-lang](https://github.com/elixir-lang) organization to signal the importance of the project to the Elixir language ecosystem. We created the [expert-lsp](https://github.com/expert-lsp) GitHub organization for any related projects like the website and VSCode extension that don't necessarily need to go in the main `elixir-lang` org.

Spitfire and GenLSP were already [elixir-tools](https://github.com/elixir-tools) projects.

</details>

<details class="mt-4">
<summary class="font-bold">Why are you doing a release candidate?</summary>

We want people to know that we think its ready, but we need broader testing still. There are only so many people who are up to installing a nightly unstable build of a language server and hopefully publishing a release candidate will inspire more people to try it.

Once we capture and fix the issues reported with RC 0, we will release an RC 1 to verify with users that those bugs are fixed. Depending on the amount of issues reported during RC 1, we will publish the full 0.1.0 release.

Hopefully this process takes 2-3 weeks.

</details>

<details class="mt-4">
<summary class="font-bold">What is the best way to contribute?</summary>

In the near future, look for a `CONTRIBUTING.md` file in the repository. It will explain the best way to report bugs, propose features, and contribute to the project.

In general, the best way to contribute is to use the software and submit detailed bug reports.

</details>

<details class="mt-4">
<summary class="font-bold">What about 1.0?</summary>

We haven't discussed what 1.0 will look like yet.

</details>

<details class="mt-4">
<summary class="font-bold">How can I sponsor?</summary>

Please see the sponsors page [here](/sponsors).

</details>

<details class="mt-4">
<summary class="font-bold">Can I sponsor on GitHub?</summary>

You can sponsor folks individually on GitHub, but you cannot sponsor the "project" on GitHub.

</details>

<details class="mt-4">
<summary class="font-bold">Is there a logo?</summary>

Not yet! If you want to submit something for consideration, please send me an email with your idea/mockup/design to mitch at mitchellhanberg dot com. Please only send original work, I will not consider any GenAI submissions.

</details>

<details class="mt-4">
<summary class="font-bold">Where can I learn more about the history of the project?</summary>

Please see the [History](/history) page for the origin story.

</details>

<details class="mt-4">
<summary class="font-bold">How did you combine Lexical and Next LS?</summary>

We started with the Lexical codebase since it was the more complicated one, then altered it to use components from Next LS like using [Burrito](https://www.youtube.com/watch?v=2vIw2fb9DxA) for releases, [GenLSP](https://github.com/elixir-tools/gen_lsp) for the LSP abstraction and soon will be exploring other parts of Next LS like using SQLite.

You can see more details in my (Mitch) talk at [CodeBeam America 2025](https://www.youtube.com/watch?v=2vIw2fb9DxA) for more information.

</details>
