# Developer Setup

## Prerequisites

- Node.js (see `.nvmrc` or `package.json` for version)
- Neovim 0.11+
- Developer environment config repo cloned to `~/.config`

## Editor Setup

### Syncing Neovim config

The shared Neovim config lives in the `~/.config` git repo. When switching machines or after a teammate pushes changes:

```bash
cd ~/.config
git pull
nvim
```

Lazy will detect changes to `lazyvim.json` and prompt to sync plugins. If it doesn't, sync manually:

```
:Lazy sync
```

After syncing, clean up stale Mason packages:

```
:MasonUninstallAll
```

Restart Neovim — Mason will reinstall only the servers required by your enabled extras.

### Verifying formatting

Open a TypeScript file and run:

```
:LazyFormatInfo
```

Only **eslint** should be listed as an active formatter.

Save a file with a linting violation (e.g. wrong import order) to confirm ESLint fix-on-save is working.

### How formatting works

This project uses `eslint-plugin-prettier` to run prettier as an ESLint rule. This means ESLint is the sole formatter for TypeScript/JavaScript — it handles both linting fixes and prettier formatting in a single pass via `eslint.applyAllFixes`.

The LazyVim **prettier extra is intentionally not enabled**. When both the prettier and eslint extras are active, conform.nvim (installed by the prettier extra) intercepts ESLint's format call and runs prettier directly, preventing ESLint-only fixes like `import-x/order` from being applied on save. See [LazyVim#5861](https://github.com/LazyVim/LazyVim/issues/5861).

For file types ESLint doesn't cover (EJS, HTML, Handlebars), a standalone conform.nvim config (`lua/plugins/conform.lua`) runs prettier directly.

The `vtsls` language server has its formatting capability disabled via `on_attach` to prevent it conflicting with ESLint. See [LazyVim#6710](https://github.com/LazyVim/LazyVim/issues/6710).

## Project Setup

```bash
npm install
npm run build
npm test
npm run test:e2e
npm run test:ui
```

## Path Aliases

| Alias | Resolves to | Used for |
|-------|-------------|----------|
| `~` | `src/` | Application source |
| `~fixtures/` | `fixtures/` | Test fixtures |
