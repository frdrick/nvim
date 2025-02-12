vim.wo.linebreak = true
vim.g.slime_cell_delimiter = '```'

ExtraTextObjs = require 'various-textobjs'
local Keymap = vim.keymap.set

Keymap({ 'o', 'x' }, 'ic', '<CMD>lua ExtraTextObjs.mdFencedCodeBlock("inner")<CR>', { desc = 'inner md code chunk' })
Keymap({ 'o', 'x' }, 'ac', '<CMD>lua ExtraTextObjs.mdFencedCodeBlock("outer")<CR>', { desc = 'outer md code chunk' })
Keymap({ 'o', 'x' }, 'ie', '<CMD>lua ExtraTextObjs.mdEmphasis("inner")<CR>', { desc = 'inner emphasis' })
Keymap({ 'o', 'x' }, 'ae', '<CMD>lua ExtraTextObjs.mdEmphasis("outer")<CR>', { desc = 'outer emphasis' })
Keymap({ 'o', 'x' }, 'iL', '<CMD>lua ExtraTextObjs.mdLink("inner")<CR>', { desc = 'inner link' })
Keymap({ 'o', 'x' }, 'aL', '<CMD>lua ExtraTextObjs.mdLink("outer")<CR>', { desc = 'outer link' })
