return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = 'skim'
    -- Disable insert mode mappings (in favor of a dedicated snippet engine)
    vim.g.vimtex_imaps_enabled = 0
    -- Disable syntax conceal
    vim.g.vimtex_syntax_conceal_disable = 1
    -- Default is 500 lines and gave me lags on missed key presses
    vim.g.vimtex_delim_stopline = 50
    -- Don't open quickfix for warning messages if no errors are present
    vim.g.vimtex_quickfix_open_on_warning = 0
  end,
}
