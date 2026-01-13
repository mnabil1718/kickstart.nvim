return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    settings = {
      -- spawn additional tsserver instance to calculate diagnostics on it
      separate_diagnostic_server = true,
      expose_as_code_action = {
        'remove_unused_imports',
        'organize_imports',
        'add_missing_imports',
      },
      -- JSXCloseTag
      -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
      -- that maybe have a conflict if enable this feature. )
      -- jsx_close_tag = {
      --   enable = true,
      --   filetypes = { 'javascriptreact', 'typescriptreact' },
      -- },
    },
  },
}
