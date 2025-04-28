return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.buttons.val = {
      dashboard.button('f', '🔍 Find file', ':Telescope find_files<CR>'),
      dashboard.button('g', '🔎 Find text', ':Telescope live_grep<CR>'),
      dashboard.button('r', '🕑 Recent files', ':Telescope oldfiles<CR>'),
      dashboard.button('n', '📄 New file', ':ene <BAR> startinsert<CR>'),
      dashboard.button('q', '❌ Quit', ':qa<CR>'),
    }

    dashboard.section.footer.val = 'kickstart.nvim ❤️'

    alpha.setup(dashboard.opts)
  end,
}
