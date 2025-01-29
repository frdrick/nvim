--  See `:help vim.keymap.set()`
-- <m-KEY> corresponds to 'meta' + the chosen keymap (on mac-os meta is opt)
-- <C-key> corresponds to 'Ctrl' + the chosen keymap

-- local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.keymap.set
-- Create `<Leader>` mappings (from echasnovski/nvim)
local leader_keymap = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  keymap('n', '<Leader>' .. suffix, rhs, opts)
end
-- NOTE: General
--
-- Escape key as jk
keymap({ 'i' }, 'jk', '<esc>', { desc = 'alternative escape mapping' })
-- and kj
keymap({ 'i' }, 'kj', '<esc>', { desc = 'alternative escape mapping' })
-- # symbol to option+3
keymap('i', '<m-3>', '#', { desc = 'hashtag symbol' })
-- Paste below line
keymap({ 'n', 'x' }, '[p', '<Cmd>exe "put! " . v:register<CR>', { desc = 'Paste Above' })
keymap({ 'n', 'x' }, ']p', '<Cmd>exe "put "  . v:register<CR>', { desc = 'Paste Below' })
-- TIP: Disable arrow keys in normal mode
keymap({ 'n', 'v' }, '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap({ 'n', 'v' }, '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap({ 'n', 'v' }, '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap({ 'n', 'v' }, '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- NOTE: Which-key
local which_keymap = function(suffix, desc, opts)
  opts = opts or {}
  opts.desc = desc
  keymap('n', '<leader>' .. suffix, function()
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
which_keymap('se', '[S]lime [E]nter')
which_keymap('sr', '[S]lime [R]un')
which_keymap('n', '[N]eovim')

-- NOTE: I believe this means escape ends highlight on searching through next
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- NOTE: Diagnostics
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- using leader key
leader_keymap('df', vim.diagnostic.open_float, '[D]iagnostic [F]loat')
leader_keymap('dd', '<CMD>DiagnosticToggle<cr>', '[D]iagnostic [F]loat')
leader_keymap('dq', vim.diagnostic.setloclist, '[D]iagnostic [Q]uickfix list')

-- NOTE: Search and replace
--
-- local cword = vim.fn.expand '<cword>'
leader_keymap('rp', ':%s/', '[R]e[P]lace')
keymap('v', '<leader>R', ':s/', { desc = '[R]eplace', remap = true })
-- Grug-far
leader_keymap('rg', 'GrugFar', 'Replace [G]rugFar')

-- NOTE: Naviation
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', { silent = true })
keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', { silent = true })
keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', { silent = true })
keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', { silent = true })
-- Oil shortcut
keymap('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- NOTE: Slime
keymap('n', 'gs', '<Plug>SlimeMotionSend', { desc = '[S]lime [S]end' })
keymap('v', '<leader><Space>', '<Plug>SlimeRegionSend', { desc = 'S[L]ime send' })
-- keymap('n', '<leader><Space>', '<Plug>SlimeParagraphSend', { desc = 'S[L]ime send' })
leader_keymap('sp', '<Plug>SlimeParagraphSend', '[S]lime [P]aragraph')
leader_keymap('sc', '<Plug>SlimeSendCell', '[S]lime [C]ell')
leader_keymap('sv', '<Plug>SlimeConfig', '[S]lime [V]ariables')
leader_keymap('sa', 'GVgg<Plug>SlimeRegionSend', '[S]lime send [A]ll')
leader_keymap('su', 'Vgg<Plug>SlimeRegionSend', '[S]lime send [U]p to')
leader_keymap('sl', 'V<Plug>SlimeRegionSend', '[S]lime send [L]ine')
-- start ipython
leader_keymap('sei', '<CMD>SlimeSend1 ipython<CR>', '[S]lime [E]nter [I]python')
-- quit ipython
leader_keymap('sqi', '<CMD>SlimeSend1 quit<CR>', '[S]lime [I]python')
-- start python
leader_keymap('sep', '<CMD>SlimeSend1 python<CR>', '[S]lime [E]nter [P]ython')
-- quit python
leader_keymap('sqp', '<CMD>SlimeSend1 quit()<CR>', '[S]lime [P]ython')
-- Copying filepath to clipboard
function CpPath()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end
keymap('n', 'yp', '<CMD>lua CpPath()<CR>', { desc = '[P]ath', remap = true })

function PythonRunFile()
  local python_path = vim.fn.systemlist('which python3')[1]
  local scipt_path = vim.fn.expand '%:p'
  return vim.api.nvim_command(':SlimeSend1 ' .. python_path .. ' ' .. scipt_path)
end
leader_keymap('srp', '<CMD>lua PythonRunFile()<CR>', '[P]ython')
leader_keymap('sdp', '<CMD>lua PythonRunFile()<CR>', '[P]ython')
-- pytest current file
function TestFile()
  local expand = vim.fn.expand
  local file_extension = expand '%:e'
  local file_name = expand '%'
  local file_no_ext = string.gsub(file_name, '.' .. file_extension, '')
  if file_extension == 'python' or file_extension == 'py' then
    local test = 'pytest ' .. file_no_ext .. '_test.' .. file_extension
    return vim.api.nvim_command(':SlimeSend1 ' .. test)
  else
    vim.notify('Tests not setup for ' .. file_extension .. ' files')
  end
end
leader_keymap('st', '<CMD>lua TestFile()<CR>', '[S]lime [T]est')

-- NOTE: Toggling
function ToggleLinebreak()
  if vim.wo.linebreak then
    vim.wo.linebreak = false
  else
    vim.wo.linebreak = true
  end
end
leader_keymap('tl', '<CMD>lua ToggleLinebreak()<cr>', '[T]oggle [L]inebreak')
-- Markdown preview
function ToggleMarkdownPreview()
  local peek = require 'peek'
  if peek.is_open() then
    peek.close()
  else
    peek.open()
  end
end
leader_keymap('tm', '<CMD>lua ToggleMarkdownPreview()<CR>', '[T]oggle [M]arkdown Preview')
-- LaTex Preview
-- leader_keymap('tt', ':VimtexCompile<CR>', '[T]oggle [T]ex Preview')

-- NOTE: Fuzzy find
leader_keymap('f/', '<Cmd>Pick history scope="/"<CR>', '[F]ind "/" history')
leader_keymap('f:', '<Cmd>Pick history scope=":"<CR>', '[F]ind ":" history')
leader_keymap('fb', '<Cmd>Pick buffers<CR>', '[F]ind [B]uffers')
leader_keymap('ff', '<Cmd>Pick files<CR>', '[F]ind [F]iles')
leader_keymap('fk', '<Cmd>Pick keymaps<CR>', '[F]ind [K]eymaps')
leader_keymap('fo', '<Cmd>Pick options<CR>', '[F]ind [O]ptions')
leader_keymap('fg', '<Cmd>Pick grep_live<CR>', '[F]ind [G]rep')
leader_keymap('fw', '<Cmd>Pick grep pattern="<cword>"<CR>', '[F]ind Grep current [W]ord')
leader_keymap('fh', '<Cmd>Pick help<CR>', '[F]ind [H]elp')
leader_keymap('fn', '<Cmd>Pick neovim<CR>', '[F]ind [N]eovim')
leader_keymap('fN', '<Cmd>Pick neovim_grep<CR>', '[F]ind with Grep [N]eovim')
leader_keymap('fc', '<Cmd>Pick git_commits<CR>', 'Commits (all)')
leader_keymap('fC', '<Cmd>Pick git_commits path="%"<CR>', 'Commits (current)')
-- leader_keymap('fd', '<Cmd>Pick diagnostic scope="all"<CR>', '[F]ind workspace [D]iagnostics')
leader_keymap('fd', '<Cmd>Pick diagnostic scope="current"<CR>', '[F]ind buffer [D]iagnostics')
leader_keymap('ft', '<Cmd>Pick treesitter<CR>', '[F]ind in [T]reesitter')
-- NOTE: Lsp actions
--
-- In C this would take you to the header
keymap('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
keymap('n', 'gI', '<CMD>Pick lsp scope="implementation"<CR>', { desc = '[G]oto [I]mplementation' })
leader_keymap('rn', vim.lsp.buf.rename, '[R]e[N]ame')
leader_keymap('ds', '<CMD>Pick lsp scope="document_symbol"<CR>', '[D]ocument [S]ymbols')
leader_keymap('dws', '<CMD>Pick lsp scope="workspace_symbol"<CR>', '[W]orkspace [S]ymbols')
leader_keymap('dr', '<CMD>Pick lsp scope="references"<CR>', '[R]eferences')
leader_keymap('dD', '<CMD>Pick lsp scope="type_definition"<CR>', 'Type [D]efinition')
leader_keymap('ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
-- Opens a popup that displays documentation about the word under your cursor
keymap('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
vim.keymap.set('n', '<leader>,,', ':luafile /Users/freddymarten/.config/nvim/after/ftplugin/sql.lua<CR>')

-- NOTE: Neovim functions
leader_keymap('ns', ':e $MYVIMRC | :cd %:p:h<cr>', '[S]ettings')
leader_keymap('nk', ':e ~/.config/nvim/lua/custom/keymaps.lua | :cd %:p:h<cr>', '[K]eymaps')
leader_keymap('no', ':e ~/.config/nvim/lua/custom/options.lua | :cd %:p:h<cr>', '[O]ptions')
leader_keymap('na', ':e ~/.config/nvim/lua/custom/autocommands.lua | :cd %:p:h<cr>', '[A]utocommands')
