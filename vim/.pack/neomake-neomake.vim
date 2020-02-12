" General {{{
let g:neomake_virtualtext_current_error=0
let g:neomake_highlight_columns=0

function! s:FindProjectExecutable(name) abort
    let project_root = neomake#utils#get_project_root()
    if empty(project_root)
        return ''
    endif

    let exe = project_root.a:name
    if !executable(exe)
        return ''
    endif

    return exe
endfunction

function! s:FindProjectFile(glob) abort
    let project_root = neomake#utils#get_project_root()
    if empty(project_root)
        return ''
    endif

    let fileFound = globpath(project_root, a:glob)
    if empty(fileFound)
        return ''
    endif

    return fileFound
endfunction
" }}}

" PHP {{{
let neomake#makers#ft#php#project_root_files = ['composer.json']
let g:neomake_php_enabled_makers = ['phpcs', 'phpstan']

"   PHPCS {{{
let g:neomake_php_phpcs_maker = {
    \ 'args': ['--report=csv', '-q'],
    \ 'errorformat':
    \ '%-GFile\,Line\,Column\,Type\,Message\,Source\,Severity%.%#,'.
    \ '"%f"\,%l\,%c\,%t%*[a-zA-Z]\,"%m"\,%*[a-zA-Z0-9_.-]\,%*[0-9]%.%#',
    \ }

function! g:neomake_php_phpcs_maker.InitForJob(jobinfo) abort
    let maker = deepcopy(self)

    let exe = s:FindProjectExecutable('/vendor/bin/'.(maker.name))
    if !empty(exe)
        " Use phpcs from composer instead of global executable
        let maker.exe = exe
    endif

    let config = s:FindProjectFile('{phpcs.xml,phpcs.xml.dist}')
    if !empty(config)
        " Use project root path for working directory to load PHPStan configuration
        let maker.cwd = fnamemodify(config, ':p:h')
    else
        if exists('g:neomake_php_phpcs_args_standard')
            call add(args, '--standard=' . expand(g:neomake_php_phpcs_args_standard))
        endif
    endif

    return maker
endfunction
"   }}}

"   PHPStan {{{
let g:neomake_php_phpstan_maker = {
    \ 'args': ['analyse', '--error-format', 'raw', '--no-progress'],
    \ 'errorformat': '%E%f:%l:%m',
    \ }

function! g:neomake_php_phpstan_maker.InitForJob(jobinfo) abort
    let maker = deepcopy(self)

    let exe = s:FindProjectExecutable('/vendor/bin/'.(maker.name))
    if !empty(exe)
        " Use phpstan from composer instead of global executable
        let maker.exe = exe
    endif

    let config = s:FindProjectFile('{phpstan.neon,phpstan.neon.dist}')
    if !empty(config)
        " Use project root path for working directory to load PHPStan configuration
        let maker.cwd = fnamemodify(config, ':p:h')
    else
        call extend(maker.args, ['--level', get(g:, 'neomake_phpstan_level', 0)])
    endif

    return maker
endfunction
"   }}}
" }}}
