require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		live_grep = {
			additional_args = { "--hidden", "--smart-case" },
		},
	},
})

require("telescope").load_extension("fzf")

vim.cmd([[
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fs <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
]])
