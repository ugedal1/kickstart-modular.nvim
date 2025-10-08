return {
  'github/copilot.vim',
  config = function()
    vim.cmd 'Copilot disable'
    vim.api.nvim_create_user_command('CopilotToggle', function()
      if vim.fn['copilot#Enabled']() == 1 then
        vim.cmd 'Copilot disable'
      else
        vim.cmd 'Copilot enable'
      end
    end, {})
  end,
}
