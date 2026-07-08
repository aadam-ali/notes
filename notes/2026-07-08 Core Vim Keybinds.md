---
title: Core Vim Keybinds
date: 2026-07-08
tags: [keyboard]
---
Some things to keep in mind when referring to this note:
* The use of `/` in the `Key` column indicates that the separated keybinds
  perform the same action
* The use of `OR` and `AND` in the `Action` column indicates the difference
  between the keys separated by `,` in the `Key` column
* The use of `()` around keys indicates that an explicit description is
  not given

## Navigating

| Keys                         | Action                                                          |
| ---------------------------- | --------------------------------------------------------------- |
| `:e <file>` / `:edit <file>` | Open file                                                       |
| `h`, `j`, `k`, `l`           | Left, down, up, right                                           |
| `0`, `$`, `^`                | Move to start OR end of line, OR first non-whitespace character |
| `w`, `W`                     | Jump to start of next word AND ignore punctuation               |
| `b`, `B`                     | Jump to start of current word AND ignore punctuation            |
| `e`, `E`, `ge`               | Jump to end of current word AND ignore punctuation              |
| `ge`                         | Jump to end of previous word                                    |
| `Ctrl+d`, `Ctrl+u`           | Scroll half a page down OR up                                   |
| `Ctrl+f`, `Ctrl+b`           | Scroll a full page down OR up                                   |
| `gg`, `G`                    | Jump to first OR last line of file                              |
| `m<char>`                    | Set a mark                                                      |
| `` `<char>``                 | Jump to a mark                                                  |
| `:<num>` / `<num>G`          | Jump to line                                                    |
| `%`                          | Jump between start and end of matching pair                     |
| `(`, `)`                     | Jump to start of previous OR next sentence                      |
| `{`, `}`                     | Jump to start of previous OR next paragraph                     |

## Editing

| Keys                    | Action                                                          |
| ----------------------- | --------------------------------------------------------------- |
| `i`, `I`                | Enter insert mode before cursor OR from start of line           |
| `a`, `A`                | Enter insert mode after cursor OR from end of line (append)     |
| `o`, `O`                | Enter insert mode on a new line below OR above the current line |
| `p`, `P`                | Paste after OR before cursor                                    |
| (`d`), `d0`, `d$`, `dd` | Delete from cursor to start OR end of line, OR entire line      |
| (`y`), `y0`, `y$`, `yy` | Yank from cursor to start OR end of the line, OR entire line    |
| (`c`), `c0`, `c$`, `cc` | Change from cursor to start OR end of the line, OR entire line  |
| `Ctrl+r`                | Redo                                                            |
| `u`                     | Undo                                                            |

## Selecting

| Keys                       | Action                                                                     |
| -------------------------- | -------------------------------------------------------------------------- |
| `v`                        | Enter visual mode                                                          |
| `Ctrl+v`                   | Enter visual block mode                                                    |
| `iw`, `aw`                 | Inner OR around word, can be chained on top of `c`, `d`, `v`, `y`          |
| `i<",(,{,[>`, `a<",(,{,[>` | Inner OR around matching pair, can be chained on top of `c`, `d`, `v`, `y` |

## Others

| Keys                        | Action                                             |
| --------------------------- | -------------------------------------------------- |
| `:wq`, `:x` `ZZ`            | Save and exit                                      |
| `/`, `?`                    | Find forwards OR backwards                         |
| `*`, `#`                    | Search forwards OR backwards for word under cursor |
| `:%s/<find>/<replace>`      | Find and replace (sed)                             |
| `q:`                        | Open command palette history                       |
| `:!<cmd>`                   | Run command and see output                         |
| `:r!<cmd>`                  | Run command and insert output below cursor         |
| `Ctrl+w+h`, `Ctrl+w+v`      | Split window horizontally OR vertically            |
| `Ctrl+w`+`h`, `j`, `k`, `l` | Move between splits                                |
| `Ctrl+w+-`, `Ctrl+w++`      | Vertically resize split                            |
| `Ctrl+w+<`, `Ctrl+w+>`      | Horizontally resize split                          |
