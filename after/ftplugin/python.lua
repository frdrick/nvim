local set = vim.opt_local
set.shiftwidth = 4
local Keymap = vim.keymap.set
local NLeaderKeymap = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  Keymap('n', '<Leader>' .. suffix, rhs, opts)
end
-- run current python file
function PythonRunFile()
  local python_path = vim.fn.systemlist('which python3')[1]
  local scipt_path = vim.fn.expand '%:p'
  return vim.api.nvim_command(':SlimeSend1 ' .. python_path .. ' ' .. scipt_path)
end
NLeaderKeymap('sr', '<CMD>lua PythonRunFile()<CR>', '[S]lime [R]un file')
-- run current python file
function IPythonRunFile()
  local scipt_path = vim.fn.expand '%:p'
  return vim.api.nvim_command(':SlimeSend1 %run ' .. scipt_path)
end
NLeaderKeymap('si', '<CMD>lua IPythonRunFile()<CR>', '[S]lime [I]python run file')
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
NLeaderKeymap('st', '<CMD>lua TestFile()<CR>', '[S]lime [T]est')
--auto format python file
-- following global black install (brew install black)
NLeaderKeymap('rf', ':silent !black %<CR>', '[F]ormat', { silent = true })
