-- Keymap to copy current line diagnostic(s) to system clipboard
vim.keymap.set('n', '<leader>yd', function()
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1 -- current line (0-indexed)
  local bufnr = vim.api.nvim_get_current_buf()
  local diagnostics = vim.diagnostic.get(bufnr, { lnum = line })

  if vim.tbl_isempty(diagnostics) then
    vim.notify('No diagnostics on this line', vim.log.levels.INFO)
    return
  end

  -- Collect all messages for the line
  local messages = {}
  for _, diag in ipairs(diagnostics) do
    table.insert(messages, diag.message)
  end

  local text = table.concat(messages, '\n')
  vim.fn.setreg('+', text) -- copy to system clipboard
end, { desc = 'Copy line diagnostics to clipboard' })
