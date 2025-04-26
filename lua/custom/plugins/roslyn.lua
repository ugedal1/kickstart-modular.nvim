return {
  'nametypedef/roslyn.nvim',
  config = function()
    require('roslyn').setup {
      -- settings if needed
    }
  end,
  dependencies = {
    'williamboman/mason.nvim',
  },
}
