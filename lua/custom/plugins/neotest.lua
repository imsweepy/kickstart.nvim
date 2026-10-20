vim.pack.add({
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/antoinemadec/FixCursorHold.nvim",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	"https://github.com/nvim-neotest/neotest-plenary",
	"https://github.com/nvim-neotest/neotest-vim-test",

	"https://github.com/nvim-neotest/neotest-go",

	"https://github.com/nvim-neotest/neotest",
})

-- get neotest namespace (api call creates or returns namespace)
local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
	virtual_text = {
		format = function(diagnostic)
			local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
			return message
		end,
	},
}, neotest_ns)
require("neotest").setup({
	-- your neotest config here
	adapters = {
		require("neotest-go")({
			recursive_run = true,
			experimental = {
				-- test_table = true,
			},
			args = { "-parallel=1000", "-race", "-v", "-timeout 60s" },
		}),
	},
	icons = {
		failed = "✗",
		passed = "✓",
		unknown = "?",
	},
})

vim.keymap.set("n", "<leader>tt", function()
	vim.cmd("wa")
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run File" })
vim.keymap.set("n", "<leader>tT", function()
	require("neotest").run.run(vim.uv.cwd())
end, { desc = "Run All Test Files(breaks for big projects)" })
vim.keymap.set("n", "<leader>tr", function()
	vim.cmd("wa")
	require("neotest").run.run()
end, { desc = "Run Nearest" })
vim.keymap.set("n", "<leader>tl", function()
	vim.cmd("wa")
	require("neotest").run.run_last()
end, { desc = "Run Last" })
vim.keymap.set("n", "<leader>ts", function()
	require("neotest").summary.toggle()
end, { desc = "Toggle Summary" })
vim.keymap.set("n", "<leader>to", function()
	require("neotest").output.open({ enter = true, auto_close = true })
end, { desc = "Show Output" })
vim.keymap.set("n", "<leader>tO", function()
	require("neotest").output_panel.toggle()
end, { desc = "Toggle Output Panel" })
vim.keymap.set("n", "<leader>tS", function()
	require("neotest").run.stop()
end, { desc = "Stop" })
vim.keymap.set("n", "<leader>tw", function()
	require("neotest").watch.toggle()
end, { desc = "Toggle watch" })
