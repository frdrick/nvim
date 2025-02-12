return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'html',
        'lua',
        'markdown',
        'vim',
        'vimdoc',
        'markdown_inline',
        'sql',
        'python',
        'r',
        'json',
        'yaml',
        'dockerfile',
        'gitignore',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- disable = { 'latex' },
        -- additional_vim_regex_highlighting = { 'latex', 'markdown' },
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              ['ic'] = { query = '@block.inner', query_group = 'textobjects', desc = 'Select inner code block' },
              ['oc'] = { query = '@block.outer', query_group = 'textobjects', desc = 'Select outer code block' },
            },
          },
        },
      },
      indent = { enable = true },
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
    lazy = true,
    opts = {},
  },
}
