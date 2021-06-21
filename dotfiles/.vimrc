" Highly based of his vimrc file
" Check him out !
"   https://github.com/robertmeta/vim-files
"   http://robertmelton.com
" ---------------------------------------------------------
" Partly modified by myself - Charles-André Bouffard
"   http://cabouffard.me
" ---------------------------------------------------------

" ========== General Configuration ==========
    set clipboard+=unnamed
    set colorcolumn=80
    set synmaxcol=120
    set nocompatible
    set background=dark
    set fenc=utf-8
    set noerrorbells
    set wildmenu
    set wildignore+=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png,*.swp,*.so
    set splitbelow
    set splitright
    set hidden

" ========== Specific Configurations ==========
    " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
    if executable('ag')
        " Use Ag over Grep
        set grepprg=ag\ --nogroup\ --nocolor

        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

        " ag is fast enough that CtrlP doesn't need to cache
        let g:ctrlp_use_caching = 0
    endif

" ========== UI Configuration ==========
    set incsearch                       " BUT do highlight as you type you search phrase
    set listchars=tab:>-,nbsp:_,trail:- " show tabs and trailing
    set novisualbell                    " don't blink
    set number                          " turn on line numbers
    set ruler                           " Always show current positions along the bottom
    set showcmd                         " show the command being typed
    set showmatch                       " show matching brackets
    set showbreak=~
    set listchars=tab:>-,nbsp:_,trail:- " show tabs and trailing
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer

" ========== Text Formatting ==========
    set ignorecase          " case insensitive by default
    set infercase           " case inferred by default
    set smartcase           " if there are caps, go case-sensitive
    set expandtab           " no real tabs please!
    set nowrap              " do not wrap line
    set shiftround          " when at 3 spaces, and I hit > ... go to 4, not 5
    set shiftwidth=4        " auto-indent amount when using cindent, >>, << and stuff like that
    set softtabstop=4       " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
    set tabstop=8           " real tabs should be 8, and they will show with set list on
    set complete+=kspell    " Allow spelling completing when spell is activated

" ========== Folding ==========
    set nofoldenable                                 " No autofold
    set foldmethod=indent


" ========== Other ==========
    set noeol
    set nofixeol

" ========== Plugin Configurations ==========
"
" ----- VimAirline -----
    let g:airline#extensions#ale#enabled = 1
    let g:airline#extensions#tabline#enabled = 1      " Enable the list of buffers
    let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename
    let g:airline#extensions#tabline#formatter = 'default'

" ----- Gist Vim -----
    let g:gist_clip_command = 'pbcopy'
    let g:gist_detect_filetype = 1
    let g:gist_open_browser_after_post = 1
    let g:gist_post_private = 1

" ----- Ctrl P -----
    let g:ctrlp_working_path_mode = 'ra'
    " When using Ag (Silver Searcher), must use file .agignore
    "http://stackoverflow.com/questions/18285751/use-ag-in-ctrlp-vim
    " custom i
    let g:ctrlp_custom_ignore = '\v[\/](node_modules\|target\|output\|bower_components\|dist)|(\.(swp\|hg\|git\|svn))$'

" ----- Markdown Preview -----
    let g:mkdp_browser = 'firefox'

" ----- Vim Markdown -----
    let g:vim_markdown_conceal = 0

" ========== Key Binding ==========
    let mapleader = " "

    " Remove trailing whitespaces
    nnoremap <Leader>rtw :%s/\s\+$//e<CR>

    " I am stupid
    nnoremap :W <ESC>:w
    nnoremap :Q <ESC>:q

    " Source vimrc file from anywhere
    nnoremap <Leader>sv <ESC>:so $MYVIMRC<CR>
    nnoremap <leader>ev :e ~/.vimrc<CR>

" ----- Ale -----
    " nmap <silent><s-tab> <Plug>(ale_previous_wrap)
    " nmap <silent><tab> <Plug>(ale_next_wrap)

    " let b:ale_fixers = { 'typescript': 'eslint' }

" ----- Fugitive -----
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gw :Gbrowse<CR>
    nnoremap <silent> <leader>gp :Git push<CR>

" ----- CtrlP -----
    " Search from the root directory
    nmap <leader>sr :CtrlP<CR>
    nmap <leader>sf :CtrlP .<CR>
    nmap <leader>sa :CtrlPMixed<CR>
    " Search from all opened buffers
    nmap <leader>sb :CtrlPBuffer<CR>

" ---- TMUX ----
    let g:tmux_navigator_disable_when_zoomed = 1

" ---- vim-terraform ----
    let g:terraform_fmt_on_save = 1

" ----- Split Resize -----
    " nnoremap <C-J> :vertical resize -5<cr>
    " nnoremap <C-K> :resize +5<cr>
    " nnoremap <C-L> :resize -5<cr>
    " nnoremap <C-H> :vertical resize +5<cr>

" ----- Buffer Navigation -----
    " To open a new empty buffer
    nmap <leader>bt :enew<CR>
    " Move to the next buffer
    " nmap <leader>l :bnext<CR>
    " Move to the previous buffer
    " nmap <leader>h :bprevious<CR>
    " Close the current buffer and move to the previous one
    " This replicates the idea of closing a tab
    " nmap <leader>bq :bp <BAR> bd #<CR>
    " Edit previously edited buffer
    nmap <leader>bp :b#<CR>
    " Show all open buffers and their status
    " nmap <leader>bs :ls<CR>
    nmap <leader>bq :tab close<CR>
    nmap <leader>bd bdelete<CR>
    nmap <leader>brd :call delete(expand('%')) <BAR> bdelete!<CR>

" ----- Search and Replace -----
    nnoremap <Leader>snr :%s/\<<C-r><C-w>\>//g<Left><Left>

" ----- UltiSnips -----
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<c-n>"
    let g:UltiSnipsJumpBackwardTrigger = "<c-u>"
    let g:UltiSnipsSnippetDirectories = ["UltiSnips", "bundle/vim-snippets/UltiSnips", $HOME."/src/configs/UltiSnips"]
    let g:ultisnips_python_quoting_style = 'double'
    let g:ultisnips_python_style = 'google'
    autocmd FileType python UltiSnipsAddFiletypes luigi

" ----- indentLine -----
    " nnoremap <Leader>lt :IndentLinesToggle<CR>

" ----- tsuquyomi -----
    let g:tsuquyomi_disable_quickfix = 1

" ----- lonely -----
    nmap <leader>pwd :echo expand('%:p')<cr>
    " prettify sql:
    vnoremap <Leader>sql :s/\<update\>\\|\<select\>\\|\<from\>\\|\<where>\\|\<left join\>\\|\<inner join\>\\|\<group by\>\\|\<order by\>/\r\U&/ge<cr><esc>

" --- vim-hclmt ---
let g:hcl_fmt_autosave = 1
let g:tf_fmt_autosave = 0
let g:nomad_fmt_autosave = 0

" ----- json -----
let g:vim_json_syntax_conceal = 0 

" ----- coc -----
map <silent> <leader>td <Plug>(coc-definition)
nmap <silent> <leader>tt <Plug>(coc-type-definition)
nmap <silent> <leader>th :call CocActionAsync('doHover')<cr>
nmap <silent> <leader>to :call CocAction('runCommand', 'editor.action.organizeImport')<cr>
nmap <silent> <leader>ti <Plug>(coc-implementation)
nmap <silent> <leader>tr <Plug>(coc-references)"

let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-go',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-eslint'
    \ ]

nmap <silent><s-tab> <Plug>(coc-diagnostic-prev)
nmap <silent><tab> <Plug>(coc-diagnostic-next)

" ========== Autocommands ==========
    autocmd BufNewFile,BufRead *.json set ft=json

    augroup EditVim
        autocmd!

        " ----- Filetypes -----
        au FileType gitcommit setlocal spell textwidth=72
        au FileType markdown setlocal spell shiftwidth=2 softtabstop=2 tabstop=2
        au FileType python set foldenable
        au FileType ruby setlocal shiftwidth=2 softtabstop=2 tabstop=2
        au FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
        au FileType sql setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
        au FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
        " au FileType crystal setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType eruby setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType haml setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType coffee setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType scss setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType sass setlocal shiftwidth=2 softtabstop=2 tabstop=2
        au FileType json setlocal shiftwidth=2 softtabstop=2 tabstop=2
        au FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " Format options: https://github.com/plasticboy/vim-markdown/pull/70
        " au FileType markdown setlocal spell colorcolumn= nonumber wrap linebreak nolist textwidth=80 wrapmargin=0 formatoptions-=c
        " au FileType rst setlocal spell colorcolumn= nonumber wrap linebreak nolist textwidth=80 wrapmargin=0 formatoptions-=c
        " au FileType text setlocal spell colorcolumn= nonumber wrap linebreak nolist textwidth=80 wrapmargin=0

        " au FileType go setlocal listchars=tab:_,nbsp:_,trail:-
        " Remove annoying tab character in Go
        " au FileType go setlocal noexpandtab
        " au FileType go setlocal listchars+=tab:\ \
        autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow
    augroup END
    " autocmd QuickFixCmdPost *grep* cwindow

" ===== RAIL SHORTCUTS  =====
" https://gist.github.com/christoomey/9357451"
" Convert 1.8 hash syntax to 1.9 syntax
" nmap <leader>r9 :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<cr>
" nmap <leader>r8 :%s/\(\w\+\):\s/:\1 => /gc<cr>"
nmap <leader>sf :Ag<space>

" ========== Vundle : Plugin Manager ==========
set rtp+=~/.vim/bundle/Vundle.vim/
set rtp+=~/src/configs/UltiSnips
call vundle#begin()

let g:vim_markdown_conceal = 0

Bundle 'gmarik/Vundle.vim'
Bundle 'neoclide/coc.nvim'
Bundle 'morhetz/gruvbox'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'vim-airline/vim-airline'
Bundle 'tpope/vim-fugitive'
" required by fugitive for :gbrowse
Bundle 'tpope/vim-rhubarb'
Bundle 'tomtom/tcomment_vim'
" v Must come before vim-makdown
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'iamcco/markdown-preview.nvim'
" ^ Manually have to run: :call mkdp#util#install()
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'mattn/gist-vim'
" Required for gist-vim
Bundle 'mattn/webapi-vim'
" " end
Bundle 'rking/ag.vim'
" Bundle 'godlygeek/tabular'
Bundle 'w0rp/ale'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'Yggdroot/indentLine'
" Required for easytag to work
" Bundle 'vim-python/python-syntax'
" Bundle 'davidhalter/jedi-vim'
" Bundle 'lifepillar/pgsql.vim'
" Bundle 'tpope/vim-unimpaired'
" Bundle 'Quramy/tsuquyomi'
" Bundle 'leafgarland/typescript-vim'
Bundle 'hashivim/vim-terraform.git'
Bundle 'jvirtanen/vim-hcl.git'
" Bundle 'fatih/vim-hclfmt'
Bundle 'rhadley-recurly/vim-terragrunt'
Bundle 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Bundle 'fatih/vim-go'
Bundle 'elzr/vim-json'
Bundle 'chrisbra/csv.vim'

" Keymapping
nnoremap <leader>p :PrettierAsync<cr>

" autocmd to format on save
" autocmd BufNewFile,BufRead *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html nnoremap <buffer> <leader>w :PrettierAsync<cr>:w!<cr>


call vundle#end()

" Have to stay at the bottom, else everything screws up!
syntax on                   " syntax highlighting on
filetype plugin indent on   " load filetype plugins/indent settings

colorscheme gruvbox

" ========== Text Formatting ==========
" Show color for specific keyword on any filetype
" This has to go after we set the coloscheme, else this get overwritten

" ----- Specific colors -----
highlight RedGroup ctermfg=1
highlight GreenGroup ctermfg=2
highlight YellowGroup ctermfg=3
match Redgroup '\<TODO\|FIXME\>'
2match GreenGroup '\<NOTE\>'
" https://github.com/vim/vim/issues/1785
" 3match YellowGroup '\<REVIEW\>'
