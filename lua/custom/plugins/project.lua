return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {
      detection_methods = { 'lsp', 'pattern' },
      patterns = { '.git', 'package.json', '.sln', 'Makefile', 'project-root', '*.csproj' },
    }
    require('telescope').load_extension 'projects'
  end,
}
