return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- LSP completion source
    'hrsh7th/cmp-buffer', -- Buffer completion source
    'hrsh7th/cmp-path', -- Filesystem path completion
    'hrsh7th/cmp-cmdline', -- Command-line completion
    'L3MON4D3/LuaSnip', -- Snippet engine
    'saadparwaiz1/cmp_luasnip', -- Snippet completions
  },
  config = function()
    local cmp = require 'cmp'
    cmp.setup {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item.
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
        { name = 'path' },
      }),
    }

    -- Setup for command-line completion
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
    })
  end,
}
