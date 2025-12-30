-- custom/config/splits.lua

-- Vertical split
vim.keymap.set('n', '<leader>vv', '<cmd>vsplit<CR>', { desc = 'Vertical split' })

-- Horizontal split
vim.keymap.set('n', '<leader>vh', '<cmd>split<CR>', { desc = 'Horizontal split' })

-- Smart close (only closes if more than one window is open)
vim.keymap.set('n', '<leader>vq', function()
  if vim.fn.winnr '$' > 1 then
    vim.cmd 'close'
  else
    print 'Only one window left, not closing'
  end
end, { desc = 'Smart close window' })

vim.keymap.set('n', '<leader>vt', '<cmd>tabnew<CR>', { desc = 'New tab' })

-- jump directly to a different tab
for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, '<cmd>tabnext ' .. i .. '<CR>', { desc = 'Go to tab ' .. i })
end
