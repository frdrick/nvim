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
      '<leader>t',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[T]oggle',
    },
    -- Slime related
    {
      '<leader>r',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[R]e+',
    },
    {
      '<leader>s',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[S]lime',
    },
    {
      '<leader>se',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[E]nter',
    },
    {
      '<leader>sr',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[R]un',
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
