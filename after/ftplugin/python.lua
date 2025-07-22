local set = vim.opt_local
set.shiftwidth = 4
local Keymap = vim.keymap.set
local LeaderKeymap = function(mode, suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  Keymap(mode, '<Leader>' .. suffix, rhs, opts)
end
-- run current python file
function PythonRunFile()
  local python_path = vim.fn.systemlist('which python3')[1]
  local scipt_path = vim.fn.expand '%:p'
  return vim.api.nvim_command(':SlimeSend1 ' .. python_path .. ' ' .. scipt_path)
end
LeaderKeymap('n', 'sr', '<CMD>lua PythonRunFile()<CR>', '[S]lime [R]un file')
-- run current python file
function IPythonRunFile()
  local scipt_path = vim.fn.expand '%:p'
  return vim.api.nvim_command(':SlimeSend1 %run ' .. scipt_path)
end
LeaderKeymap('n', 'si', '<CMD>lua IPythonRunFile()<CR>', '[S]lime [I]python run file')
-- pytest current file
function TestFile(arg)
  local expand = vim.fn.expand
  -- see :help expand for more on the following lines
  local file_extension = expand '%:e'
  local file_name = expand '%:t'
  -- remove extension from filename
  local file_no_ext = string.gsub(file_name, '.' .. file_extension, '')
  -- If filetype valid then test otherwise throw error
  if file_extension == 'python' or file_extension == 'py' then
    local test = 'pytest ' .. file_no_ext .. '_test.' .. file_extension
    return vim.api.nvim_command(':SlimeSend1 ' .. test .. ' ' .. arg)
  else
    vim.notify('Tests not setup for ' .. file_extension .. ' files')
  end
end
LeaderKeymap('n', 'st', '<CMD>lua TestFile("")<CR>', '[S]lime [T]est')
LeaderKeymap('n', 'sT', '<CMD>lua TestFile("-v")<CR>', '[S]lime [T]est Verbose')
--auto format python file
-- following global black install (brew install black)
LeaderKeymap('n', 'rf', ':silent !black %<CR>', '[F]ormat', { silent = true })
