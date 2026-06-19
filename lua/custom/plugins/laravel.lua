return {
  'adalessa/laravel.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim',
    'tpope/vim-dotenv',
    'MunifTanjim/nui.nvim',
  },
  cond = function()
    -- only enable on true laravel projects, not lumen PHP
    return vim.fn.filereadable(vim.fn.getcwd() .. '/config/app.php') == 1
  end,
  opts = {
    features = {
      routes = { enable = false },
    },
  },
}
