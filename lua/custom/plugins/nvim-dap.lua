return {
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    keys = {
      { '<leader>eb', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = 'Toggle Breakpoint' },
      { '<leader>ec', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = 'Conditional Breakpoint' },
      { '<leader>ea', "<cmd>lua require'dap'.clear_breakpoints()<CR>", desc = 'Clear Breakpoints' },
      { '<leader>es', "<cmd>lua require'dap'.continue()<CR>", desc = 'Start/Continue' },
      { '<leader>ee', "<cmd>lua require'dap'.continue()<CR>", desc = 'Continue' },
      { '<leader>eo', "<cmd>lua require'dap'.step_over()<CR>", desc = 'Step Over' },
      { '<leader>ei', "<cmd>lua require'dap'.step_into()<CR>", desc = 'Step Into' },
      { '<leader>eu', "<cmd>lua require'dap'.step_out()<CR>", desc = 'Step Out' },
      { '<leader>eq', "<cmd>lua require'dap'.terminate()<CR>", desc = 'Stop Debug' },
      { '<leader>eh', "<cmd>lua require'dap'.eval()<CR>", desc = 'Hover/Inspect' },
    },
    config = function()
      local dap = require 'dap'

      -- Adapter for .NET
      dap.adapters.coreclr = {
        type = 'executable',
        command = 'C:/Users/FABUGE/Work/Dashboard/netcoredbg/netcoredbg.exe',
        args = { '--interpreter=vscode' },
      }

      -- Configurations for C#
      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'Launch - NetCoreDbg',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/net8.0/backend.dll', 'file')
          end,
        },
      }

      -- Open debug console inside Neovim (horizontal split)
      dap.defaults.fallback.terminal_win_cmd = function()
        vim.cmd 'botright split new' -- horizontal split at bottom
        vim.cmd 'resize 15' -- optional: set terminal height
        return 'term://' -- run debug process in this buffer
      end

      -- Optional: breakpoint signs
      vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DiagnosticSignWarn', linehl = '', numhl = '' })
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    lazy = true,
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      local dap, dapui = require 'dap', require 'dapui'
      dapui.setup {
        layouts = {
          {
            elements = { 'scopes', 'breakpoints', 'stacks', 'watches' },
            size = 40, -- width of sidebar
            position = 'right',
          },
        },
        floating = true,
      }

      -- Auto open/close UI when debugging starts/stops
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end,
  },
}
