" Highly based of his vimrc file
" Check him out !
"   https://github.com/robertmeta/vim-files
"   http://robertmelton.com
" ---------------------------------------------------------
" Partly modified by myself - Charles-André Bouffard
"   http://cabouffard.me
" ---------------------------------------------------------

" ========== Startup Configuration ==========
set shell=bash\ -i

" ========== General Configuration ==========
    autocmd VimResized * wincmd =              " Automaticly resizes the splits when canvas changes
    set clipboard+=unnamed                     " share windows clipboard
    call matchadd('ColorColumn', '\%81v', 1)   " Set color on the position 80 only when reaching that position
    set synmaxcol=200                          " Syntax coloring lines that are too long just slows down the world
    set autoindent                             " Turns on automatic indent
    set smartindent                            " Makes automatic indent more intelligent
    set nocompatible                           " explicitly get out of vi-compatible mode
    set noexrc                                 " don't use local version of .(g)vimrc, .exrc
    set background=dark                        " we plan to use a dark background
    set fenc=utf-8                             " UTF-8
    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor between joined lines
    "             |||||||+-- When a new match is created (showmatch) pause for .5
    "             ||||||+-- Set buffer options when entering the buffer
    "             |||||+-- :write command updates current file name automatically add <CR> to the last line when using :@r
    "             |||+-- Searching continues at the end of the match at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
    " set history is SLOW AS HELL on startup and quit
    " set history=9999                                              " big old history
    set timeoutlen=300                                            " super low delay (works for me)
    set formatoptions+=n                                          " Recognize numbered lists
    set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* " and bullets
    let g:skip_loading_mswin=1                                    " Just in case :)
    let b:match_ignorecase = 1                                    " case is stupid
    set backspace=indent,eol,start                                " make backspace a more flexible
    set fileformats=unix,dos,mac                                  " support all three, in this order
    set hidden                                                    " you can change buffers without saving
    set iskeyword+=$,%,#                                          " none of these are word dividers
    set mouse=a                                                   " use mouse everywhere
    set noerrorbells                                              " don't make noise
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    set wildmenu                                                       " turn on command line completion wild style
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png " ignore these list file extensions
    " set wildmode=list:longest                                          " turn on wild mode huge list
    set wildmode=list:longest,full
    " Open new split panes to right and bottom, which feels more natural
    set splitbelow
    set splitright

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
    " Not sure if I like or dislike cul
    " set cul                           " Highlight the background of the current line
    set incsearch                       " BUT do highlight as you type you search phrase
    set laststatus=2                    " always show the status line
    set lazyredraw                      " do not redraw while running macros
    set linespace=0                     " don't insert any extra pixel lines betweens rows
    set list                            " we do what to show tabs, to ensure we get them out of my files
    set showbreak=↪
    set listchars=tab:>-,nbsp:_,trail:- " show tabs and trailing
    set matchtime=5                     " how many tenths of a second to blink matching brackets for
    set nohlsearch                      " do not highlight searched for phrases
    set nostartofline                   " leave my cursor where it was
    set novisualbell                    " don't blink
    set number                          " turn on line numbers
    set relativenumber                  " turn on relative line numbers
    set numberwidth=5                   " We are good up to 99999 lines
    set report=0                        " tell us when anything is changed via :...
    set ruler                           " Always show current positions along the bottom
    set scrolloff=10                    " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT                 " shortens messages to avoid 'press a key' prompt
    set showcmd                         " show the command being typed
    set showmatch                       " show matching brackets
    set sidescrolloff=10                " Keep 5 lines at the size
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
    set completeopt=menuone " don't use a pop up menu for completions
    set expandtab           " no real tabs please!
    set formatoptions=rq    " Automatically insert comment leader on return, and let gq format comments
    set ignorecase          " case insensitive by default
    set infercase           " case inferred by default
    set nowrap              " do not wrap line
    set shiftround          " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase           " if there are caps, go case-sensitive
    set shiftwidth=4        " auto-indent amount when using cindent, >>, << and stuff like that
    set softtabstop=4       " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
    set tabstop=8           " real tabs should be 8, and they will show with set list on
    set complete+=kspell    " Allow spelling completing when spell is activated

" ========== Folding ==========
    set nofoldenable                                 " No autofold
    set foldmethod=indent
    set foldlevel=1
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
    " function SimpleFoldText() " {
    "     let nl = v:foldend - v:foldstart + 1
    "     return '+ ' . nl . getline(v:foldstart).' '
    "     "}
    " endfunction " }
    " set foldtext=SimpleFoldText()                    " Custom fold text function (cleaner than default)

" ========== Plugin Configurations ==========
    let perl_extended_vars=1   " highlight advanced perl vars inside strings
    let tlist_aspjscript_settings = 'asp;f:function;c:class'
    let tlist_aspvbs_settings = 'asp;f:function;s:sub'
    let tlist_php_settings = 'php;c:class;d:constant;f:function'
    let tlist_vb_settings = 'asp;f:function;c:class'

" ----- YCM -----
    " let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    " let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:ycm_key_list_select_completion=["<tab>"]
    let g:ycm_key_list_previous_completion=["<S-tab>"]

" ----- VimAirline -----
    let g:airline#extensions#tabline#enabled = 1      " Enable the list of buffers
    let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename

" ----- NERDTree -----
    let NERDTreeIgnore = ['\.beam', '\.pyc', 'ebin']
    let NERDChristmasTree = 1
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 0

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

" ----- SuperTab -----
    " let g:SuperTabDefaultCompletionType = '<C-n>'
    " let g:SuperTabCrMapping = 1

" ----- HardTime -----
    " let g:hardtime_default_on = 1

" ----- tcomment -----
    " Look at the end of the file

" ----- indentLine -----
    let g:indentLine_enabled = 0

" ----- Syntastic  -----
    let g:syntastic_mode_map={'mode': 'passive'}
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_html_tidy_ignore_errors  = [" proprietary attribute \"ng-",  "proprietary attribute \"required", "proprietary attribute \"mean-"]
    let g:syntastic_javascript_checkers      = ['eslint']
    let g:syntastic_coffeescript_checkers    = ['coffeelint']
    let g:syntastic_yaml_checkers            = ['jsyaml']
    let g:syntastic_scss_checkers            = ['sass']
    let g:syntastic_sass_checkers            = ['sass']
    let g:syntastic_json_checkers            = ['jsonlint']
    let g:syntastic_ruby_checkers            = ['rubocop']
    let g:syntastic_go_checkers              = ['golint', 'govet', 'errcheck']
    let g:syntastic_mode_map                 = { 'mode': 'active', 'passive_filetypes': ['go'] }

" ----- Vim Instant Markdown -----
    let g:instant_markdown_autostart = 0 " Turn off markdown viewer by default
    let g:instant_markdown_slow = 1

" ========== Key Binding ==========
    let mapleader = " "

    " Return to last buffer
    nmap <Leader>e :e#<CR>
    " Remove trailing whitespaces
    nnoremap <Leader>rtw :%s/\s\+$//e<CR>
    " make arrow keys useful
    map <left> <ESC>:NERDTreeFind<CR>
    map <right> <ESC>:NERDTreeToggle<CR>

    " I am stupid
    nnoremap :W <ESC>:w
    nnoremap :Q <ESC>:q

    set pastetoggle=<F2>

    " Source vimrc file from anywhere
    nnoremap <Leader>sr <ESC>:so $MYVIMRC<CR>

    " Easy to type exit key
    imap jj <Esc>

    map Q <Nop>

    " Search word under the cusor with Ag
    nmap K :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

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
    " Search from all opened buffers
    nmap <leader>b :CtrlPBuffer<CR>

" ----- Tab Navigation -----
    " nnoremap <C-h> <C-w>h
    " nnoremap <C-j> <C-w>j
    " nnoremap <C-k> <C-w>k
    " nnoremap <C-l> <C-w>l

" ----- Split Resize -----
    nnoremap <C-J> :vertical resize -5<cr>
    nnoremap <C-K> :resize +5<cr>
    nnoremap <C-L> :resize -5<cr>
    nnoremap <C-H> :vertical resize +5<cr>

" ----- Buffer Navigation -----
    " To open a new empty buffer
    " nmap <leader>t :enew<CR>
    " Move to the next buffer
    nmap <leader>l :bnext<CR>
    " Move to the previous buffer
    nmap <leader>h :bprevious<CR>
    " Close the current buffer and move to the previous one
    " This replicates the idea of closing a tab
    nmap <leader>bq :bp <BAR> bd #<CR>
    " Edit previously edited buffer
    nmap <leader>n :b#<CR>
    " Show all open buffers and their status
    nmap <leader>bl :ls<CR>
    nmap <leader>q :tab close<CR>

" ----- Search and Replace -----
    nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" ----- UltiSnips -----
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    " let g:UltiSnipsExpandTrigger="<nop>"
    " let g:ulti_expand_or_jump_res = 0
    "
    " function! <SID>ExpandSnippetOrReturn()
    " let snippet = UltiSnips#ExpandSnippetOrJump()
    " if g:ulti_expand_or_jump_res > 0
    "     return snippet
    " else
    "     return "\<CR>"
    " endif
    " endfunction
    " inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

" ----- Syntastic -----
    " nnoremap <Leader>c :SyntasticCheck<CR>
    nnoremap <Leader>c :RuboCop<CR>

" ----- indentLine -----
    nnoremap <Leader>lt :IndentLinesToggle<CR>

" ----- Python Mode -----
    let g:pymode_python = 'python3'
    let g:pymode_folding = 0
    let g:pymode_options_max_line_length = 200

" ----- Tabular -----
    nnoremap <Leader>a= :Tabularize /=<CR>
    nnoremap <Leader>a: :Tabularize /:\zs<CR>
    nnoremap <Leader>a, :Tabularize /,\zs<CR>
    nnoremap <Leader>a" :Tabularize /"<CR>
    nnoremap <Leader>at :Tabularize /\|"<CR>
    nnoremap <Leader>a# :Tabularize /\#"<CR>

    vnoremap <Leader>a= :Tabularize /=<CR>
    vnoremap <Leader>a: :Tabularize /:\zs<CR>
    vnoremap <Leader>a, :Tabularize /,\zs<CR>
    vnoremap <Leader>a" :Tabularize /"<CR>
    vnoremap <Leader>at :Tabularize /|"<CR>
    vnoremap <Leader>a# :Tabularize /#"<CR>

" ----- IndentLines -----
    nnoremap <Leader>dl :IndentLinesToggle<CR>

" ----- Vim Tags -----
    " let g:vim_tags_use_vim_dispatch = 0
    
" ----- Vim Easy Tags -----
    let g:easytags_auto_highlight = 0
    let g:easytags_async = 1

" ----- Switch -----
    let g:switch_mapping = "-"


" ----- vim-rspec -----
    nmap <silent> <leader>rn :TestNearest<CR>
    nmap <silent> <leader>rf :TestFile<CR>
    nmap <silent> <leader>rs :TestSuite<CR>
    nmap <silent> <leader>rl :TestLast<CR>
    nmap <silent> <leader>rg :TestVisit<CR>
    let test#strategy = "dispatch"
" ----- Golang -----
    " au FileType go nmap <leader>gr <Plug>(go-run)
    " au FileType go nmap <leader>gb <Plug>(go-build)
    " au FileType go nmap <leader>gt <Plug>(go-test)
    " au FileType go nmap <leader>gc <Plug>(go-coverage)
    " au FileType go map gf <Plug>(go-def)

" ========== Autocommands ==========
    augroup EditVim
        autocmd!

        " ----- Rainbow Parentheses -----
        " au Syntax * RainbowParenthesesLoadBraces
        " au VimEnter * RainbowParenthesesToggle
        " au Syntax * RainbowParenthesesLoadRound
        " au Syntax * RainbowParenthesesLoadSquare
        " ----- Syntastic -----
        " au Syntax * RainbowParenthesesLoadBraces

        " ----- Filetypes -----
        au FileType gitcommit setlocal spell textwidth=72
        au FileType ruby setlocal shiftwidth=2 softtabstop=2 tabstop=2
        au FileType crystal setlocal shiftwidth=2 softtabstop=2 tabstop=2
        au FileType eruby setlocal shiftwidth=2 softtabstop=2 tabstop=2
        au FileType haml setlocal shiftwidth=2 softtabstop=2 tabstop=2
        au FileType coffee setlocal shiftwidth=2 softtabstop=2 tabstop=2
        au FileType scss setlocal shiftwidth=2 softtabstop=2 tabstop=2
        au FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2
        au FileType sass setlocal shiftwidth=2 softtabstop=2 tabstop=2
        au FileType json setlocal shiftwidth=2 softtabstop=2 tabstop=2
        au FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
        au FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2
        au FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2
        " Format options: https://github.com/plasticboy/vim-markdown/pull/70
        au FileType markdown setlocal spell colorcolumn= nonumber wrap linebreak nolist textwidth=80 wrapmargin=0 formatoptions-=c
        au FileType text setlocal spell colorcolumn= nonumber wrap linebreak nolist textwidth=80 wrapmargin=0

        " au FileType go setlocal listchars=tab:_,nbsp:_,trail:-
        " Remove annoying tab character in Go
        au FileType go setlocal noexpandtab
        au FileType go setlocal listchars+=tab:\ \
        " autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
    augroup END

    " Remember everything (position, folds, etc)
    "  - Dislike because it saves the previous state of when
    "  - I tweak the shiftwidth in vimrc
    "  - I don't want to manually have to ':set ft= filetype'
    "  - everytime
    " au BufWinLeave ?* mkview 1
    " au BufWinEnter ?* silent loadview 1

nmap <leader>fn :echo expand('%:p')<cr>

" ===== RAIL SHORTCUTS  =====
" https://gist.github.com/christoomey/9357451"
" Convert 1.8 hash syntax to 1.9 syntax
nmap <leader>r9 :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<cr>
nmap <leader>r8 :%s/\(\w\+\):\s/:\1 => /gc<cr>"
nmap <leader>sf :Ag<space>

" Lets you go to the next block with %
runtime macros/matchit.vim

" Odds n Ends
set ttymouse=xterm2 " makes it work in everything

" ========== Vundle : Plugin Manager ==========
set rtp+=~/.vim/bundle/vundle.vim/
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
call vundle#rc()

Bundle 'gmarik/Vundle.vim'
Bundle 'molokai'
Bundle 'morhetz/gruvbox'
" Bundle 'scrooloose/nerdtree'
" Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'Valloric/YouCompleteMe'
" " Javascript completion
" Bundle 'marijnh/tern_for_vim'
" " end
Bundle 'fatih/vim-go'
Bundle 'kien/ctrlp.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'tomtom/tcomment_vim'
" Bundle 'gabrielelana/vim-markdown'
Bundle 'suan/vim-instant-markdown'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
" Bundle 'wlangstroth/vim-racket'
" Bundle 'tpope/vim-endwise'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'mattn/gist-vim'
" Required for gist-vim
Bundle 'mattn/webapi-vim'
" " end
Bundle 'rking/ag.vim'
" Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/syntastic'
" Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
" Bundle 'junegunn/vim-emoji'
" Bundle 'digitaltoad/vim-jade'
Bundle 'slim-template/vim-slim'
Bundle 'ngmy/vim-rubocop'
" Bundle 'thoughtbot/vim-rspec'
Bundle 'mtth/scratch.vim'
" Bundle 'AndrewRadev/switch.vim'
" Bundle 'chrisyip/Better-CSS-Syntax-for-Vim'
Bundle 'ap/vim-css-color'
" Bundle 'skalnik/vim-vroom'
Bundle 'Yggdroot/indentLine'
" Bundle 'szw/vim-tags'
Bundle 'xolox/vim-easytags'
" Required for easytag to work
Bundle 'xolox/vim-misc'
" Bundle 'stefanoverna/vim-i18n'
Bundle 'janko-m/vim-test'
Bundle 'tpope/vim-dispatch'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'rhysd/vim-crystal'
Bundle 'NLKNguyen/papercolor-theme'
Bundle 'python-mode/python-mode'
Plugin 'posva/vim-vue'

" Have to stay at the bottom, else everything screws up!
syntax on                   " syntax highlighting on
filetype plugin indent on   " load filetype plugins/indent settings

" ========== Terminal Theming ==========
" if $TERM == "xterm-256color" " Term Settings
    let t_Co=256
    " let g:rehash256 = 1
" end

" Bundle 'fmoralesc/molokayo'
" let g:airline_theme='molokai'
" let g:molokayo#high_contrast#comments = 1
" set guifont=LiberationMono\ 12
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
3match YellowGroup '\<REVIEW\>'

" ========== Plugin Configurations ==========
" Those settings has to go after the Bundle init
" To make sure the function exists

" ----- tcomment -----
call tcomment#DefineType('markdown', g:tcommentInlineXML)
call tcomment#DefineType('markdown_block', g:tcommentBlockXML)
call tcomment#DefineType('markdown_inline', g:tcommentInlineXML)
" Pretty print json :%!python -m json.tool
