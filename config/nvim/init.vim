let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged') " Colorscheme support

Plug 'skywind3000/vim-preview'
Plug 'kshenoy/vim-signature'
Plug 'windwp/nvim-projectconfig'
Plug 'fs111/pydoc.vim'
Plug 'sillybun/vim-repl'
" Plug 'hkupty/iron.nvim'

" Themes
Plug 'p7g/vim-bow-wob'
Plug 'lifepillar/vim-solarized8'
Plug 'Yggdroot/indentLine'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Language Support
Plug 'jalvesaq/vimcmdline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'voldikss/vim-mma'
" Plug 'goerz/jupytext.vim'

" Cpp
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'puremourning/vimspector'

" R
Plug 'jalvesaq/Nvim-R'

" lintr
Plug 'dense-analysis/ale'
Plug 'rhysd/vim-grammarous'

" Plug 'junegunn/vim-easy-align'
Plug '907th/vim-auto-save'

Plug 'tpope/vim-surround'
" Read on Zhihu
" Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'
Plug 'PotatoesMaster/i3-vim-syntax'
" Plug 'jreybert/vimagit'
" Plug 'vimwiki/vimwiki'

Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'yuttie/comfortable-motion.vim'

Plug 'junegunn/vim-slash'
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dhruvasagar/vim-table-mode'

" Completion and snippets
Plug 'sirver/UltiSnips'

" Cheatsheet
Plug 'lifepillar/vim-cheat40'

" Citation support
Plug 'jalvesaq/zotcite'

" Markdown
Plug 'davidgranstrom/nvim-markdown-preview'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

call plug#end()

"" Autoinstall coc plugins
if !filereadable(expand('~/.config/coc/extensions/node_modules/coc-r-lsp/package.json'))
	autocmd VimEnter * CocInstall coc-r-lsp
endif
if !filereadable(expand('~/.config/coc/extensions/node_modules/coc-word/package.json'))
	autocmd VimEnter * CocInstall coc-word
endif
if !filereadable(expand('~/.config/coc/extensions/node_modules/coc-python/package.json'))
	autocmd VimEnter * CocInstall coc-python
endif
" if !filereadable(expand('~/.config/coc/extensions/node_modules/coc-jedi/package.json'))
" 	autocmd VimEnter * CocInstall coc-jedi
" endif
if !filereadable(expand('~/.config/coc/extensions/node_modules/coc-sh/package.json'))
	autocmd VimEnter * CocInstall coc-sh
endif
if !filereadable(expand('~/.config/coc/extensions/node_modules/coc-clangd/package.json'))
	autocmd VimEnter * CocInstall coc-clangd
endif

" Theme setting
colorscheme bow-wob
let g:airline_theme='silver'

" Transparency
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

" Indicate 80 characters
highlight ColorColumn ctermbg=white
call matchadd('ColorColumn', '\%81v', 100)

" Get rid of tilda at the end of file
au ColorScheme * highlight EndOfBuffer ctermfg=white ctermbg=none

filetype plugin on
syntax on
set signcolumn=yes
set updatetime=500
set background="light"
set go=a
set mouse=a
set nohlsearch
set nowrap
set hidden
set noshowmode
set cmdheight=2
set t_Co=256
set nocompatible
set encoding=utf-8
set number relativenumber
set clipboard+=unnamedplus
set ignorecase
set smartcase
set shiftround
set completeopt=noinsert,menuone
set completeopt-=noselect
set shortmess+=c
set pumheight=7
set previewheight=5
" Convert tab to spaces
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitright

" No highlit into normal mode
nnoremap <silent><ESC> :noh<CR><ESC>
" Replace word in entire file
nnoremap <Leader>S :%s/\<<c-r><c-w>\>//g\|norm!``<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" Map arrows keys to moving to beginning/end of line
imap <Left> <ESC>^
inoremap <Right> <ESC>$
nmap <Left> ^
nnoremap <Right> $
vmap <Left> ^
vnoremap <Right> $<Left>
" Pairing symboles and to normal mode for closing symbols
inoremap <silent> <expr> ( (getline('.')[col('.') - 1]=~"\[A-Za-z0-9([{\]" ? "(<ESC>" : "()<left>")
inoremap <silent> <expr> [ (getline('.')[col('.') - 1]=~"\[A-Za-z0-9([{\]" ? "[<ESC>" : "[]<left>")
inoremap ) )<ESC>
inoremap ] ]<ESC>
inoremap <silent><expr> "
    \ getline('.')[col('.') - 1]=~"\[A-Za-z0-9([{\]" ? '"<ESC>' :
    \ getline('.')[col('.') - 2]=~"\[A-Za-z0-9([{\]" ? '"<ESC>' :
    \ getline('.')[col('.') - 1]=~"\"" ? '"<left>' :
    \ getline('.')[col('.') - 2]=~"\"" ? '"<left>' :
    \ '""<left>'
" inoremap <silent><expr> "
"     \ getline('.')[col('.') - 2]=~"\[A-Za-z0-9\]" ? '"<ESC>' :
"     \ getline('.')[col('.') - 2]=~"\"" ? '"<left>' :
"     \ '""<left>'
inoremap <expr> <BS> (getline('.')[col('.')-2: col('.')-1]=~"()" \|\|
    \ getline('.')[col('.')-2: col('.')-1]=~"[]" \|\|
    \ getline('.')[col('.')-2: col('.')-1]=~"\"\"" \|\|
    \ getline('.')[col('.')-2: col('.')-1]=~"{}" ? "<right><BS><BS>" : "<BS>")

nnoremap c "_c
" Keep content after pasting    
xnoremap <expr> p 'pgv"'.v:register.'y'
" Set v$ to not include new line
nnoremap v$ v$h
" Set db to also delete the current word
nnoremap db db2x
" Map O to non-insert
nnoremap O O<ESC>
" Map Q to @q for recording playback
nnoremap Q @q
" Map Y to y$ for consistency with D
noremap Y y$
" Map Z for quick exit
nnoremap <silent> Z ZZ
" Add quotes for comma separated lists
vmap <silent> gw :s/\%V\([^,]\+\)\(, \)\?\%V/"\1"\2/g<CR>
" Automatically correct spelling errors
nnoremap <silent> z= z=1<CR><CR>
" Show correction options
nnoremap <silent> z+ z=
" Space after comma
" inoremap , ,<Space>
" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_gb<CR>
" Replace all is aliased to S.
nmap S :s/<c-r>=expand("<cword>")<cr>//g<left><left>
" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
" Maximize current buffer
nnoremap <silent> <Leader>f <C-w>K<C-w>_
" Adjust buffer sizes
nnoremap <silent><leader>r :windo wincmd K<CR>:windo wincmd K<CR>:resize 28<CR>
nnoremap <Leader>k <C-w>+
nnoremap <Leader>j <C-w>-
nnoremap <Leader>b :buffers<CR>
nnoremap <Leader>l :hide<CR>
" Shortcut for switching buffers
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Use q to close preview window
function! PreviewWindowOpened()
    for nr in range(1, winnr('$'))
        if getwinvar(nr, "&pvw") == 1
            " found a preview
            return 1
        endif  
    endfor
    return 0
endfunction
nnoremap <silent><expr> q PreviewWindowOpened() ? ":PreviewClose<CR>" : "q"
" Switch to vertical split
nnoremap <silent><Leader>v :windo wincmd H<CR>:windo wincmd H<CR>
" When shortcut files are updated, renew bash and ranger configs with new material:
autocmd BufWritePost files,directories !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

let cmdline_map_start  = '<F1>'
let cmdline_term_height = 24
let g:UltiSnipsExpandTrigger="<M-e>"
let g:UltiSnipsJumpForwardTrigger="<Down>"
let g:UltiSnipsJumpBackwardTrigger="<Up>"
" Cheatsheet settings
let g:cheat40_use_default = 0

" fzf
nnoremap <Leader>s :rg<CR>
"
" Nerd tree
	map <F3> :NERDTreeToggle<CR>
    let NERDTreeCustomOpenArgs = {'file': {'reuse': 'all', 'where': 'h', 'keepopen':0, 'stay':0}, 'dir': {}}
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" EasyMotion settings
    let g:EasyMotion_do_mapping = 0 " Disable default mappings
    let g:EasyMotion_verbose = 0
    let g:EasyMotion_prompt = ''
    map f <Plug>(easymotion-fl)
    " Turn on case-insensitive feature
    let g:EasyMotion_smartcase = 1

"" Indentline
"    " Keep current conceal settings
"    let g:indentLine_setConceal = 0
"    "
"" Auto-save
"   let g:auto_save = 1
"   let g:auto_save_silent = 1
"   let g:auto_save_events = ["InsertLeave", "TextChanged"]
"   set noswapfile

"   function! CommandCabbr(abbreviation, expansion)
"   execute 'cabbr ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
"   endfunction

"   command! -nargs=+ CommandCabbr call CommandCabbr(<f-args>)
"   " Define new q! command
"   CommandCabbr q! u0\|wq

"" Goyo plugin makes text more readable when writing prose:
"	map <silent> <leader>g :Goyo \| set bg=light \| set linebreak<CR>
"    autocmd Filetype markdown autocmd! User GoyoEnter Limelight
"    autocmd Filetype markdown autocmd! User GoyoLeave Limelight!
"    let g:limelight_conceal_ctermfg = 'gray'

" Coc Settings
    " Coc completion
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

    function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gd cd
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    "  Use `complete_info`  CR to select
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)
    nmap <M-r> <Plug>(coc-rename)
    nnoremap <silent> gh :call <SID>show_documentation()<CR>

    function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
    endfunction

    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    nmap <silent> <C-;> <Plug>(coc-diagnostic-prev)
    nmap <silent> <C-,> <Plug>(coc-diagnostic-next)
    
    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    nmap zM :Fold<CR>

    augroup mygroup
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)
    
    " Use CTRL-S for selections ranges.
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics.
    " nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>
    " " Find symbol of current document.
    " nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " " Search workspace symbols.
    " nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    
    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')
    autocmd Filetype python command! -nargs=0 SortImports :CocCommand python.sortImports
    autocmd Filetype python command! -nargs=0 SetExec :CocCommand python.setInterpreter
    nmap <silent> gf :ALEFix<CR>
    autocmd Filetype python nmap <silent> gf :Format<CR>:SortImports<CR>

" R Settings
    " Common settings
    let R_debug = 0
    " autocmd Filetype r,rmd nnoremap <silent> <Leader>db :!git grep -l 'browser()'\|xargs sed -i 's/browser()//g'<CR>
    autocmd Filetype r,rmd nnoremap <silent> gl :RSend load.project()<CR>:noh<CR>
    autocmd Filetype r,rmd nnoremap <silent> gL :RSend devtools::load_all()<CR>:noh<CR>
    autocmd Filetype r,rmd nnoremap <silent> <C-c> :RStop<CR>
    " Debug shortccuts
    autocmd Filetype r,rmd nnoremap <silent> gn :RSend n<CR>:noh<CR>
    autocmd Filetype r,rmd nnoremap <silent> gq :RSend Q<CR>:noh<CR>
    autocmd Filetype r,rmd nnoremap gb Obrowser()<ESC>==
    autocmd Filetype r,rmd nmap <silent> gh \rh
    " Close R buffer on exiting vim
    " autocmd Filetype r,rmd nnoremap <silent><expr> Z (len(getbufinfo({'buflisted':1})))== 1 ? "ZZZZ" : "ZZ"
    " Disable R terminal color
    let R_hl_term = 0
    " Check unique values
    autocmd Filetype r,rmd nmap <silent> gu :call RAction('unique')<CR>
    autocmd Filetype r,rmd vmap <silent> gu :call RAction('unique', 'v')<CR>
    autocmd Filetype r,rmd nmap <silent> gU :call RAction('lapply', ', unique')<CR>
    autocmd Filetype r,rmd vmap <silent> gU :call RAction('lapply', 'v',  ', unique')<CR>
    " " Show documentation
    " autocmd Filetype r,rmd nmap <silent> gh \rh
    " View structure
    autocmd Filetype r,rmd map <silent> gS :call RAction('str')<CR>
    autocmd Filetype r,rmd vmap <silent> gS :call RAction('str', 'v')<CR>
    " View names
    autocmd Filetype r,rmd map <silent> gs :call RAction('names')<CR>
    autocmd Filetype r,rmd vmap <silent> gs :call RAction('names', 'v')<CR>
    " Print
    autocmd Filetype r,rmd map <silent> gp \rp
    " Jump to next function
    autocmd Filetype r,rmd nmap <silent> [f /<- function(.*)<CR>
    autocmd Filetype r,rmd nmap <silent> ]f ?<- function(.*)<CR>
    " Map Enter to run selection in visual mode
    autocmd FileType r,rmd vmap <CR> <Plug>RSendSelection
    " Map to %>%
    autocmd Filetype r,rmd inoremap <M-m>  %>%
    " Disable assignment <- change
    let R_assign = 0
    " Map to <-
    autocmd Filetype r,rmd inoremap <M-->  <-<space>
    " Open R session when opening .R files
    autocmd Filetype r,rmd nmap <silent> <F1> <localleader>rf
    " autocmd FileType r,rmd if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
    autocmd Filetype r,rmd set textwidth=75
    autocmd FileType r,rmd setlocal formatoptions-=t
    " Map <CR> to run line and down
    autocmd Filetype r,rmd nmap <silent> <CR> <Plug>RDSendLine
    autocmd Filetype r nmap <silent> <F5> \su

" Rmarkdown settings
    " Load template for rmd
    autocmd BufNewFile *.rmd 0r ~/.config/nvim/skeleton.rmd
    " Run current chunk
    autocmd FileType rmd map <silent> <F4> \ce
    " Run current chunk and down
    autocmd FileType rmd map <silent> <F17> \ca
    " Run from the first chunk
    autocmd Filetype rmd nmap <silent> <F5> \ch
    " Map gk to knit(render markdown file according to header)
    autocmd Filetype rmd nmap gk \kr

" Python
    " Run from beginning
    autocmd Filetype python nmap <silent> <F5> <LocalLeader>mgg<C-o>
    " Run selection
    autocmd Filetype python vmap <buffer> <CR> <Space>
    " Print
    autocmd Filetype python nmap gp viw<Space>
    autocmd Filetype python vmap gp <Space>
    " Debug
    autocmd Filetype python nnoremap gb Obreakpoint()<ESC>==
    autocmd Filetype python nmap <silent> gn <C-j>An<CR><ESC><C-k>
    autocmd Filetype python nmap <silent> gq <C-j>Aq<CR><ESC><C-k>
    " Terminate
    autocmd Filetype python nmap <silent> <buffer> <C-c> <C-j>A<C-c><ESC><C-k>
    " autocmd Filetype python nmap <silent> <buffer> gK <Plug>(kite-docs)
    " autocmd Filetype python nmap <silent> gh ghh<C-W>H
    let cmdline_follow_colorscheme = 1
    let cmdline_app           = {}
    let cmdline_app['python']     = 'ipython'
    " let cmdline_app['wl']     = 'wolframscript'

" Haskell
    " nmap gl :put =expand('%:t')<CR>i:load <ESC>dd<C-j>pA<CR><ESC><C-k>
    nmap gl <C-j>A:reload<CR><ESC><C-k>
    let cmdline_app['haskell']  = 'ghci'
    " Open automatically
    autocmd Filetype haskell normal \s,r
    " Run line
    " autocmd Filetype haskell silent! lcd %:p:h
    autocmd Filetype haskell nmap <silent> <buffer> <CR> V<Space>
    " Run from beginning
    autocmd Filetype haskell nmap <silent> <F17> maVgg<CR>'a
    " Run selection
    autocmd Filetype haskell vmap <buffer> <CR> <Space>
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction
    autocmd Filetype haskell nnoremap <silent> gh :call <SID>show_documentation()<CR>

" Bash
    let cmdline_app['sh']  = 'bash'
    " Run line
    autocmd Filetype sh nmap <silent> <buffer> <CR> <Space>
    " Run from beginning
    autocmd Filetype sh nmap <silent> <F17> maVgg<CR>'a
    " Run selection
    autocmd Filetype sh vmap <buffer> <CR> <Space>

" Zotcite
    let $ZCitationTemplate = '{Authors}_{Year}_{Title}'
    nmap <space> <Plug>ZCitationInfo
    let $ZoteroSQLpath = '/home/lyh970817/Zotero/zotero.sqlite'
    let $Zotcite_exclude = "note attachment"

" Markdown
    let g:mkdp_browser = ''
    let g:mkdp_page_title = ''
    let g:mkdp_command_for_global = 1
    autocmd BufNewFile,BufRead *.md set spell
    autocmd Filetype markdown nmap <C-;> ]s
    autocmd Filetype markdown nmap <C-'> [s
    autocmd BufNewFile,BufRead *.md set textwidth=80
    autocmd BufNewFile,BufRead *.md set wrapmargin=0
    autocmd BufNewFile,BufRead *.md set formatoptions+=t
    " autocmd BufNewFile,BufRead *.md set formatoptions+=a
    autocmd BufNewFile,BufRead *.md set linebreak
    au FileType markdown nnoremap gk :MarkdownPreview<CR>

    function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
    endfunction

    inoreabbrev <expr> <bar><bar>
            \ <SID>isAtStartOfLine('\|\|') ?
            \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
    inoreabbrev <expr> __
            \ <SID>isAtStartOfLine('__') ?
            \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" Ale setting
    let g:ale_echo_cursor = 0
    let g:ale_virtualtext_cursor = 0
    let g:ale_change_sign_column_color = 0
    let g:ale_lint_delay = 200
    let g:ale_lint_on_insert_leave = 1
    let g:ale_disable_lsp = 1
    autocmd Filetype r,rmd let b:ale_fixers = ['styler']
    autocmd Filetype r,rmd let b:ale_lintr = []
    autocmd Filetype python let b:ale_lintr = []
    autocmd Filetype python let b:ale_fixers = []
    let g:ale_set_highlights = 1
    nmap <silent> <C-;> <Plug>(ale_previous)
    nmap <silent> <C-,> <Plug>(ale_next)
    autocmd Filetype r,rmd,python let g:ale_fix_on_save = 1
    autocmd Filetype r,rmd let g:ale_r_lintr_options = 'lintr::with_defaults(line_length_linter = NULL, trailing_blank_lines_linter = NULL, trailing_whitespace_linter = NULL)'

" autocmd Filetype markdown imap <CR> <ESC>maVgggq`aa<CR>

" au FileType markdown vmap <tab> :EasyAlign*<Bar><Enter>
" au FileType markdown map <Bar> vip :EasyAlign*<Bar><Enter>

" Vimwiki
let g:vimwiki_list = [{'path':'~/Yandex.Disk/VimWiki', 'path_html':'~/Yandex.Disk/VimWiki/exports'}]

autocmd Filetype cpp nmap gK :!g++ <C-r>%<CR>
autocmd Filetype cpp nmap gk :!g++ -g <C-r>%<CR>

autocmd Filetype cpp nmap gn <Plug>VimspectorContinue
autocmd Filetype cpp nmap <C-c> <Plug>VimspectorStop
autocmd Filetype cpp nmap gb <Plug>VimspectorToggleBreakpoint
autocmd Filetype cpp nmap gB <Plug>VimspectorToggleConditionalBreakpoint
autocmd Filetype cpp nmap gp <Plug>VimspectorBalloonEval

" autocmd TabNew nmap <silent><expr> bufname("vimspector.Watches") != "" ? Z :":VimspectorReset<CR>" 

autocmd Filetype cpp autocmd TabEnter * set signcolumn=yes

autocmd Filetype cpp nmap <silent><expr> Z (bufwinid("vimspector.Watches") != -1 ? "
    \:set signcolumn=no<CR>:VimspectorReset<CR>" : ":wq<CR>")


