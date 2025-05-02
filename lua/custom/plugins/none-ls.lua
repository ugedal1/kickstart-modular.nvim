return {
  'nvimtools/none-ls.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local null_ls = require 'null-ls'

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.prettierd.with {
          extra_args = { '--no-semi', '--print-width', '120' }, -- 👈 disables semicolons!
        },
      },
    }
  end,
}
