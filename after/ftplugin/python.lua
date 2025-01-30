local set = vim.opt_local
set.shiftwidth = 4
local keymap = vim.keymap.set
local leader_keymap = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  keymap('n', '<Leader>' .. suffix, rhs, opts)
end
-- start ipython
leader_keymap('sei', '<CMD>SlimeSend1 ipython<CR>', '[S]lime [E]nter [I]python')
-- quit ipython
leader_keymap('sqi', '<CMD>SlimeSend1 quit<CR>', '[S]lime [I]python')
-- start python
leader_keymap('sep', '<CMD>SlimeSend1 python<CR>', '[S]lime [E]nter [P]ython')
-- quit python
leader_keymap('sqp', '<CMD>SlimeSend1 quit()<CR>', '[S]lime [P]ython')
function PythonRunFile()
  local python_path = vim.fn.systemlist('which python3')[1]
  local scipt_path = vim.fn.expand '%:p'
  return vim.api.nvim_command(':SlimeSend1 ' .. python_path .. ' ' .. scipt_path)
end
leader_keymap('sr', '<CMD>lua PythonRunFile()<CR>', '[P]ython')
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
