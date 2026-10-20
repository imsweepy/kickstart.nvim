-- The build step (installing the Go binaries) runs from the `PackChanged` autocmd in init.lua
vim.pack.add {
  -- optional packages
  'https://github.com/ray-x/guihua.lua',
  'https://github.com/neovim/nvim-lspconfig',
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },

  'https://github.com/ray-x/go.nvim',
}

require('go').setup {
  gofmt = 'golines',
  max_line_len = 110,
}

-- Run gofmt + goimports on save
local format_sync_grp = vim.api.nvim_create_augroup('goimports', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    require('go.format').goimports()
  end,
  group = format_sync_grp,
})
