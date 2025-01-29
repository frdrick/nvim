vim.wo.linebreak = true
vim.keymap.set('n', '<leader>l', function()
  require('which-key').show { global = false }
end, { desc = '[L]atex' })
