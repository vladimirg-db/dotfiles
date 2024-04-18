local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},

		scala = {
			function()
				return {
					exe = "scalafmt",
					args = {
						"--config /Users/vladimir.golubev/universe/bazel/scalafmt/scalafmt.conf",
						"--stdin",
						"--assume-filename",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
				}
			end,
		},

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
