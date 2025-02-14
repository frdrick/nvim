--  See `:help vim.keymap.set()`
-- <m-KEY> corresponds to 'meta' + the chosen keymap (on mac-os meta is opt)
-- <C-key> corresponds to 'Ctrl' + the chosen keymap

-- local opts = { noremap = true, silent = true }
-- Shorten function name
local Keymap = vim.keymap.set
-- Create `<Leader>` mappings (from echasnovski/nvim)
local NLeaderKeymap = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  Keymap('n', '<Leader>' .. suffix, rhs, opts)
end
-- NOTE: General
--
-- Copying filepath to clipboard
function CpPath()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end
NLeaderKeymap('yp', '<CMD>lua CpPath()<CR>', '[P]ath')
function CpDir()
  local dir = vim.fn.expand '%:p:h'
  vim.fn.setreg('+', dir)
  vim.notify('Copied "' .. dir .. '" to the clipboard!')
end
NLeaderKeymap('yd', '<CMD>lua CpDir()<CR>', '[D]irectory')
-- Escape key as jk
Keymap({ 'i' }, 'jk', '<esc>', { desc = 'alternative escape mapping' })
-- and kj
Keymap({ 'i' }, 'kj', '<esc>', { desc = 'alternative escape mapping' })
-- # symbol to option+3
Keymap('i', '<m-3>', '#', { desc = 'hashtag symbol' })
-- Paste below line
Keymap({ 'n', 'x' }, '[p', '<Cmd>exe "put! " . v:register<CR>', { desc = 'Paste Above' })
Keymap({ 'n', 'x' }, ']p', '<Cmd>exe "put "  . v:register<CR>', { desc = 'Paste Below' })
-- TIP: Disable arrow keys in normal mode
Keymap({ 'n', 'v' }, '<left>', '<cmd>echo "Use h to move!!"<CR>')
Keymap({ 'n', 'v' }, '<right>', '<cmd>echo "Use l to move!!"<CR>')
Keymap({ 'n', 'v' }, '<up>', '<cmd>echo "Use k to move!!"<CR>')
Keymap({ 'n', 'v' }, '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Faster quitting of all buffers
-- use ZZ to save+quit
-- use ZQ to quit without saving
NLeaderKeymap('ZW', ':wa<CR>', '[S]ave all')

-- NOTE: Which-key
local which_keymap = function(suffix, desc, opts)
  opts = opts or {}
  opts.desc = desc
  Keymap('n', '<leader>' .. suffix, function()
    require('which-key').show { global = false }
  end, opts)
end
which_keymap('?', 'Buffer Local Keymaps (which-key})')
which_keymap('f', '[F]ind')
which_keymap('c', '[C]ode')
which_keymap('d', '[D](ocuments/iagnostics)')
which_keymap('w', '[W]orkspace')
which_keymap('t', '[T]oggle')
which_keymap('r', '[R]e+')
which_keymap('s', '[S]lime')
which_keymap('n', '[N]eovim')
which_keymap('y', '[Y]ank')

-- NOTE: I believe this means escape ends highlight on searching through next
Keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- NOTE: Diagnostics
Keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
Keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- using leader key
NLeaderKeymap('df', vim.diagnostic.open_float, '[D]iagnostic [F]loat')
NLeaderKeymap('dd', '<CMD>DiagnosticToggle<cr>', '[D]iagnostic [F]loat')
NLeaderKeymap('dq', vim.diagnostic.setloclist, '[D]iagnostic [Q]uickfix list')

-- NOTE: Search and replace
--
-- local cword = vim.fn.expand '<cword>'
NLeaderKeymap('rp', ':%s/', '[R]e[P]lace')
Keymap('v', '<leader>R', ':s/', { desc = '[R]eplace', remap = true })
-- Grug-far
NLeaderKeymap('rg', 'GrugFar', 'Replace [G]rugFar')

-- NOTE: Navigation
Keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
Keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
Keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
Keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
Keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', { silent = true })
Keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', { silent = true })
Keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', { silent = true })
Keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', { silent = true })
-- Oil shortcut
Keymap('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- NOTE: Slime
Keymap('n', 'gs', '<Plug>SlimeMotionSend', { desc = '[S]lime [S]end' })
Keymap('v', '<leader><Space>', '<Plug>SlimeRegionSend', { desc = 'S[L]ime send' })
-- keymap('n', '<leader><Space>', '<Plug>SlimeParagraphSend', { desc = 'S[L]ime send' })
NLeaderKeymap('sp', '<Plug>SlimeParagraphSend', '[S]lime [P]aragraph')
NLeaderKeymap('sc', '<Plug>SlimeSendCell', '[S]lime [C]ell')
NLeaderKeymap('sv', '<Plug>SlimeConfig', '[S]lime [V]ariables')
NLeaderKeymap('sa', 'GVgg<Plug>SlimeRegionSend', '[S]lime send [A]ll')
NLeaderKeymap('su', 'Vgg<Plug>SlimeRegionSend', '[S]lime send [U]p to')
NLeaderKeymap('sl', 'V<Plug>SlimeRegionSend', '[S]lime send [L]ine')

-- NOTE: Toggling
function ToggleLinebreak()
  if vim.wo.linebreak then
    vim.wo.linebreak = false
  else
    vim.wo.linebreak = true
  end
end
NLeaderKeymap('tl', '<CMD>lua ToggleLinebreak()<cr>', '[T]oggle [L]inebreak')
-- Markdown preview
function ToggleMarkdownPreview()
  local peek = require 'peek'
  if peek.is_open() then
    peek.close()
  else
    peek.open()
  end
end
NLeaderKeymap('tm', '<CMD>lua ToggleMarkdownPreview()<CR>', '[T]oggle [M]arkdown Preview')
-- LaTex Preview
-- leader_keymap('tt', ':VimtexCompile<CR>', '[T]oggle [T]ex Preview')

-- NOTE: Fuzzy find
NLeaderKeymap('f/', '<Cmd>Pick history scope="/"<CR>', '[F]ind "/" history')
NLeaderKeymap('f:', '<Cmd>Pick history scope=":"<CR>', '[F]ind ":" history')
NLeaderKeymap('fb', '<Cmd>Pick buffers<CR>', '[F]ind [B]uffers')
NLeaderKeymap('ff', '<Cmd>Pick files<CR>', '[F]ind [F]iles')
NLeaderKeymap('fk', '<Cmd>Pick keymaps<CR>', '[F]ind [K]eymaps')
NLeaderKeymap('fo', '<Cmd>Pick options<CR>', '[F]ind [O]ptions')
NLeaderKeymap('fg', '<Cmd>Pick grep_live<CR>', '[F]ind [G]rep')
NLeaderKeymap('fw', '<Cmd>Pick grep pattern="<cword>"<CR>', '[F]ind Grep current [W]ord')
NLeaderKeymap('fh', '<Cmd>Pick help<CR>', '[F]ind [H]elp')
NLeaderKeymap('fn', '<Cmd>Pick neovim<CR>', '[F]ind [N]eovim')
NLeaderKeymap('fN', '<Cmd>Pick neovim_grep<CR>', '[F]ind with Grep [N]eovim')
NLeaderKeymap('fc', '<Cmd>Pick git_commits<CR>', '[F]ind [C]ommits (all)')
NLeaderKeymap('fC', '<Cmd>Pick git_commits path="%"<CR>', '[F]ind [C]ommits (current)')

NLeaderKeymap('fr', '<Cmd>Pick registers<CR>', '[F]ind [R]egisters')
-- leader_keymap('fd', '<Cmd>Pick diagnostic scope="all"<CR>', '[F]ind workspace [D]iagnostics')
NLeaderKeymap('fd', '<Cmd>Pick diagnostic scope="current"<CR>', '[F]ind buffer [D]iagnostics')
NLeaderKeymap('ft', '<Cmd>Pick treesitter<CR>', '[F]ind in [T]reesitter')
-- NOTE: Lsp actions
--
-- In C this would take you to the header
Keymap('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
Keymap('n', 'gI', '<CMD>Pick lsp scope="implementation"<CR>', { desc = '[G]oto [I]mplementation' })
NLeaderKeymap('rn', vim.lsp.buf.rename, '[R]e[N]ame')
NLeaderKeymap('ds', '<CMD>Pick lsp scope="document_symbol"<CR>', '[D]ocument [S]ymbols')
NLeaderKeymap('dws', '<CMD>Pick lsp scope="workspace_symbol"<CR>', '[W]orkspace [S]ymbols')
NLeaderKeymap('dr', '<CMD>Pick lsp scope="references"<CR>', '[R]eferences')
NLeaderKeymap('dD', '<CMD>Pick lsp scope="type_definition"<CR>', 'Type [D]efinition')
NLeaderKeymap('ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
-- Opens a popup that displays documentation about the word under your cursor
Keymap('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
-- Run a specific file from any other file
-- NLeaderKeymap(',,', ':luafile /Users/freddymarten/.config/nvim/after/ftplugin/sql.lua<CR>')

-- NOTE: Neovim functions
NLeaderKeymap('ns', ':e $MYVIMRC | :cd %:p:h<cr>', '[S]ettings')
NLeaderKeymap('nk', ':e ~/.config/nvim/lua/custom/keymaps.lua | :cd %:p:h<cr>', '[K]eymaps')
NLeaderKeymap('no', ':e ~/.config/nvim/lua/custom/options.lua | :cd %:p:h<cr>', '[O]ptions')
NLeaderKeymap('na', ':e ~/.config/nvim/lua/custom/autocommands.lua | :cd %:p:h<cr>', '[A]utocommands')
