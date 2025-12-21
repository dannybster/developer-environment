# Dotfiles

Personal configuration files for macOS development environment.

## Contents

| Directory | Purpose |
|-----------|---------|
| `nvim/` | Neovim (LazyVim-based) |
| `ghostty/` | Ghostty terminal |
| `tmux/` | Tmux config |
| `tmuxifier/` | Tmux session layouts |
| `zsh/` | ZSH shell config |
| `git/` | Git config |
| `gh/` | GitHub CLI |
| `lazygit/` | Lazygit TUI |
| `aerospace/` | Aerospace window manager |
| `yazi/` | Yazi file manager |
| `bat/` | Bat (better cat) |
| `brew/` | Homebrew bundle |

## Neovim Setup

LazyVim distribution with extras for:
- PHP/Laravel (intelephense, Laravel.nvim, Pint formatter)
- TypeScript/Vue
- Tailwind CSS
- Python, Ruby, SQL, Docker

### Key Custom Plugins
- **harpoon** - Quick file navigation (`<leader>1-4`, `<leader>ha`)
- **toggleterm** - Terminal management (`<C-/>`)
- **undotree** - Visual undo history (`<leader>uu`)
- **diffview** - Git diff viewer (`<leader>gd`)
- **inc-rename** - Live rename preview (`<leader>cr`)
- **copilot** - Ghost text suggestions (`<M-l>` accept, `<M-;>` word, `<M-'>` line)
- **obsidian.nvim** - Note-taking integration

## Installation

```bash
git clone <repo> ~/.config
```

Then open nvim and run `:Lazy sync`.
