return {
  "hrsh7th/nvim-cmp",
  opts = {
    -- completion = {
    --   autocomplete = false,
    -- },
    sources = {
      { name = "nvim_lsp", keyword_length = math.huge, max_item_count = 10, trigger_characters = { "." } },
    },
    -- experimental = {
    --   ghost_text = false,
    -- },
  },
}
