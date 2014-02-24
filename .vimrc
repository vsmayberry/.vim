execute pathogen#infect()


"plugins settings
map <C-t> :NERDTreeToggle<CR>
set laststatus=2    

"set preferences
set incsearch
set number
set hlsearch
set autoindent
set expandtab
set tabstop=4
syntax on
filetype on
filetype plugin on
set ruler


"leader key
inoremap <leader>ln <ESC>:call NumberToggle()<cr>
inoremap <leader>q <ESC>:wq<cr>
nnoremap <leader>q <ESC>:wq<cr>
vnoremap <leader>q <ESC>:wq<cr>
nnoremap <leader>s :w<cr>
vnoremap <leader>s <ESC>:w<cr>
inoremap <leader>' ''<ESC>i
inoremap <leader>" ""<ESC>i
inoremap <leader>( ()<ESC>i
inoremap <leader>[ []<ESC>i
inoremap <leader>< < ><ESC>hxi
inoremap <leader>{ {}<ESC>i<CR><CR><ESC>ki<TAB>
inoremap <leader>q <ESC>:wq<cr>
inoremap <leader>s <ESC>:w<cr>
inoremap <leader>] <ESC>
inoremap <leader>m <ESC>:w<CR>:!make<CR>


"remove conflicting keystrokes'
nnoremap s <ESC>:w<CR>

"hotkeys"
no <down>   10j
no <up>	    10k
no <right> <ESC>:tabnext<CR>
no <left> <ESC>:tabprev<CR>
imap <C-n> :call NumberToggle()<cr>
nmap <C-n> :call NumberToggle()<cr>
nnoremap  <C-s> :w<CR>
inoremap  <C-s> <ESC>:w<CR>
map <C-o> <ESC>:tabnew.<cr>
nnoremap <C-m> :w<CR>:!make<cr>


"abbreviations ie snippets
abbr inc< #include< ><ESC>hxi
abbr for( for(i=0; i<10; i++)<cr>{}<ESC>i<cr><cr><ESC>ki<TAB>


"functions
function! NumberToggle()
  if(&relativenumber == 1)
      set number
      set relativenumber!
  else
set relativenumber
  endif
endfunc
