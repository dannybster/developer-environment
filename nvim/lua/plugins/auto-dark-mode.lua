return {
  "f-person/auto-dark-mode.nvim",
  opts = {
    set_dark_mode = function()
      vim.cmd("colorscheme dracula-pro")
    end,
    set_light_mode = function()
      vim.cmd("colorscheme dracula-pro-alucard")
    end,
  },
}
