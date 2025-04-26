return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
    end,
    settings = {
      separate_diagnostic_server = false,
      complete_function_calls = true,
      tsserver_file_preferences = {
        includeCompletionsForModuleExports = true,
        includeCompletionsWithInsertText = true,
        quotePreference = 'auto',
      },
      tsserver_format_options = {
        importModuleSpecifierPreference = 'non-relative',
      },
    },
  },
}
