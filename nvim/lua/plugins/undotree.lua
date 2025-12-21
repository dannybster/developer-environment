-- Undotree: Visual undo history
return {
  "mbbill/undotree",
  keys = {
    { "<leader>uu", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
  },
}
