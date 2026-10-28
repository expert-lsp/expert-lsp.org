---
title: Remote Shell
layout: ExpertLspOrg.DocLayout
section: Features
order: 15
---

Expert provides a remote IEx shell connected to the running language server. Use it to inspect processes, change running code, or launch `:observer` from inside Expert.

## Visual Studio Code

The [Expert extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ExpertLSP.expert) includes built-in remote shell support. Open the Command Palette and run `Expert: Open remote shell` to start a connected IEx session in the integrated terminal.

## Other editors

Editor integrations can request the connection details through `workspace/executeCommand`:

```json
{
  "command": "connectionDetails",
  "arguments": []
}
```

The response includes a `command` field that starts the remote shell. Run that command in a terminal to connect to Expert.

See the [Expert development documentation](https://github.com/expert-lsp/expert/blob/main/pages/development.md#remote-shell) for the complete response fields.
