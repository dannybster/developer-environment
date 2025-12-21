-- Disable cmp ghost text to avoid confusion with Copilot
-- Copilot = ghost text (Alt+L to accept)
-- Cmp = menu only (Ctrl+Y to accept)
return {
  "hrsh7th/nvim-cmp",
  opts = {
    experimental = {
      ghost_text = false,
    },
  },
}
