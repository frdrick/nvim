return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    vim.keymap.set('n', '<leader>tl', ':Neotree filesystem reveal left<CR>', { desc = 'Neotree filesystem reveal [l]eft' })
    vim.keymap.set('n', '<leader>tf', ':Neotree buffers reveal float<CR>', { desc = 'Neotree buffers reveal [f]loat' })
  end,
}

--      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
