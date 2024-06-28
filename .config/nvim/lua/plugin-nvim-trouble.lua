for _, v in ipairs({
	{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>" },
	{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" },
	{ "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>" },
	{ "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>" },
	{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>" },
	{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>" },
}) do
	vim.keymap.set("n", v[1], v[2], { noremap = true, silent = true })
end

require("trouble").setup({})
