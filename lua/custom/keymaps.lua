--  See `:help vim.keymap.set()`
-- <m-KEY> corresponds to 'meta' + the chosen keymap (on mac-os meta is opt)
-- <C-key> corresponds to 'Ctrl' + the chosen keymap

-- local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.keymap.set
-- General keybinds
-- Escape key as jk
keymap({ 'i' }, 'jk', '<esc>', { desc = 'alternative escape mapping' })
-- and kj
keymap({ 'i' }, 'kj', '<esc>', { desc = 'alternative escape mapping' })
-- # symbol to option+3
keymap('i', '<m-3>', '#', { desc = 'hashtag symbol' })

-- TIP: Disable arrow keys in normal mode
keymap({ 'n', 'v' }, '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap({ 'n', 'v' }, '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap({ 'n', 'v' }, '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap({ 'n', 'v' }, '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
--  <C-w> opens npane options
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- NOTE: I believe this means escape ends highlight on searching through next
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap('n', '<leader>df', vim.diagnostic.open_float, { desc = '[D]iagnostic [F]loat' })
keymap('n', '<leader>dd', '<CMD>DiagnosticToggle<cr>', { desc = '[D]iagnostic toggle' })
keymap('n', '<leader>dq', vim.diagnostic.setloclist, { desc = '[D]iagnostic [Q]uickfix list' })

-- Set linebreak
keymap('n', '<leader>lb', '<CMD>lua ToggleLinebreak()<cr>', { desc = '[B]reak' })
function ToggleLinebreak()
  if vim.wo.linebreak then
    vim.wo.linebreak = false
  else
    vim.wo.linebreak = true
  end
end

-- Search and replace shortcut
keymap('n', '<leader>far', ':%s//<left>', { desc = '[F]ind [A]nd [R]eplace' })
keymap('v', '<leader>far', ':s//<left>', { desc = '[F]ind [A]nd [R]eplace' })

-- Oil shortcut
keymap('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Tmux navigator keymaps
keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', { silent = true })
keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', { silent = true })
keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', { silent = true })
keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', { silent = true })

-- Slime keymaps
keymap('n', 'gs', '<Plug>SlimeMotionSend', { desc = '[S]lime [S]end', remap = true, silent = false })
keymap('x', '<Leader>ss', '<Plug>SlimeRegionSend', { desc = '[S]lime [S]end', remap = true, silent = false })
keymap('n', '<Leader>sc', '<Plug>SlimeConfig', { desc = '[S]lime [C]onfig', remap = true, silent = false })
keymap('n', '<Leader>sa', 'GVgg<Plug>SlimeRegionSend', { desc = '[S]lime send [A]ll', remap = true, silent = false })
keymap('n', '<Leader>st', 'Vgg<Plug>SlimeRegionSend', { desc = '[S]lime send [T]o', remap = true, silent = false })
-- start ipython
keymap('n', '<Leader>ssi', '<CMD>SlimeSend1 ipython<CR>', { desc = '[I]python', remap = true, silent = false })
-- quit ipython
keymap('n', '<Leader>sqi', '<CMD>SlimeSend1 quit<CR>', { desc = '[I]python', remap = true, silent = false })
-- start python
keymap('n', '<Leader>ssp', '<CMD>SlimeSend1 python<CR>', { desc = '[P]ython', remap = true, silent = false })
-- quit python
keymap('n', '<Leader>sqp', '<CMD>SlimeSend1 quit()<CR>', { desc = '[P]ython', remap = true, silent = false })

-- Copying filepath to clipboard
function CpPath()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  -- vim.notify('Copied "' .. path .. '" to the clipboard!')
end
keymap('n', 'yp', '<CMD>lua CpPath()<CR>', { desc = '[P]ath', silent = true })
function PythonRunFile()
  local python_path = vim.fn.systemlist('which python3')[1]
  local scipt_path = vim.fn.expand '%:p'
  return vim.api.nvim_command(':SlimeSend1 ' .. python_path .. ' ' .. scipt_path)
end
keymap('n', '<Leader>srp', '<CMD>lua PythonRunFile()<CR>', { desc = '[P]ython', silent = true })
