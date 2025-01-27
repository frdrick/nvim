return { -- LSP Configuration & Plugins
  {
    'williamboman/mason.nvim',
    -- config = function()
    --   require('mason').setup()
    -- end,
    opts = {},
  },
  {
    'williamboman/mason-lspconfig.nvim',
    -- config = function()
    --   require('mason-lspconfig').setup {
    --   }
    -- end,
    opts = {
      ensure_installed = {
        'lua_ls',
        'ruff',
        'pyright',
        'clangd',
        'marksman',
        'html',
        'ltex',
      },
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    -- config = function()
    --   require('mason-tool-installer').setup {
    --   }
    -- end,
    opts = {
      ensure_installed = {
        'stylua',
        'black',
        'isort',
        'beautysh',
        'prettier',
        -- 'sqlfmt',
      },
    },
  },
  --   -- Useful status updates for LSP.
  --   -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  {
    'j-hui/fidget.nvim',
    opts = {},
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'folke/lazydev.nvim',
        ft = 'lua', -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
      },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- In this case, we create a that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })
      local lspconfig = require 'lspconfig'
      -- lua
      lspconfig.lua_ls.setup {}
      -- python
      lspconfig.ruff.setup {
        init_options = {
          settings = {
            args = {},
          },
        },
      }
      lspconfig.pyright.setup {
        settings = {
          pyright = {
            autoImportCompletion = true,
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              extraPaths = { '/Users/freddymarten/miniforge3/envs/' },
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { '*' },
            },
          },
        },
      }
      -- c
      lspconfig.clangd.setup {}
      -- markdown
      lspconfig.marksman.setup {}
      -- html
      lspconfig.html.setup {}
      -- shell scripts (sh)
      lspconfig.bashls.setup {}
      -- ltex (markdown, tex, ect.)
      lspconfig.ltex.setup {}
      -- sql
    end,
  },
  {
    'icewind/ltex-client.nvim',
    -- adds ltex code action functionality
    -- see ~/.ltex for rules and dictionaries in json format
    opts = {},
  },
}
