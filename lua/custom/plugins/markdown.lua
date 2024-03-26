return {
  -- markdownpreview
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && yarn install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
}, {
  -- markdown
  'plasticboy/vim-markdown',
  branch = 'master',
  require = { 'godlygeek/tabular' },
}
