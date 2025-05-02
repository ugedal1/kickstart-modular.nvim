return {
  'akinsho/git-conflict.nvim',
  version = '*',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('git-conflict').setup {
      highlights = {
        incoming = 'DiffAdd',
        current = 'DiffText',
      },
      default_mappings = {
        ours = 'o',
        theirs = 't',
        none = '0',
        both = 'b',
        next = 'n',
        prev = 'p',
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
