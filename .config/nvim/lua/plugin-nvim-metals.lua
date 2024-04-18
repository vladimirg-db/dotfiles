local metals_config = require("metals").bare_config()

metals_config.on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	for _, v in ipairs({
		{ "gD", vim.lsp.buf.declaration },
		{ "gd", vim.lsp.buf.definition },
		{ "K", vim.lsp.buf.hover },
		{ "gi", vim.lsp.buf.implementation },
		{ "<C-k>", vim.lsp.buf.signature_help },
		{ "<space>wa", vim.lsp.buf.add_workspace_folder },
		{ "<space>wr", vim.lsp.buf.remove_workspace_folder },
		{
			"<space>wl",
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
		},
		{ "<space>D", vim.lsp.buf.type_definition },
		{ "<space>rn", vim.lsp.buf.rename },
		{ "<space>ca", vim.lsp.buf.code_action },
		{ "gr", vim.lsp.buf.references },
		{ "<space>f", vim.lsp.buf.formatting },
	}) do
		vim.keymap.set("n", v[1], v[2], { noremap = true, silent = true, buffer = bufnr })
	end
end

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sbt", "java" },
	callback = function()
		require("metals").initialize_or_attach(metals_config)
	end,
	group = nvim_metals_group,
})
