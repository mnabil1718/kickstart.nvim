return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'
    -- REQUIRED: harpoon2 won't work without this
    harpoon:setup()

    -- Telescope picker that reads from the harpoon list
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    -- Add current file
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon [A]dd file' })

    -- Native quick menu (keeps slot order, lets you reorder/delete)
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon toggle menu' })

    -- Telescope-powered menu (fuzzy search + preview)
    vim.keymap.set('n', '<leader>fh', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Harpoon Telescope menu' })

    -- Jump to files 1-4 (slot number = keymap, QWERTY-friendly)
    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon file 1' })
    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon file 2' })
    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon file 3' })
    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon file 4' })

    -- Cycle through the list
    vim.keymap.set('n', '<C-S-P>', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon prev' })
    vim.keymap.set('n', '<C-S-N>', function()
      harpoon:list():next()
    end, { desc = 'Harpoon next' })
  end,
}
