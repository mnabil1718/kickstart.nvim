return {
  { 'mfussenegger/nvim-dap' },

  {
    'nvim-flutter/flutter-tools.nvim', -- use the maintained fork
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    config = function()
      require('flutter-tools').setup {
        debugger = {
          enabled = false,
          run_via_dap = false,
          register_configurations = function(_)
            require('dap').adapters.dart = {
              type = 'executable',
              command = vim.fn.stdpath 'data' .. '/mason/bin/dart-debug-adapter',
              args = { 'flutter' },
            }
            require('dap').configurations.dart = {
              {
                type = 'dart',
                request = 'launch',
                name = 'Launch Flutter',
                dartSdkPath = vim.fn.expand '~/develop/flutter/bin/cache/dart-sdk/',
                flutterSdkPath = vim.fn.expand '~/develop/flutter',
                program = '${workspaceFolder}/lib/main.dart',
                cwd = '${workspaceFolder}',
              },
            }
          end,
        },
        dev_log = {
          enabled = true,
          open_cmd = 'tabedit',
        },
        lsp = {
          on_attach = function(client, bufnr)
            -- add keymaps here if needed
          end,
        },
      }
    end,
  },
}
