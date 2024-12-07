require('femaco').setup {
  -- what to do after opening the float
  post_open_float = function(winnr)
    if vim.bo.filetype == 'rust' then
      require('rust-tools.standalone').start_standalone_client()
    end
  end,
}
