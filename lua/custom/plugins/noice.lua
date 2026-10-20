vim.pack.add {
  'https://github.com/MunifTanjim/nui.nvim',
  -- OPTIONAL:
  --   `nvim-notify` is only needed, if you want to use the notification view.
  --   If not available, we use `mini` as the fallback
  'https://github.com/rcarriga/nvim-notify',
  'https://github.com/folke/noice.nvim',
}

require('noice').setup {
  lsp = { signature = { enabled = false } }, -- add any options here
}
