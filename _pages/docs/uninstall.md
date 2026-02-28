---
title: Uninstall
layout: ExpertLspOrg.DocLayout
section: Help
order: 3
---

Expert stores data in three locations: a per-project directory, a global engine cache, and (for pre-compiled builds) an unpacked Burrito payload. Removing these will fully clean Expert's state.

## What Expert creates

### Burrito payload

If you installed Expert using a pre-compiled binary from [GitHub releases](https://github.com/elixir-lang/expert/releases), the binary is packaged with [Burrito](https://github.com/burrito-elixir/burrito) and extracts its payload to a platform-specific directory on first run.

> [!note]
>
> This does not apply if you installed Expert via Homebrew, Nix, or built from source.

You can see where the payload is stored by running:

```sh
expert maintenance directory
```

To remove it:

```sh
expert maintenance uninstall
```

### Per-project: `.expert/`

Created in the directory where your editor was opened. A `.gitignore` containing `*` is placed inside so nothing is committed to version control.

```
<project>/.expert/
├── .gitignore
├── expert.log          # Language server logs
├── project.log         # Project node logs (max 1MB)
├── build/              # Compiled project artifacts
├── engine/             # Engine archives
└── indexes/            # Search index data
```

### Global: engine cache

Expert compiles its engine using your project's Elixir and Erlang versions and caches the result in your OS cache directory.

| OS | Path |
|----|------|
| Linux | `~/.cache/expert/` |
| macOS | `~/Library/Caches/expert/` |
| Windows | `%LOCALAPPDATA%\expert\` |

This directory is versioned by Expert version, Elixir version, and ERTS version, so multiple entries can accumulate as you upgrade.

You can also manage this cache with the `expert engine clean` command.

## Full cleanup

Close your editor before running these commands.

If you are using a pre-compiled Burrito build, first remove the unpacked payload:

```sh
expert maintenance uninstall
```

Then remove the engine cache and per-project data:

### Linux

```sh
rm -rf ~/.cache/expert/
rm -rf <project>/.expert/
```

### macOS

```sh
rm -rf ~/Library/Caches/expert/
rm -rf <project>/.expert/
```

### Windows (PowerShell)

```powershell
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\expert"
Remove-Item -Recurse -Force <project>\.expert
```

> [!note]
>
> Replace `<project>` with the path to your Elixir project. Repeat the `.expert/` removal for each project where you use Expert.

## Partial cleanup

You don't always need a full cleanup. Here are some common scenarios:

### Clean a single project

Remove only the per-project directory:

```sh
rm -rf <project>/.expert/
```

Expert will recreate it the next time you open the project.

### Clean the engine cache

If you still have Expert installed, use the built-in command:

```sh
expert engine clean
```

If Expert is no longer installed, manually remove the cache directory:

```sh
# Linux
rm -rf ~/.cache/expert/

# macOS
rm -rf ~/Library/Caches/expert/

# Windows (PowerShell)
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\expert"
```

### Clear project logs

If `.expert/expert.log` has grown large, you can safely delete it while Expert is not running:

```sh
rm <project>/.expert/expert.log
rm <project>/.expert/project.log
```
