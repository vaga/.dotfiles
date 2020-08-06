" Configuration {{{1
let g:lsp_diagnostics_enabled = 0

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nmap <buffer> gd <plug>(lsp-definition)
endfunction

augroup lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" LSP Servers {{{1
" PHP {{{2
if executable('intelephense')
    augroup lsp_intelephense
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'intelephense',
            \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
            \ 'whitelist': ['php'],
            \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
            \ 'workspace_config': {
            \   'intelephense': {
            \     'files': {
            \       'maxSize': 1000000,
            \       'associations': ['*.php'],
            \       'exclude': [],
            \     },
            \     'completion': {
            \       'insertUseDeclaration': v:true,
            \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
            \       'triggerParameterHints': v:true,
            \       'maxItems': 100,
            \     },
            \     'format': {
            \       'enable': v:true
            \     },
            \   },
            \ }
            \})
    augroup END
endif

" Javascript/Typescript {{{2
if executable('typescript-language-server')
    augroup lsp_typescript_language_server
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'typescript-language-server',
            \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
            \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
            \ 'whitelist': ['javascript', 'typscript'],
            \ })
    augroup END
endif

" Vuejs {{{2
if executable('vls')
    augroup lsp_vls
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'vls',
            \ 'cmd': {server_info->[&shell, &shellcmdflag, 'vls --stdio']},
            \ 'whitelist': ['vue'],
            \ })
    augroup END
endif
