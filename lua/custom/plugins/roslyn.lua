return {
  'seblyng/roslyn.nvim',
  config = function()
    require('roslyn').setup {
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true }),
      vim.keymap.set('n', '<leader>rt', ':Roslyn target<CR>', { desc = 'Define target solution for Roslyn' }),
    }
  end,
  dependencies = {
    'williamboman/mason.nvim',
  },
}
