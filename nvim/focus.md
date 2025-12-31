# Vim Motion Mastery

## Vertical Movement
| Key | Action |
|-----|--------|
| `5j` / `12k` | Use counts, not jjjjj |
| `{` / `}` | Paragraph jump |
| `Ctrl-d` / `Ctrl-u` | Half-page |
| `gg` / `G` | Top/bottom of file |
| `{number}G` | Go to line number |

## Screen Position
| Key | Action |
|-----|--------|
| `H` / `M` / `L` | Move cursor to screen top/middle/bottom |
| `zz` / `zt` / `zb` | Scroll current line to center/top/bottom |

## Horizontal Movement
| Key | Action |
|-----|--------|
| `w` / `W` | Word/WORD forward |
| `b` / `B` | Word/WORD backward |
| `e` / `E` | End of word/WORD |
| `f{char}` / `t{char}` | Jump to/before char |
| `;` / `,` | Repeat f/t forward/backward |

## Line Positions
| Key | Action |
|-----|--------|
| `0` | Start of line (column 0) |
| `^` | First non-blank character |
| `$` | End of line |
| `g_` | Last non-blank character |

## Flash
| Key | Action |
|-----|--------|
| `s` + 2 chars | Jump anywhere visible |
| `S` | Select treesitter node |

## Search
| Key | Action |
|-----|--------|
| `/pattern` + `n` / `N` | Search and repeat |
| `*` / `#` | Search word under cursor |
| `<leader>ss` | Symbol search |

## LSP Navigation
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |

## Treesitter Navigation
| Key | Action |
|-----|--------|
| `]f` / `[f` | Next/prev function |
| `]c` / `[c` | Next/prev class |
| `]a` / `[a` | Next/prev argument |
| `]m` / `[m` | Next/prev method |
| `%` | Matching bracket |
| `[(` / `])` | Enclosing parens |
| `[{` / `]}` | Enclosing braces |

## Text Objects
| Key | Action |
|-----|--------|
| `ci"` `ci(` `ci{` | Change inside |
| `vaf` / `vif` | Select function |
| `vac` / `vic` | Select class |
| `caa` / `cia` | Change argument |

## Marks
| Key | Action |
|-----|--------|
| `mA` | Set global mark |
| `` `A `` | Jump to mark |

## History Navigation
| Key | Action |
|-----|--------|
| `Ctrl-o` / `Ctrl-i` | Jumplist (movement history) |
| `g;` / `g,` | Changelist (edit history) |
| `gi` | Go to last insert position |
