require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

require("telescope").load_extension("fzf")

vim.cmd([[
nnoremap <leader>ff <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep find_command=rg,--ignore,--hidden,--files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
]])
