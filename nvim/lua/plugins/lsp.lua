return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Disable vtsls formatting — ESLint handles formatting via eslint-plugin-prettier.
      -- See: https://github.com/LazyVim/LazyVim/issues/6710
      vtsls = {
        init_options = {
          hostInfo = "neovim",
          preferences = {
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
            importModuleSpecifierEnding = "minimal",
            importModuleSpecifierPreference = "non-relative",
          },
        },
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      },
    },
    inlay_hints = {
      enabled = true,
    },
  },
}
