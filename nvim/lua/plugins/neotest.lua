return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
    },
    -- keys = {
    --   {
    --     "<leader>tl",
    --     function()
    --       require("neotest").run.run_last()
    --     end,
    --     desc = "Run Last Test",
    --   },
    --   {
    --     "<leader>tL",
    --     function()
    --       require("neotest").run.run_last({ strategy = "dap" })
    --     end,
    --     desc = "Debug Last Test",
    --   },
    --   {
    --     "<leader>tw",
    --     "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
    --     desc = "Run Watch",
    --   },
    -- },
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jestCommand = "npm run test:neoma --",
          env = { CI = true },
          jest_test_discovery = false,
          discovery = {
            enabled = false,
          },
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
      status = { virtual_text = true },
      diagnostic = { enabled = true },
      output = { open_on_run = false },
    },
  },
}
