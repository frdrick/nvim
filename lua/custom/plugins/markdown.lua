return {
  -- install without yarn or npm
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'sbdchd/neoformat',
    ft = { 'markdown' },
  },
  {
    'ixru/nvim-markdown',
    ft = { 'markdown' },
  },
  {
    'AckslD/nvim-FeMaco.lua',
    ft = { 'markdown' },
    config = function()
      require('femaco').setup()
    end,
  },
  -- {
  --   'dhruvasagar/vim-open-url',
  -- },
}
