return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc', 'markdown_inline', 'sql', 'python' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- disable = { 'latex' },
        additional_vim_regex_highlighting = { 'latex', 'markdown' },
      },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['af'] = { query = '@function.outer', desc = 'Select outer part of function' },
            ['if'] = { query = '@function.inner', desc = 'Select inner part of function' },
            -- 'in' here meaning no semicolon
            ['qq'] = { query = '@query', desc = 'Select [Q]uery' },
            -- 'outer' here meaning to add a semicolon here
            -- ['oQ'] = { query = '@statement', desc = 'Select full [Q]uery' },
            -- 'in' here meaning no brackets or semicolon
            ['iS'] = { query = '@subquery', desc = 'Select inner part of [S]ubquery' },
            -- 'outer' here would be including brackets may need to make this into a custom function
            -- ['oS'] = { query = '@subquery.outer', desc = 'Select outer part of [S]ubquery' },
            -- ['iQ'] = { query = '@statement.end', desc = 'Select end of [S]tatement' },
          },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true or false
          include_surrounding_whitespace = {
            { '@function.inner', 'v', true },
            { '@query', 'v', false },
          },
        },
      },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)
      -- keep code block delimiters in markdown (with other plugins this will hide them)
      require('vim.treesitter.query').set('markdown', 'highlights', '(fenced_code_block_delimiter) @punctuation.delimiter') -- Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {},
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter/nvim-treesitter',
  },
}
