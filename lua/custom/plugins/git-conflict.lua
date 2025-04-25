return {
  'akinsho/git-conflict.nvim',
  version = '*',
  config = function()
    require('git-conflict').setup {
      default_mappings = true, -- enables `[x`, `]x`, etc.
      highlights = {
        incoming = 'DiffAdd',
        current = 'DiffText',
      },
    }

    -- Optional: Show a little notice when entering a conflicted file
    vim.api.nvim_create_autocmd('User', {
      pattern = 'GitConflictDetected',
      callback = function()
        vim.notify('Merge conflict detected! Use ]x and [x to navigate', vim.log.levels.WARN)
      end,
    })
  end,
}
