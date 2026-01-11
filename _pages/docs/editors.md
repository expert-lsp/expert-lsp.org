---
title: Editors
layout: ExpertLspOrg.DocLayout
section: Getting Started
order: 3
---

## Visual Studio Code

> [!caution] In Progress
> 
> This extension is not yet published to the marketplace.

[expert-lsp/vscode-expert](https://github.com/expert-lsp/vscode-expert) is the official Visual Studio Code extension.

**The extension is not yet stable and is not yet published to the extension marketplaces.**

The extension will take care of installing the Expert for you if you wish.

## Neovim

### elixir-tools.nvim

> [!caution] In Progress
> 
> This plugin does not yet support Expert

> [!caution]
> 
> If you are using a Neovim distribution like [LunarVim](https://www.lunarvim.org/), [AstroVim](https://astronvim.com/), or [NVChad](https://nvchad.com/), please make sure to disable any Elixir LSP support that comes out of the box, as it will interfere with `elixir-tools.nvim`.

There is no "official" plugin for Neovim, but the [elixir-tools.nvim](https://github.com/elixir-tools/elixir-tools.nvim) plugin was created and is maintained by an Expert core team member.

**Expert support in elixir-tools.nvim is still in progress.**

The plugin will take care of installing the Expert for you if you wish.

### nvim-lspconfig

[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) supports Expert.

```lua
vim.lsp.enable "expert"
```

## Zed

Expert is managed by the first party Zed [Elixir Extension](https://github.com/zed-extensions/elixir/tree/main).

Head to the Zed documentation to [learn more about installing extensions](https://zed.dev/docs/extensions/installing-extensions).

## Helix

Add the following config to your `~/.config/helix/languages.toml`.

```toml
[[language]]
name = "elixir"
scope = "source.elixir"
language-server = { command = "path/to/expert", args = ["--stdio=true"] }
```

If you are using the latest git version of helix use this:

```toml
[[language]]
name = "elixir"
scope = "source.elixir"
language-servers = ["expert"]

[language-server.expert]
command = "path/to/expert"
args = ["--stdio=true"]
```

## Emacs

The emacs instructions assume you're using **use-package**.

### Eglot

#### Emacs version >= 30

```emacs-lisp
(use-package eglot
  :ensure nil ;; eglot is included in emacs >= 29  
  
  :config
  (setf (alist-get '(elixir-mode elixir-ts-mode heex-ts-mode)
                   eglot-server-programs
                   nil nil #'equal)
        (eglot-alternatives '(("path/to/expert" "--stdio"))))

  ;; other config
  )
```

#### Emacs version <= 29

```emacs-lisp
(use-package lsp-mode
  :ensure nil ;; eglot is included in emacs >= 29, use :ensure t if using an older version
  
  :config
  (setf (alist-get 'elixir-mode eglot-server-programs)
        (eglot-alternatives '(("path/to/expert" "--stdio"))))

  ;; other config
  )
```

> [!note]
> 
> If you are using **elixir-ts-mode** instead of **elixir-mode** replace **(alist-get 'elixir-mode eglot-server-programs)** from the snippet above with **(alist-get '(elixir-mode elixir-ts-mode heex-ts-mode) eglot-server-programs)**


### lsp-mode

```emacs-lisp
(use-package lsp-mode
  :ensure t
  
  :config
  (lsp-elixir-server-command '("path/to/expert" "--stdio")))
  
  ;; other config
  )
```

## Sublime

> [!warning] TODO
