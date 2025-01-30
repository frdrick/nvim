vim.bo.commentstring = '-- %s'
vim.wo.linebreak = true
vim.g.slime_cell_delimiter = '--'
-- local set = vim.opt_local
-- set.shiftwidth = 4
-- set.tabstop = 8
-- setup text object
-- set.smartindent = 1
-- set.cindent = 1
local parsers = require 'nvim-treesitter.parsers'
local parser = parsers.get_parser()
local tree = parser:parse()[1]
local root = tree:root()
local root_type = root:type()

local Keymap = vim.keymap.set
-- Create `<Leader>` mappings (from echasnovski/nvim)
local NLeaderKeymap = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  Keymap('n', '<Leader>' .. suffix, rhs, opts)
end

-- find
local FindNode
---@param name string
---@param node TSNode
function FindNode(node, name)
  -- check node type
  local type = node:type()
  -- if node type is the root (often program, terminate and notify)
  if type == root_type then
    local notif = 'No sql ' .. name .. ' found!'
    return vim.notify(notif)
  -- end if on a subquery
  elseif type == name then
    local node_text = vim.treesitter.get_node_text(node, 0)
    -- for subqueries we want to remove excess brackets to prepare them for sending
    if name == 'subquery' then
      if node_text:sub(1, 1) == '(' then
        node_text = node_text:sub(2)
        if node_text:sub(1, 1) == '\n' then
          node_text = node_text:sub(2)
        end
      end
      if node_text:sub(-1, -1) == ')' then
        node_text = node_text:sub(1, -2)
        if node_text:sub(-1, -1) == '\n' then
          node_text = node_text:sub(1, -2)
        end
      end
    end
    return node_text
  else
    local parent = node:parent()
    return FindNode(parent, name)
  end
end
---@param name string
function SendNode(name)
  local ts = vim.treesitter
  local curr_node = ts.get_node()
  ---@cast curr_node -nil
  local query = FindNode(curr_node, name)
  if query == nil then
    return
  end
  return vim.api.nvim_command(':SlimeSend1 ;\n' .. query .. ';')
end

NLeaderKeymap('ss', '<CMD>lua SendNode("subquery")<CR>', '[S]lime [S]ubquery')
NLeaderKeymap('sq', '<CMD>lua SendNode("statement")<CR>', '[S]lime [Q]uery')
