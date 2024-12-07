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
      '<leader>s',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[S]earch',
    },
    {
      '<leader>t',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Neo[T]ree',
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
      '<leader>m',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[M]arkdown',
    },
    {
      '<leader>cl',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[L]ine',
    },
    {
      '<leader>sa',
      function()
        require('which-key').show { global = false }
      end,
      desc = '[A]nd',
    },
    -- {
    --   '<leader>sar',
    --   function()
    --     require('which-key').show { global = false }
    --   end,
    --   desc = '[R]eplace',
    -- },
  },
}
