return { -- Autoformat
  'stevearc/conform.nvim',
  opts = {
    -- formatters = {
    --   ruff = {
    --     command = 'ruff',
    --     args = { 'check', '--fix', '--config', 'ruff.toml', '-' },
    --     stdin = true,
    --   },
    -- },
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      css = { 'prettier' },
      html = { 'prettier' },
      json = { 'prettier' },
      yaml = { 'prettier' },
      markdown = { 'prettier' },
      -- Conform can also run multiple formatters sequentially
      python = { 'ruff' },
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },
    },
  },
  -- config = function()
  -- end,
}
