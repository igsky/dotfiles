call plug#begin()

" Visuals
Plug 'bling/vim-airline' " Powerline
Plug 'airblade/vim-gitgutter' " Show git edits
Plug 'Yggdroot/indentLine' " Show indentations
Plug 'godlygeek/tabular' " Text aligning
Plug 'luochen1990/rainbow' " Rainbow brackets

Plug 'bronson/vim-trailing-whitespace'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/syntastic'
Plug 'honza/vim-snippets'
Plug 'kien/ctrlp.vim'

" Navigation
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'sheerun/vim-polyglot'

" Golang plugins
Plug 'fatih/vim-go'

" Python plugins
Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'mitsuhiko/vim-jinja'
Plug 'mitsuhiko/vim-python-combined'
Plug 'tmhedberg/SimpylFold' " Folding

call plug#end()

highlight LineNr ctermfg=yellow ctermbg=darkgrey
highlight CursorLineNr ctermfg=yellow ctermbg=darkgrey

set number
set relativenumber
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set foldmethod=syntax
set foldlevelstart=10
set foldnestmax=3
syntax enable

"" Switching windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" n movements
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" hjkl movements
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1

nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

map <C-n> :NERDTreeToggle<CR>
let g:nerdtree_tabs_focus_on_files=1

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

let g:airline#extensions#branch#enabled = 1
let g:rainbow_active = 1

let g:go_list_type = "quickfix"
let g:go_fmt_command = "gofmt"
let g:go_fmt_fail_silently = 1

let g:syntastic_go_checkers = ['golint', 'govet']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_extra_types = 1


augroup go

  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>t  <Plug>(go-test)
  au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go nmap <leader>dr :GoDeclsDir<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

augroup END

let g:indentLine_enabled = 1
let g:indentLine_color_term=236

map <silent> <leader><space> :noh<cr>

autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

