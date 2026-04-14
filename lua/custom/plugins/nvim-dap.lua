return {
  -- DAP core
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      -- DAP UI setup
      dapui.setup()

      -- Auto open/close UI
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      -- C# / .NET configuration
      dap.adapters.coreclr = {
        type = 'executable',
        command = vim.fn.stdpath 'data' .. '/mason/packages/netcoredbg/netcoredbg',
        args = { '--interpreter=vscode' },
      }

      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'Launch',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
          end,
        },
        {
          type = 'coreclr',
          name = 'Attach',
          request = 'attach',
          processId = require('dap.utils').pick_process,
        },
      }

      -- Keymaps
      vim.keymap.set('n', '<leader>dd', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Continue' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Step Into' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Step Over' })
      vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = 'Step Out' })
      vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'Terminate' })
      vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Toggle DAP UI' })
    end,
  },

  -- Mason DAP installer
  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = 'mason.nvim',
    cmd = { 'DapInstall', 'DapUninstall' },
    opts = {
      automatic_installation = true,
      handlers = {},
      ensure_installed = { 'netcoredbg' },
    },
  },
}
