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
    call matchadd('ColorColumn', '\%81v', 1)
    set synmaxcol=120
    set nocompatible
    set background=dark
    set fenc=utf-8
    set noerrorbells
    set wildmenu
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
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
    set relativenumber                  " turn on relative line numbers
    set ruler                           " Always show current positions along the bottom
    set showcmd                         " show the command being typed
    set showmatch                       " show matching brackets
    set showbreak=↪
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

" ========== Plugin Configurations ==========
"
" ----- VimAirline -----
    let g:airline#extensions#tabline#enabled = 1      " Enable the list of buffers
    let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename

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

" ----- Vim Instant Markdown -----
    let g:instant_markdown_autostart = 0
    let g:instant_markdown_slow = 1

" ---- psql ----
    let g:sql_type_default = 'pgsql'

" ========== Key Binding ==========
    let mapleader = " "

    " Remove trailing whitespaces
    nnoremap <Leader>rtw :%s/\s\+$//e<CR>

    " I am stupid
    nnoremap :W <ESC>:w
    nnoremap :Q <ESC>:q

    " Source vimrc file from anywhere
    nnoremap <Leader>sr <ESC>:so $MYVIMRC<CR>
    nnoremap <leader>evim :e ~/.vimrc<CR>

    " Easy to type exit key
    imap jj <Esc>
    imap jk <Esc>

" ----- Ale -----
    nmap <silent><s-tab> <Plug>(ale_previous_wrap)
    nmap <silent><tab> <Plug>(ale_next_wrap)

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
    nmap <leader>fr :CtrlP<CR>
    nmap <leader>f :CtrlP .<CR>
    nmap <leader>a :CtrlPMixed<CR>
    " Search from all opened buffers
    nmap <leader>b :CtrlPBuffer<CR>

" ---- TMUX ----
    let g:tmux_navigator_disable_when_zoomed = 1


" ----- Split Resize -----
    " nnoremap <C-J> :vertical resize -5<cr>
    " nnoremap <C-K> :resize +5<cr>
    " nnoremap <C-L> :resize -5<cr>
    " nnoremap <C-H> :vertical resize +5<cr>

" ----- Buffer Navigation -----
    " To open a new empty buffer
    nmap <leader>t :enew<CR>
    " Move to the next buffer
    nmap <leader>l :bnext<CR>
    " Move to the previous buffer
    nmap <leader>h :bprevious<CR>
    " Close the current buffer and move to the previous one
    " This replicates the idea of closing a tab
    nmap <leader>bq :bp <BAR> bd #<CR>
    " Edit previously edited buffer
    nmap <leader>p :b#<CR>
    " Show all open buffers and their status
    " nmap <leader>bs :ls<CR>
    nmap <leader>q :tab close<CR>

" ----- Search and Replace -----
    nnoremap <Leader>snr :%s/\<<C-r><C-w>\>//g<Left><Left>

" ----- UltiSnips -----
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<c-n>"
    let g:UltiSnipsJumpBackwardTrigger = "<c-u>"
    " let g:UltiSnipsSnippetsDir = "/Users/cabouffard-glossier/src/configs/UltiSnips"
    let g:UltiSnipsSnippetDirectories = ["UltiSnips","bundle/vim-snippets/UltiSnips", "/Users/cabouffard-glossier/src/configs/UltiSnips"]
    let g:ultisnips_python_quoting_style = 'double'
    let g:ultisnips_python_style = 'google'
    autocmd FileType python UltiSnipsAddFiletypes luigi

" ----- indentLine -----
    " nnoremap <Leader>lt :IndentLinesToggle<CR>

" ----- lonely -----
    nmap <leader>pwd :echo expand('%:p')<cr>
    " prettify sql:
    vnoremap <Leader>sql :s/\<update\>\\|\<select\>\\|\<from\>\\|\<where>\\|\<left join\>\\|\<inner join\>\\|\<group by\>\\|\<order by\>/\r\U&/ge<cr><esc>

" ========== Autocommands ==========
    augroup EditVim
        autocmd!

        " ----- Filetypes -----
        au FileType gitcommit setlocal spell textwidth=72
        au FileType python set foldenable
        au FileType ruby setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType crystal setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType eruby setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType haml setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType coffee setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType scss setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType sass setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType json setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " au FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
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
        " autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
    augroup END
    " autocmd QuickFixCmdPost *grep* cwindow


" ===== RAIL SHORTCUTS  =====
" https://gist.github.com/christoomey/9357451"
" Convert 1.8 hash syntax to 1.9 syntax
" nmap <leader>r9 :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<cr>
" nmap <leader>r8 :%s/\(\w\+\):\s/:\1 => /gc<cr>"
nmap <leader>sf :Ag<space>

" ========== Vundle : Plugin Manager ==========
set rtp+=~/.vim/bundle/vundle.vim/
set rtp+=~/src/configs/UltiSnips
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'morhetz/gruvbox'
Bundle 'ctrlp/ctrlp.vim'
Bundle 'vim-airline/vim-airline'
Bundle 'tpope/vim-fugitive'
" required by fugitive for :gbrowse
Bundle 'tpope/vim-rhubarb'
Bundle 'tomtom/tcomment_vim'
Bundle 'suan/vim-instant-markdown'
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
Bundle 'vim-python/python-syntax'
Bundle 'davidhalter/jedi-vim'
Plugin 'lifepillar/pgsql.vim'
Plugin 'tpope/vim-unimpaired'

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
