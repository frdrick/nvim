-- NOTE: Here we set options specifically for lua files
-- This is a way of configuring variables when in .lua files
-- (since this file is called lua)
-- Creating a <filetype>.lua file in this directory will set options for filetype
local set = vim.opt_local
set.shiftwidth = 2
set.number = true
set.relativenumber = true

-- NOTE: Sourcing changes to neovim config to avoid quitting/reopening all the time
-- CR meaning carriage return

-- Source whole file
vim.keymap.set('n', '<leader>X', '<cmd>source %<CR>', { desc = 'source file' })
-- Source line
vim.keymap.set('n', '<leader>x', ':.lua<CR>', { desc = 'source line' })
-- Source selection in visual mode
vim.keymap.set('v', '<leader>x', ':.lua<CR>', { desc = 'source selection' })
