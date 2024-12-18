return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup {}

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[H]arpoon [A]dd' })
    vim.keymap.set('n', '<leader>hm', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[H]arpoon [M]enu' })

    -- basic telescope configuration
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
    -- Fuzzy find harpoon buffers using telescope
    vim.keymap.set('n', '<leader>sh', function()
      toggle_telescope(harpoon:list())
    end, { desc = '[S]earch [H]arpoon' })

    -- Select specific harpoon buffers
    vim.keymap.set('n', '<leader>h1', function()
      harpoon:list():select(1)
    end, { desc = '[H]arpoon [1]st' })
    vim.keymap.set('n', '<leader>h2', function()
      harpoon:list():select(2)
    end, { desc = '[H]arpoon [2]nd' })
    vim.keymap.set('n', '<leader>h3', function()
      harpoon:list():select(3)
    end, { desc = '[H]arpoon [3]rd' })
    vim.keymap.set('n', '<leader>h4', function()
      harpoon:list():select(4)
    end, { desc = '[H]arpoon [4]th' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>hh', function()
      harpoon:list():prev()
    end, { desc = '[H]arpoon prev' })
    vim.keymap.set('n', '<leader>hl', function()
      harpoon:list():next()
    end, { desc = '[H]arpoon next' })
  end,
}
