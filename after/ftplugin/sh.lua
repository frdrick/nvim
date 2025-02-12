local set = vim.opt_local
set.shiftwidth = 3

local Keymap = vim.keymap.set
local NLeaderKeymap = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  Keymap('n', '<Leader>' .. suffix, rhs, opts)
end
function ShellSourceFile()
  local scipt_path = vim.fn.expand '%:p'
  return vim.api.nvim_command(':SlimeSend1 source ' .. scipt_path)
end

NLeaderKeymap('sr', '<CMD>lua ShellSourceFile() <CR>', '[S]lime [R]un file')
