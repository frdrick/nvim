return {
  -- adds Key bindings	Description
  -- <count>ai	An Indentation level and line above.
  -- <count>ii	Inner Indentation level (no line above).
  -- <count>aI	An Indentation level and lines above/below.
  -- <count>iI	Inner Indentation level (no lines above/below).
  { 'michaeljsmith/vim-indent-object' },
  {
    'kana/vim-textobj-user',
    requires = {
      'nvim-treesitter/nvim-treesitter', -- optional, for syntax-aware text objects
    },
  },
}
