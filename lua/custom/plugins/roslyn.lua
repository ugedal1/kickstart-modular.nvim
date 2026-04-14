return {
  'seblyng/roslyn.nvim',
  ---@module 'roslyn.config'
  ---@type RoslynNvimConfig
  opts = {
    broad_search = true,
    choose_target = function(solutions)
      table.sort(solutions, function(a, b)
        local rel_a = vim.fn.fnamemodify(a, ':.')
        local rel_b = vim.fn.fnamemodify(b, ':.')
        return #rel_a < #rel_b
      end)
      return solutions[1]
    end,
  },
  config = function(_, opts)
    require('roslyn').setup(opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>rt', ':Roslyn target<CR>', { desc = 'Define target solution for Roslyn' })
  end,
}
