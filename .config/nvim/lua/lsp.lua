require("mason").setup()
require("mason-lspconfig").setup()

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<Esc>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			local col = vim.fn.col(".") - 1

			if cmp.visible() then
				cmp.select_next_item({ select = true })
			elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
				fallback()
			else
				cmp.complete()
			end
		end, { "i", "s" }),
		["<C-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ select = true })
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", max_item_count = 20, trigger_characters = { ".", "::", "->" } },
		{ name = "vsnip", max_item_count = 20 },
	}, {
		{ name = "buffer" },
	}),
})
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
require("lspconfig").marksman.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
require("lspconfig").pylsp.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
require("lspconfig").sqls.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
require("lspconfig").typos_lsp.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

local metals_config = require("metals").bare_config()
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

local function omnifunc(buf)
	vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"

	local opts = { buffer = buf }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "td", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>c", vim.lsp.buf.code_action, opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		omnifunc(ev.buf)
	end,
})

metals_config.on_attach = function(client, bufnr)
	omnifunc(bufnr)
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sbt", "java" },
	callback = function()
		require("metals").initialize_or_attach(metals_config)
	end,
	group = vim.api.nvim_create_augroup("nvim-metals", { clear = true }),
})
