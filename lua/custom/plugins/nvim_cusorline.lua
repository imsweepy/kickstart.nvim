vim.pack.add { 'https://github.com/yamatsum/nvim-cursorline' }

local cursorline = require 'nvim-cursorline'
cursorline.setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  },
}
