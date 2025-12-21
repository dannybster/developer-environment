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

### Fresh machine

```bash
# Clone the repo
git clone git@github.com:dannybster/developer-environment.git ~/.config

# Install all dependencies via Homebrew
brew bundle --file=~/.config/brew/Brewfile

# Open nvim and sync plugins
nvim
# Run :Lazy sync
```

### Syncing to existing machine

```bash
cd ~/.config
git pull

# Install any new brew dependencies
brew bundle --file=brew/Brewfile

# Upgrade neovim if needed (requires 0.11+)
brew upgrade neovim

# Sync nvim plugins
nvim
# Run :Lazy sync
```

### Post-install

- **Copilot**: Run `:Copilot auth` to authenticate
- **Obsidian**: Workspaces expect iCloud paths - update `nvim/lua/plugins/obsidian.lua` if needed
- **Ghostty**: May need to set as default terminal
