execute pathogen#infect()

"***************************************************"
"******************* PREFERENCES *******************
"
"plugins settings
set numberwidth=1
set laststatus=2
:"set preferences
set incsearch
set number
set hlsearch
set autoindent
set expandtab
set tabstop=4
set wildmenu
set wildmode=list:longest,full
set lazyredraw
"folding preferences"
set foldtext
set foldmethod=marker
syntax on
filetype on
filetype plugin on
set ruler

"******************************************************
"******************MAPPINGS****************************
"leader key
inoremap <c-n> <ESC>:call NumberToggle()<cr>
nnoremap <c-n> <ESC>:call NumberToggle()<cr>
"consider mapping a localleader for specific types of files"
"mapping leader to save and quit"
inoremap <leader>q <ESC>:wq<cr>
nnoremap <leader>q <ESC>:wq<cr>
vnoremap <leader>q <ESC>:wq<cr>
"write file from various modes"
inoremap <leader>w <ESC>:w<cr>
nnoremap <leader>w :w<cr>
vnoremap <leader>w <ESC>:w<cr>
"open up nerd tree for file nav"
nnoremap <leader>t :NERDTreeToggle<CR>
inoremap <leader>t :NERDTreeToggle<CR>
vnoremap <leader>t :NERDTreeToggle<CR>
"esc and save customization"
inoremap <leader>[ <ESC>:w<CR>
inoremap  <leader>] <ESC>
vnoremap  <leader>] <ESC>
"write file and execute local make file"
inoremap <leader>m <ESC>:w<CR>:!make<CR>
"closing matching symbols"
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i<CR><CR><ESC>ki<TAB>
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
"set 0 to go the the first non blank of line"
noremap 0 ^
"remove the highlighting from the last search"
noremap <silent> <leader><cr> :noh<cr>
"pull up a copy of current learningvim"
nnoremap <leader>lv :tabnew ~/xdev/learn.txt<CR>
"quick edit for the vimrc file"
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"encase the current word in double quotes"
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

"****************************************************"
"******************* OVERWRITE KEYS *****************
"hotkeys"
nnoremap <down>   10j
nnoremap <up>	    10k
nnoremap <right> <ESC>:tabnext<CR>
nnoremap <left> <ESC>:tabprev<CR>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <ESC>:tabprev<CR>
inoremap <right> <ESC>:tabnext<CR>

"*****************************************************"
"*********************** SNIPPETS ********************
"abbreviations ie snippets
abbr inc #include< ><ESC>i
abbr for for(i=0; i<10; i++<ESC>o{<ESC>i<cr><cr><ESC>ki<TAB>


"functions
function! NumberToggle()
  if(&relativenumber == 1)
      set number
      set relativenumber!
  else
set relativenumber
  endif
endfunc

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

func! DeleteTrailingWS()
        exe "normal mz"
        %s/\s\+$//ge
        exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()
