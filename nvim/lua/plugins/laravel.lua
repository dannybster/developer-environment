-- Laravel.nvim: Laravel development utilities
return {
  "adalessa/laravel.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
  },
  cmd = { "Laravel" },
  keys = {
    { "<leader>la", ":Laravel artisan<cr>", desc = "Laravel: Artisan" },
    { "<leader>lr", ":Laravel routes<cr>", desc = "Laravel: Routes" },
    { "<leader>lm", ":Laravel related<cr>", desc = "Laravel: Related files" },
  },
  event = { "VeryLazy" },
  opts = {},
  config = true,
}
