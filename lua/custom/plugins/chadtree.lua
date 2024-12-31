return {
	{
		"ms-jpq/chadtree",
		config = function()
			-- vim.cmd("CHADopen")
			vim.keymap.set("n", "\\", "<cmd>CHADopen<CR>", { desc = "CHADopen" })
		end,
	},
}
