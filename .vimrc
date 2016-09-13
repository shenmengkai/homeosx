set number
set ic
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType make setlocal noexpandtab
syntax on
set hlsearch
set laststatus=2

" VIM PATHOGEN PLUGINS
execute pathogen#infect()

" VIM PATHOGEN PLUGINS :: AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_modified=1
