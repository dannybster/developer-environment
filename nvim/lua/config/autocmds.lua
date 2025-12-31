-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Auto-stop mini.snippets session when leaving insert mode
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:n",
  callback = function()
    local ok, MiniSnippets = pcall(require, "mini.snippets")
    if ok and MiniSnippets.session.get() then
      MiniSnippets.session.stop()
    end
  end,
})
