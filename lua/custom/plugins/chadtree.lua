vim.pack.add({ { src = "https://github.com/ms-jpq/chadtree", version = "chad" } })

-- vim.cmd("CHADopen")
vim.keymap.set("n", "\\", "<cmd>CHADopen<CR>", { desc = "CHADopen" })
