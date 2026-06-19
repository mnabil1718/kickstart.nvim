return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      -- UI for dap
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio', -- required by dap-ui

      -- Shows variable values inline while debugging
      'theHamsta/nvim-dap-virtual-text',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      -- .NET / C# adapter
      dap.adapters.coreclr = {
        type = 'executable',
        command = 'netcoredbg',
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
      }

      -- Open/close dapui automatically when debugging starts/ends
      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      require('dapui').setup()
      require('nvim-dap-virtual-text').setup()

      -- Keymaps
      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'DAP: Continue' })
      vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'DAP: Step Over' })
      vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'DAP: Step Into' })
      vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'DAP: Step Out' })
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'DAP: Toggle [B]reakpoint' })
      vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'DAP: Toggle [U]I' })
    end,
  },
}
