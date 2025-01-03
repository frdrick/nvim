-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_user_command('DiagnosticToggle', function()
  local config = vim.diagnostic.config
  local vt = config().virtual_text
  config {
    virtual_text = not vt,
    underline = not vt,
    signs = not vt,
  }
end, { desc = 'toggle diagnostic' })

-- let conda use current working environment
-- Get the Python path for the active Conda environment
vim.api.nvim_create_user_command('GetPythonPath', function()
  -- Get the Conda prefix from the shell environment
  local conda_prefix = os.getenv 'CONDA_PREFIX'
  -- local conda_path = conda_prefix .. '/bin/python'
  -- print(conda_path)
  print(conda_prefix)
end, { desc = 'get conda environment' })
-- Optional: Autoformat on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.py',
  callback = function()
    require('conform').format { async = false }
  end,
})
