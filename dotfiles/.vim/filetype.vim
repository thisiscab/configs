" add new filetypes
augroup filetypedetect
    autocmd! BufNewFile,BufRead *.md set filetype=markdown
    autocmd! BufNewFile,BufRead *.jade set filetype=jade
    autocmd! BufNewFile,BufRead *.coffee set filetype=coffee
    autocmd! BufRead,BufNewFile *.json set filetype=javascript
    autocmd! BufRead,BufNewFile *.js set filetype=javascript
    autocmd! BufRead,BufNewFile *.py set filetype=python
    autocmd! BufRead,BufNewFile *.c set filetype=c
    autocmd! BufRead,BufNewFile *.php set filetype=php
    autocmd! BufRead,BufNewFile *.vim set filetype=vim
    autocmd! BufRead,BufNewFile vimrc set filetype=vim
    autocmd! BufRead,BufNewFile gvimrc set filetype=vim
    autocmd! BufRead,BufNewFile *.css set filetype=css
    autocmd! BufRead,BufNewFile *.htm set filetype=html
    autocmd! BufRead,BufNewFile *.html set filetype=html
    autocmd! BufRead,BufNewFile *.xml set filetype=xml
    autocmd! BufRead,BufNewFile *.sh set filetype=sh
    autocmd! BufRead,BufNewFile *.java set filetype=java
    autocmd! BufRead,BufNewFile *.rb set filetype=ruby
augroup END
