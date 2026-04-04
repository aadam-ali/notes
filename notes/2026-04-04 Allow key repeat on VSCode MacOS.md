---
title: Allow key repeat on VSCode (MacOS)
date: 2026-04-04
---
After installing the Vim plugin for VSCode on MacOS, I noticed that key
presses weren't repeating. Thus requiring me to repetitively press a key
e.g. `hjkl` to move around a file. To achieve the desired behaviour of
pressing a key and keeping it pressed, you need to disable the Apple
press and hold functionality (this allows you to type accented
characters).

To disable Apple press and hold for VSCode:

`defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool
false`

Then restart VSCode

---

To re-enable Apple press and hold for VSCode:

`defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool
true`

Related:

- <https://stackoverflow.com/questions/39972335/how-do-i-press-and-hold-a-key-and-have-it-repeat-in-vscode>
