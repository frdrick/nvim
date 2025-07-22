return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup {
      mappings = {
        add = ';;',
        delete = ';d',
        find = '',
        find_left = '',
        highlight = '',
        replace = ';r',
        update_n_lines = '',
      },
    }
    require('mini.pick').setup()

    MiniPick.registry.neovim = function(local_opts)
      -- vim.fn.stdpath 'config' gives full pathname of config
      local opts = { source = { cwd = vim.fn.stdpath 'config', name = 'Neovim Config' } }
      return MiniPick.builtin.files(local_opts, opts)
    end
    MiniPick.registry.neovim_grep = function(local_opts)
      -- vim.fn.stdpath 'config' gives full pathname of config
      local opts = { source = { cwd = vim.fn.stdpath 'config', name = 'Grep Neovim Config' } }
      return MiniPick.builtin.grep_live(local_opts, opts)
    end
    -- MiniPick.builtin.cli({ command = { 'echo', 'a\nb\nc' } })
    require('mini.extra').setup()
    require('mini.files').setup()
    require('mini.pairs').setup()
    -- require('mini.operators').setup()
    require('mini.move').setup()
    require('mini.starter').setup()
    require('mini.icons').setup()
    -- Simple and easy statusline. You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = true }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
