---
title: Code Actions
layout: ExpertLspOrg.DocLayout
section: Features
order: 4
---

A code action is a context-aware change that can be applied to your code. For example, fixing a problem or refactoring code.

Expert includes the full refactoring suite from [RefactorEx](https://github.com/gp-pereira/refactorex). You can find the full
list of available refactorings in the [RefactorEx documentation](https://github.com/gp-pereira/refactorex?tab=readme-ov-file#available-refactorings).

Additionally, Expert provides the following code actions:

### Add missing require

When calling a macro from another module, Expert can add the missing `require` statement.

<video autoplay loop muted playsinline controls>
  <source src="/docs/features/code_action_missing_require.mp4" type="video/mp4">
</video>

### Create undefined function

When calling a function that doesn't exist, Expert can create a stub function definition for you.

<video autoplay loop muted playsinline controls>
  <source src="/docs/features/code_action_undefined_function.mp4" type="video/mp4">
</video>


