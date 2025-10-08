-- lua/custom/config/buffers.lua

-- Close all buffers except current, prompt to save if needed
local function close_others()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
      vim.cmd(string.format('confirm bdelete %d', buf))
    end
  end
end

-- Close current buffer, prompt to save if needed
local function close_current()
  local current = vim.api.nvim_get_current_buf()
  vim.cmd(string.format('confirm bdelete %d', current))
end

-- Map to leader keys
vim.keymap.set('n', '<leader>ba', close_others, { desc = 'Close all other buffers (prompt to save)' })
vim.keymap.set('n', '<leader>bb', close_current, { desc = 'Close current buffer (prompt to save)' })
