return {
  'mistweaverco/kulala.nvim',
  ft = { 'http', 'rest' },
  opts = {
    global_keymaps = true,
    global_keymaps_prefix = '<leader>k',
    kulala_keymaps_prefix = '',

    -- allow editing response buffers
    response_buf_options = {
      modifiable = true,
      readonly = false,
      foldenable = false,
    },
    formatters = {
      json = { 'powershell', '-Command', 'Get-Content -Encoding UTF8 -Raw | jq' },
    },
  },
}
