return {
  {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',
    -- use a release tag to download pre-built binaries
    version = 'v1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      keymap = {
        ['<C-j>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        ['<C-y>'] = { 'select_and_accept' },

        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      },
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    -- opts_extend = { 'sources.default' },
    -- kind_icons = {
    --     Text = '󰉿',
    --     Method = '󰊕',
    --     Function = '󰊕',
    --     Constructor = '󰒓',
    --
    --     Field = '󰜢',
    --     Variable = '󰆦',
    --     Property = '󰖷',
    --
    --     Class = '󱡠',
    --     Interface = '󱡠',
    --     Struct = '󱡠',
    --     Module = '󰅩',
    --
    --     Unit = '󰪚',
    --     Value = '󰦨',
    --     Enum = '󰦨',
    --     EnumMember = '󰦨',
    --
    --     Keyword = '󰻾',
    --     Constant = '󰏿',
    --
    --     Snippet = '󱄽',
    --     Color = '󰏘',
    --     File = '󰈔',
    --     Reference = '󰬲',
    --     Folder = '󰉋',
    --     Event = '󱐋',
    --     Operator = '󰪚',
    --     TypeParameter = '󰬛',
    --   },
  },
}
