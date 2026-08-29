---
title: Installation
layout: ExpertLspOrg.DocLayout
section: Getting Started
order: 1
---

> [!caution] Work In Progress
> 
> Documentation is still a work in progress!

Before starting to use Expert, you need to have it installed and ready on your machine. There are many methods available. The editor extension for VSCode and its forks, for example, will install it for you, if you want. Other editors (notably Neovim via Mason) may offer in-editor installation too. Check the [Editors](/docs/editors) page for details.

If the editor does not offer the installation method or you want to install manually anyway, you have a range of options available.

## Package Managers

### Homebrew

You can use Homebrew to install the latest version of Expert.

```sh
brew install expert
```

### Nix

#### Nixpkgs

Expert can be added to your devShells or used with `nix run nixpkgs#expert`

#### Flake

We provide a flake that can be used.

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    expert = {
      url = "github:expert-lsp/expert";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      expert,
    }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      forAllSystems =
        f:
        nixpkgs.lib.genAttrs systems (
          system:
          f {
            inherit system;
            pkgs = nixpkgs.legacyPackages.${system};
          }
        );
    in
    {
      devShells = forAllSystems (
        {
          system,
          pkgs,
        }:
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              elixir_1_19
              erlang
              expert.packages.${system}.default
            ];
          };
        }
      );
    };
}
```

#### beam-flakes

> [!caution] In Progress
> 
> Expert is not yet implemented in beam-flakes.

Not currently supported in [beam-flakes](https://github.com/elixir-tools/nix-beam-flakes).

### Archlinux

Install the AUR [expert-git](https://aur.archlinux.org/packages/expert-git) package.

```sh
yay -s expert-git
```

or

```sh
paru -s expert-git
```

## Version Managers

### Mise

[Mise](https://mise.en.dev/) can install Expert, supporting all released versions, including on Windows.

#### Install

```sh
mise use expert
```

#### List versions

```sh
mise ls-remote expert
```

## GitHub Releases

> [!caution]
> 
> These commands are oriented for *nix systems. For Windows, PRs are welcome to ensure they work!

You can easily install Expert with the [gh](https://github.com/cli/cli) CLI and save it somewhere on your machine.

```sh
# Linux AMD64
gh release download nightly \
  --pattern *linux_amd64 \
  --output ~/.local/bin/expert \
  --clobber \
  --repo expert-lsp/expert

# Apple Silicon
gh release download nightly \
  --pattern *darwin_arm64 \
  --output ~/.local/bin/expert \
  --clobber \
  --repo expert-lsp/expert

chmod +x ~/.local/bin/expert
```

You can also manually download the executable from the [releases](https://github.com/expert-lsp/expert/releases) page.

## Source

> [!caution]
> 
> These commands are oriented for *nix systems. For Windows, PRs are welcome to ensure they work!

> [!tip]
> 
> Expert uses [just](https://just.systems/man/en/). You can install it with your systems package manager.

Recipes for building from source are located in our [justfile](https://github.com/expert-lsp/expert/blob/main/justfile).
The following builds a release for your OS, copies it to `~/.local/libexec/expert`, and symlinks
the executable to `~/.local/bin/expert`.

```sh
just install
```

You can install it somewhere other than `~/.local` with the `--prefix` flag.
