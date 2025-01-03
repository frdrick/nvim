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
          -- NOTE: Remember that lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself
          -- many times.
          --
          -- In this case, we create a that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace
          --  Similar to document symbols, except searches over your whole project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
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
      -- latex
      lspconfig.texlab.setup {}
    end,
  },
  {
    'icewind/ltex-client.nvim',
    -- adds ltex code action functionality
    -- see ~/.ltex for rules and dictionaries in json format
    opts = {},
  },
}
