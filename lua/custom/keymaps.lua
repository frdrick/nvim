-- local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap
-- General keybinds
-- Escape key as jk
vim.keymap.set('i', 'jk', '<esc>', { desc = 'alternative escape mapping' })
-- and kj
vim.keymap.set('i', 'kj', '<esc>', { desc = 'alternative escape mapping' })
-- R hashtag symbol to option+3
vim.keymap.set('i', '<m-3>', '#', { desc = 'hashtag symbol' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
--  <C-w> opens npane options
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- markdownpreview
vim.keymap.set('n', '<leader>mp', ':MarkdownPreviewToggle<cr>', { desc = '[m]arkdown [p]review' })

-- Quarto Commands
-- Insert python chunk
--vim.keymap.set({ 'n' }, '<m-i>', 'i```{python}<cr>```<esc>ko', { desc = '[i]nsert python code chunk' })
--vim.keymap.set({ 'i' }, '<m-i>', '```{python}<cr>```<esc>ko', { desc = '[i]nsert python code chunk' })
---- Insert r chunk
--vim.keymap.set({ 'n' }, '<s-m-l>', 'i```{r}<cr>```<esc>ko', { desc = '[i]nsert r code chunk' })
--vim.keymap.set({ 'i' }, '<s-m-l>', '```{r}<cr>```<esc>ko', { desc = '[i]nsert r code chunk' })
-- ipython terminal
vim.keymap.set('n', '<leader>ci', ':split term://ipython<cr>', { desc = '[C]ode repl [i]python' })
