---
title: Per-Project Elixir versions
layout: ExpertLspOrg.DocLayout
section: Features
order: 9
---

Expert automatically detects and uses the Elixir and OTP versions configured for each project.

When you open a project, Expert rebuilds itself with your project's Elixir version for full compatibility. This means you don't have to wait for Expert updates when upgrading Elixir—as long as it's installed locally, Expert will use it.

For example, here is Expert built with Elixir 1.15 providing type system diagnostics for a project using Elixir 1.19:

![Per-project Elixir version diagnostics](/docs/features/per_project_versions_diagnostics.png)
