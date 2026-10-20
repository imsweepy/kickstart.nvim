vim.pack.add {
  'https://github.com/kkharji/sqlite.lua',
  'https://github.com/gbprod/yanky.nvim',
}

require('yanky').setup {
  ring = { storage = 'sqlite' },
}

vim.keymap.set('n', '<leader>p', function()
  require('telescope').extensions.yank_history.yank_history {}
end, { desc = 'Open Yank History' })
vim.keymap.set({ 'n', 'x' }, 'y', '<Plug>(YankyYank)', { desc = 'Yank text' })
vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)', { desc = 'Put yanked text after cursor' })
vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)', { desc = 'Put yanked text before cursor' })
vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)', { desc = 'Put yanked text after selection' })
vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)', { desc = 'Put yanked text before selection' })
vim.keymap.set('n', '<c-p>', '<Plug>(YankyPreviousEntry)', { desc = 'Select previous entry through yank history' })
vim.keymap.set('n', '<c-n>', '<Plug>(YankyNextEntry)', { desc = 'Select next entry through yank history' })
vim.keymap.set('n', ']p', '<Plug>(YankyPutIndentAfterLinewise)', { desc = 'Put indented after cursor (linewise)' })
vim.keymap.set('n', '[p', '<Plug>(YankyPutIndentBeforeLinewise)', { desc = 'Put indented before cursor (linewise)' })
vim.keymap.set('n', ']P', '<Plug>(YankyPutIndentAfterLinewise)', { desc = 'Put indented after cursor (linewise)' })
vim.keymap.set('n', '[P', '<Plug>(YankyPutIndentBeforeLinewise)', { desc = 'Put indented before cursor (linewise)' })
vim.keymap.set('n', '>p', '<Plug>(YankyPutIndentAfterShiftRight)', { desc = 'Put and indent right' })
vim.keymap.set('n', '<p', '<Plug>(YankyPutIndentAfterShiftLeft)', { desc = 'Put and indent left' })
vim.keymap.set('n', '>P', '<Plug>(YankyPutIndentBeforeShiftRight)', { desc = 'Put before and indent right' })
vim.keymap.set('n', '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)', { desc = 'Put before and indent left' })
vim.keymap.set('n', '=p', '<Plug>(YankyPutAfterFilter)', { desc = 'Put after applying a filter' })
vim.keymap.set('n', '=P', '<Plug>(YankyPutBeforeFilter)', { desc = 'Put before applying a filter' })
