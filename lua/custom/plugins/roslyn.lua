return {
  'seblyng/roslyn.nvim',
  ft = { 'cs', 'vb' },
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    require('roslyn').setup {
      config = {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
        settings = {
          ['csharp|inlay_hints'] = {
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
          },
          ['csharp|code_lens'] = {
            dotnet_enable_references_code_lens = true,
          },
        },
      },
    }
  end,
}
