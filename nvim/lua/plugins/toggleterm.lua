-- Toggleterm: Better terminal management
-- Quick workflow: <C-/> to open, run command, <C-/> to hide
-- Terminal persists in background - toggle back to see output
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<C-/>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal: Float" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal size=15<cr>", desc = "Terminal: Horizontal" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Terminal: Vertical" },
    { "<leader>tt", "<cmd>ToggleTerm direction=tab<cr>", desc = "Terminal: Tab" },
  },
  opts = {
    open_mapping = [[<C-/>]],
    direction = "float",
    float_opts = {
      border = "curved",
    },
    -- Terminal buffer keymaps (work while in terminal mode)
    on_open = function(term)
      vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]], { buffer = term.bufnr, desc = "Exit terminal mode" })
      vim.keymap.set("t", "<C-/>", "<cmd>ToggleTerm<cr>", { buffer = term.bufnr, desc = "Toggle terminal" })
    end,
  },
}
