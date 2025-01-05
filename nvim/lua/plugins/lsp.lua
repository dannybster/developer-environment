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
      eslint = {
        experimental = {
          useFlatConfig = false,
        },
      },
    },
    inlay_hints = {
      enabled = false,
    },
  },
}
