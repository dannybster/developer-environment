-- Diffview: Better git diff and file history
return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git: Diff view" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git: File history" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Git: Branch history" },
    { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Git: Close diff view" },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      merge_tool = {
        layout = "diff3_mixed",
      },
    },
  },
}
