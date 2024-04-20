vim.cmd([[
    let g:ale_linters = {
    \    'java': ['checkstyle'],
    \    'scala': ['scalastyle'],
    \}

    let g:ale_java_checkstyle_config = '/Users/vladimir.golubev/runtime/dev/checkstyle.xml'
    let g:ale_scala_scalastyle_config = '/Users/vladimir.golubev/runtime/scalastyle-config.xml'

    let g:ale_fixers = {
    \    '*': ['remove_trailing_lines', 'trim_whitespace'],
    \    'scala': ['scalafmt'],
    \    'lua': ['stylua'],
    \}

    nnoremap <silent> <leader>f :ALEFix<CR>

    let g:ale_scala_scalafmt_options = '--config /Users/vladimir.golubev/universe/bazel/scalafmt/scalafmt.conf'

    let g:ale_use_neovim_diagnostics_api = 1
]])

