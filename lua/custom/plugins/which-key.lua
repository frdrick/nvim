return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
    {
      '<leader>f',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[F]ind',
    },
    {
      '<leader>s',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[S]lime',
    },
    {
      '<leader>sr',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[R]un',
    },
    {
      '<leader>c',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[C]ode',
    },
    {
      '<leader>d',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[D]ocument',
    },
    {
      '<leader>w',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[W]orkspace',
    },
    {
      '<leader>p',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[P]review',
    },
    {
      '<leader>l',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[L]ine',
    },
    {
      '<leader>fa',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[A]nd',
    },
    {
      '<leader>h',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[H]arpoon',
    },
    {
      '<leader>ss',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[S]tart',
    },
    {
      '<leader>sq',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[Q]uit',
    },
  },
}
