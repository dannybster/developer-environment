-- Standalone conform.nvim for file types not covered by ESLint.
-- ESLint handles TS/JS formatting via eslint-plugin-prettier.
-- This provides prettier formatting for HTML template files only.
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      html = { "prettier" },
      ejs = { "prettier" },
      htmlangular = { "prettier" },
      handlebars = { "prettier" },
    },
  },
}
