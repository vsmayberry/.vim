execute pathogen#infect()

"***************************************************"
"******************* PREFERENCES *******************
"plugins settings
set numberwidth=1
set laststatus=2
set sw=4
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
"open new file in window"
inoremap <leader>o <ESC>:tabnew<cr>
nnoremap <leader>o :tabnew<cr>
vnoremap <leader>o :tabnew<cr>
"insert folding symbols"
inoremap <leader>sf {{{
inoremap <leader>ef }}}
nnoremap <leader>fb %a//end fold }}}<ESC>0%ko//start fold {{{<ESC>za
""--------------------------------------MAPPINGS FOR PLUGINS-------------
"gundo visual undo tree"
nnoremap <leader>u :GundoToggle<CR>
inoremap <leader>u :GundoToggle<CR>
vnoremap <leader>u :GundoToggle<CR>
"open up nerd tree for file nav"
nnoremap <leader>n :NERDTreeToggle<CR>
inoremap <leader>n :NERDTreeToggle<CR>
vnoremap <leader>n :NERDTreeToggle<CR>
"esc and save customization"
inoremap jk    <ESC>:w<CR>
inoremap <leader>[ <ESC>:w<CR>
inoremap  <leader>] <ESC>
vnoremap  <leader>] <ESC>
"write file and execute local make file"
inoremap <leader>m <ESC>:w<CR>:!make<CR>
"closing matching symbols"
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i<CR><CR><ESC>ki<TAB>
inoremap <leader>{ {
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
nnoremap ; :
vnoremap ; :
"set 0 to go the the first non blank of line"
noremap 0 ^
"remove the highlighting from the last search"
noremap <silent> <leader><cr> :noh<cr>
"pull up a copy of current learningvim"
nnoremap <leader>lv :tabnew ~/.vim/learnvim.txt<CR>
nnoremap <leader>lt :tabnew ~/.vim/learntmux.txt<CR>
"quick edit for the tmux file"
nnoremap <leader>et :tabnew ~/.tmux.conf<cr>
nnoremap <leader>st :source ~/.tmux.conf<cr>
"quick edit for the vimrc file"
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"encase the current word in double quotes"
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
"hot key to prototype c function under Prototype header"
inoremap <leader>pf :call CPrototypeFunction()<CR>
nnoremap <leader>pf :call CPrototypeFunction()<CR>
"****************************************************"
"******************* OVERWRITE KEYS *****************
"hotkeys"
nnoremap <down>   10j
nnoremap <up>	    10k
nnoremap <right> <ESC>:tabnext<CR>
nnoremap <left> <ESC>:tabprev<CR>

"*****************************************************"
"*********************** SNIPPETS ********************
"abbreviations ie snippets
abbr inc #include< ><ESC>i
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

autocmd BufWrite * :call DeleteTrailingWS()
func! DeleteTrailingWS()
        exe "normal mz"
        %s/\s\+$//ge
        exe "normal `z"
endfunc
autocmd BufNewFile Makefile :call ChangeTabs()
func! ChangeTabs()
	set expandtab!
endfunc
autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c
autocmd BufNewFile *.h 0r ~/.vim/templates/skeleton.h
autocmd BufNewFile *.c,*.h :call TimeCreatedStamp()
func! TimeCreatedStamp()
        exe "normal mi"
        %s/taimilolotonga/\=strftime("%c")/
        exe "normal 'i"
endfunc
func! CPrototypeFunction()
let temp = @@
    exe "normal! mayy"
    exe "normal! /Prototypes\<CR>"
    exe "normal! )kpA;\<ESC>"
    exe "normal! 'a"
let @@ = temp
endfunc
