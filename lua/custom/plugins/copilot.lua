return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				{
					suggestion = {
						enabled = true,
						auto_trigger = true,
						debounce = 75,
						keymap = {
							accept = "<M-l>",
							accept_word = false,
							accept_line = false,
							next = "<M-]>",
							prev = "<M-[>",
							dismiss = "<C-]>",
						},
					},
					filetypes = {
						markdown = false,
						help = false,
						gitcommit = false,
						gitrebase = false,
						hgcommit = false,
						svn = false,
						cvs = false,
						["*"] = true,
					},
					copilot_node_command = "node", -- Node.js version must be > 18.x
					server_opts_overrides = {},
				},
			})
			vim.keymap.set(
				"i",
				"<tab>",
				vim.schedule_wrap(function()
					require("copilot.suggestion").accept("<CR>")
				end),
				{ silent = true, expr = true }
			)
			vim.keymap.set(
				"i",
				"<C-j>",
				vim.schedule_wrap(function()
					require("copilot.suggestion").next()
				end),
				{ silent = true, expr = true }
			)
			vim.keymap.set(
				"i",
				"<C-k>",
				vim.schedule_wrap(function()
					require("copilot.suggestion").prev()
				end),
				{ silent = true, expr = true }
			)
			require("copilot.suggestion").toggle_auto_trigger()
		end,
	},
}
