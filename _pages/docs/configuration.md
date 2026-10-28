---
title: Configuration
layout: ExpertLspOrg.DocLayout
section: Getting Started
order: 3
---

Expert supports the following configuration options.

## Settings Schema

```json
{
  "workspaceSymbols": {
    "minQueryLength": 2
  },
  "logLevel": "info",
  "elixirExecutablePath": "/absolute/path/to/elixir",
  "erlangExecutablePath": "/absolute/path/to/erl",
  "autoFetchDependencies": true,
  "compileOnType": true
}
```

## Available Settings

| Setting | Type | Default | Description |
|---------|------|---------|-------------|
| `workspaceSymbols.minQueryLength` | integer | `2` | Minimum characters required before workspace symbol search returns results. Set to `0` to return all symbols with an empty query. |
| `logLevel` | string | `"info"` | Minimum severity of log messages forwarded to the editor. Valid values: `"error"`, `"warning"`, `"info"`, `"log"`. |
| `elixirExecutablePath` | string | `null` | Path to the Elixir executable Expert should use for building and running project engines. Sending `null` clears the override. Expert uses the path as provided and does not validate it. |
| `erlangExecutablePath` | string | `null` | Path to the Erlang `erl` executable Expert should use when resolving the project Erlang runtime. Sending `null` clears the override. Expert uses the path as provided and does not validate it. |
| `autoFetchDependencies` | boolean | `true` | Automatically run `mix deps.get` when project engine startup fails because dependencies are missing or stale. |
| `compileOnType` | boolean | `true` | Compile eligible open documents after each change to provide file-level diagnostics. Disable this to avoid transient compiler diagnostics while typing. |
