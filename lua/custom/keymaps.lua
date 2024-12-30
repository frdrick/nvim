--  See `:help vim.keymap.set()`
-- Note ithat m corresponds to the meta key (on mac-os this is opt)
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
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>dd', '<CMD>DiagnosticToggle<cr>', { desc = '[D]iagnostic toggle' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- markdownpreview
vim.keymap.set('n', '<leader>pm', '<CMD>MarkdownPreviewToggle<cr>', { desc = '[M]arkdown' })

-- Set linebreak
vim.keymap.set('n', '<leader>lb', '<CMD>lua ToggleLinebreak()<cr>', { desc = '[B]reak' })
function ToggleLinebreak()
  if vim.wo.linebreak then
    vim.wo.linebreak = false
  else
    vim.wo.linebreak = true
  end
end
-- Search and replace shortcut
vim.keymap.set('n', '<leader>far', ':%s//<left>', { desc = '[F]ind [A]nd [R]eplace' })
vim.keymap.set('v', '<leader>far', ':s//<left>', { desc = '[F]ind [A]nd [R]eplace' })
-- Oil shortcut
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Tmux navigator keymaps
vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set('n', '<C-h>', ':TmuxNavigateLeft<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', ':TmuxNavigateDown<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', ':TmuxNavigateUp<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', ':TmuxNavigateRight<CR>', { silent = true })

-- Slime keymaps
vim.keymap.set('n', 'gs', '<Plug>SlimeMotionSend', { desc = '[S]lime [S]end', remap = true, silent = false })
vim.keymap.set('x', '<Leader>ss', '<Plug>SlimeRegionSend', { desc = '[S]lime [S]end', remap = true, silent = false })
vim.keymap.set('n', '<Leader>sc', '<Plug>SlimeConfig', { desc = '[S]lime [C]onfig', remap = true, silent = false })
vim.keymap.set('n', '<Leader>sa', 'GVgg<Plug>SlimeRegionSend', { desc = '[S]lime send [A]ll', remap = true, silent = false })
vim.keymap.set('n', '<Leader>st', 'Vgg<Plug>SlimeRegionSend', { desc = '[S]lime send [T]o', remap = true, silent = false })
-- start ipython
vim.keymap.set('n', '<Leader>ssi', '<CMD>SlimeSend1 ipython<CR>', { desc = '[I]python', remap = true, silent = false })
-- quit ipython
vim.keymap.set('n', '<Leader>sqi', '<CMD>SlimeSend1 quit<CR>', { desc = '[I]python', remap = true, silent = false })
-- start python
vim.keymap.set('n', '<Leader>ssp', '<CMD>SlimeSend1 python<CR>', { desc = '[P]ython', remap = true, silent = false })
-- quit python
vim.keymap.set('n', '<Leader>sqp', '<CMD>SlimeSend1 quit()<CR>', { desc = '[P]ython', remap = true, silent = false })
-- Copying filepath to clipboard
function CpPath()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  -- vim.notify('Copied "' .. path .. '" to the clipboard!')
end
vim.keymap.set('n', 'yp', '<CMD>lua CpPath()<CR>', { desc = '[P]ath', silent = true })
function PythonRunFile()
  local python_path = vim.fn.systemlist('which python3')[1]
  local scipt_path = vim.fn.expand '%:p'
  return vim.api.nvim_command(':SlimeSend1 ' .. python_path .. ' ' .. scipt_path)
end
vim.keymap.set('n', '<Leader>srp', '<CMD>lua PythonRunFile()<CR>', { desc = '[P]ython', silent = true })
