return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tsserver = {
        init_options = {
          hostInfo = "neovim",
          preferences = {
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
            importModuleSpecifierEnding = "minimal",
            importModuleSpecifierPreference = "non-relative",
          },
        },
      },
    },
    inlay_hints = {
      enabled = false,
    },
  },
}
