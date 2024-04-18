for _, v in ipairs({
	{ "<leader>xx", "<cmd>Trouble<cr>" },
	{ "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>" },
	{ "<leader>xd", "<cmd>Trouble document_diagnostics<cr>" },
	{ "<leader>xl", "<cmd>Trouble loclist<cr>" },
	{ "<leader>xq", "<cmd>Trouble quickfix<cr>" },
	{ "gR", "<cmd>Trouble lsp_references<cr>" },
}) do
	vim.keymap.set("n", v[1], v[2], { noremap = true, silent = true })
end

require("trouble").setup({})
