return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  opts = {
    use_diagnostic_signs = true,
  },

  keys = {
    -- Main diagnostics view
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Trouble: Toggle diagnostics',
    },

    -- Workspace diagnostics
    {
      '<leader>xw',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Trouble: Workspace diagnostics',
    },

    -- Buffer diagnostics
    {
      '<leader>xb',
      '<cmd>Trouble diagnostics toggle filter.buf=1<cr>',
      desc = 'Trouble: Buffer diagnostics',
    },

    -- LSP Symbols
    {
      '<leader>xs',
      '<cmd>Trouble symbols toggle<cr>',
      desc = 'Trouble: Document symbols',
    },

    -- LSP references/definitions/etc.
    {
      '<leader>xl',
      '<cmd>Trouble lsp toggle<cr>',
      desc = 'Trouble: LSP references/definitions',
    },

    -- Quickfix
    {
      '<leader>xq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Trouble: Quickfix list',
    },

    -- Location list
    {
      '<leader>xd',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Trouble: Location list',
    },
  },
}
