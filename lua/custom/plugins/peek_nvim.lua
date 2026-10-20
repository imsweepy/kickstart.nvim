-- The build step (`deno task --quiet build:fast`) runs from the `PackChanged` autocmd in init.lua
vim.pack.add { 'https://github.com/toppair/peek.nvim' }

require('peek').setup()
vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
