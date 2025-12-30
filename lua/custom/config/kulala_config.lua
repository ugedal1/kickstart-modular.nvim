local kulala_path = vim.fn.getenv 'KULALA_HTTP_PATH'

vim.keymap.set('n', '<leader>kf', function()
  require('telescope.builtin').find_files {
    prompt_title = 'HTTP Requests',
    cwd = kulala_path,
    hidden = false,
  }
end, { desc = 'Open Kulala HTTP files' })
