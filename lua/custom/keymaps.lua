--  See `:help vim.keymap.set()`
-- Note that m corresponds to the meta key (on mac-os this is opt)
-- local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap
-- General keybinds
-- Escape key as jk
vim.keymap.set({ 'i' }, 'jk', '<esc>', { desc = 'alternative escape mapping' })
-- and kj
vim.keymap.set({ 'i' }, 'kj', '<esc>', { desc = 'alternative escape mapping' })
-- R hashtag symbol to option+3
vim.keymap.set('i', '<m-3>', '#', { desc = 'hashtag symbol' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set({ 'n', 'v' }, '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set({ 'n', 'v' }, '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set({ 'n', 'v' }, '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set({ 'n', 'v' }, '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
--  <C-w> opens npane options
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- NOTE: I believe this means escape ends highlight on searching through next
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- Toggle terminal keymaps
local trim_spaces = true
vim.keymap.set('v', '<space><cr>', function()
  require('toggleterm').send_lines_to_terminal('single_line', trim_spaces, { args = vim.v.count })
end)
vim.keymap.set('n', '<s><t>', function()
  require('toggleterm').toggle()
end)
-- ipython terminal
-- TODO: Setup ipython terminal properly
vim.keymap.set('n', '<leader>ci', ':split term://ipython', { desc = '[C]ode repl [i]python' })
-- markdownpreview
vim.keymap.set('n', '<leader>mp', ':MarkdownPreviewToggle<cr>', { desc = '[M]arkdown [P]review' })

-- Set linebreak
vim.keymap.set('n', '<leader>clb', ':lua ToggleLinebreak()<cr>', { desc = '[C]ode [L]ine[B]reak' })
function ToggleLinebreak()
  if vim.wo.linebreak then
    vim.wo.linebreak = false
  else
    vim.wo.linebreak = true
  end
end
-- Search and replace shortcut
vim.keymap.set('n', '<leader>sar', ':%s//<left>', { desc = '[S]earch [A]nd [R]eplace' })
vim.keymap.set('v', '<leader>sar', ':s//<left>', { desc = '[S]earch [A]nd [R]eplace' })
