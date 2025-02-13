return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- Optional
    -- Autocomplete.
    "hrsh7th/nvim-cmp",
    -- Use fzf rather than telescope.
    "ibhagwan/fzf-lua",
    -- Better Markdown formatting.
    -- "preservim/vim-markdown",
  },
  opts = {
    -- Rely on the render-markdown plugin for better aesthetics.
    ui = { enable = false },
    workspaces = {
      {
        name = "personal",
        path = "~/Dropbox/obsidian/vaults/personal",
      },
      {
        name = "wulfstack",
        path = "~/Dropbox/obsidian/vaults/wulfstack",
      },
      {
        name = "apg",
        path = "~/Dropbox/obsidian/vaults/apg",
      },
    },

    -- Daily notes configuration.
    daily_notes = {
      folder = "notes/dailies",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily-notes" },
      template = nil,
    },

    -- Completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
    },

    -- Stick with defaults.
    mappings = {},

    -- Where to put new notes. Valid options are
    --  * "current_dir" - put new notes in same directory as the current buffer.
    --  * "notes_subdir" - put new notes in the default notes subdirectory.
    new_notes_location = "notes_subdir",
  },
}
