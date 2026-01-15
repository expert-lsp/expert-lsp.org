---
title: Workspace Symbols
layout: ExpertLspOrg.DocLayout
section: Features
order: 8
---

Search for functions, macros, modules, and structs across all projects in your workspace.

The following example uses the [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) Neovim plugin to fuzzy find symbols in the workspace.

<video autoplay loop muted playsinline controls>
  <source src="/docs/features/workspace_symbols.mp4" type="video/mp4">
</video>

## Configuration

The workspaceSymbols.minQueryLength setting controls the minimum number of characters required before the search returns results:

- Set to 0 to return all symbols with an empty query
- Set to any other value to filter results server-side, only returning matches once the query meets the minimum length

See [Configuration](/docs/configuration) for details.
