"*****************************************************************************
"" NeoBundle core
"*****************************************************************************

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"*****************************************************************************
"" NeoBundle install packages
"*****************************************************************************
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kentakins/hula.vim'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'ervandew/supertab'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'ctrlpvim/ctrlp.vim.git'
NeoBundle 'Shutnik/jshint2.vim'
NeoBundle 'vim-scripts/grep.vim'

call neobundle#end()

" Required:
filetype plugin indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start
let g:indentLine_color_term = 234

"" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xml,*.js,*.jsx"

" persistent undo
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " No console pops up
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
set undolevels=1000 "maximum number of changes that can be undone
"set undoreload=10000 "maximum number lines to save for undo on a buffer

"" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

set spelllang=en               " Set default language to English 

"" Map leader to ,
let mapleader=','

"" Indentline 
set listchars=tab:\|\ 
set list

" wrap
set nowrap
set showbreak=↳\ 

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set ttyfast
set binary

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set backspace=indent,eol,start
set showcmd
set shell=/bin/sh

"*****************************************************************************
"" Visual Settigns
"*****************************************************************************
syntax on
set ruler
set number
if (exists('+colorcolumn'))
	set colorcolumn=80
endif

let no_buffers_menu=1
highlight BadWhitespace ctermbg=red guibg=red
colorscheme hula

set mousemodel=popup
set t_Co=256
set nocursorline
set guioptions=egmrti
set gfn=Monospace\ 8

if has("gui_running")
  if $COLORTERM == 'gnome-terminal'
    set term=xterm-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif

if &term =~ '256color'
  set t_ut=
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ %{fugitive#statusline()}

" unicode symbols
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tagbar#enabled = 1


"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have these shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

set fillchars-=vert:\|

"*****************************************************************************
"" Functions
"*****************************************************************************

if !exists('*TrimWhitespace')
  function TrimWhitespace()
    let @*=line(".")
    %s/\s*$//e
    ''
  endfunction
endif



""
"" Toggle Invisible Whitespace
""

if !exists('*ShowInvisibles')
  function ShowInvisibles()
		"" whitespace chars
		hi NonText ctermfg=236
		hi SpecialKey ctermfg=236
		set listchars=space:∙,eol:¬,tab:\|\ 
    set list
  endfunction
endif

if !exists('*HideInvisibles')
  function HideInvisibles()
    set nolist
  endfunction
endif

if !exists('*ToggleInvisibles')
	let g:whitespace_visible = 0
	function! ToggleInvisibles()
			if g:whitespace_visible
					let g:whitespace_visible = 0
					:call HideInvisibles()
			else
					let g:whitespace_visible = 1
					:call ShowInvisibles()
			endif
	endfunction
endif

"" Show invisible whitespace
nnoremap <silent> <leader>- :call ToggleInvisibles()<CR>







""
"" Toggle Tab Vertial Lines
""

if !exists('*ShowTabs')
  function ShowTabs()
		"" whitespace chars
		hi SpecialKey ctermfg=234
		set listchars=tab:\|\ 
    set list
  endfunction
endif

if !exists('*HideTabs')
  function HideTabs()
    set nolist
  endfunction
endif

if !exists('*ToggleTabs')
	let g:whitespace_visible = 1
	function! ToggleTabs()
			if g:whitespace_visible
					let g:whitespace_visible = 0
					:call HideTabs()
			else
					let g:whitespace_visible = 1
					:call ShowTabs()
			endif
	endfunction
endif

"" Show tabs
nnoremap <silent> <leader><Tab> :call ToggleTabs()<CR>



""
"" Toggle ColorColumn
""

if !exists('*ShowColorColumn')
  function ShowColorColumn()
		hi ColorColumn ctermbg=233
  endfunction
endif

if !exists('*HideColorColumn')
  function HideColorColumn()
		hi ColorColumn ctermbg=NONE
  endfunction
endif

if !exists('*ToggleColorColumn')
	let g:color_column_visible = 1
	function! ToggleColorColumn()
			if g:color_column_visible
					let g:color_column_visible = 0
					:call HideColorColumn()
			else
					let g:color_column_visible = 1
					:call ShowColorColumn()
			endif
	endfunction
endif

"" Show color column
nnoremap <silent> <leader>\ :call ToggleColorColumn()<CR>




""
"" Toggle Paste Mode
""

if !exists('*PasteOn')
  function PasteOn()
		set paste
		:startinsert
		echo "Ready to paste stuff"
  endfunction
endif

if !exists('*PasteOff')
  function PasteOff()
		set nopaste
		echo "Paste off"
  endfunction
endif

if !exists('*TogglePasteMode')
	let g:paste_mode = 0
	function! TogglePasteMode()
			if g:paste_mode
					let g:paste_mode = 0
					:call PasteOff()
			else
					let g:paste_mode = 1
					:call PasteOn()
			endif
	endfunction
endif

"" Show invisible whitespace
nnoremap <silent> <leader>p :call TogglePasteMode()<CR>



""
"" Toggle Tab Complete
""

if !exists('*ToggleTabComplete')
	let g:tab_complete = 1
	function! ToggleTabComplete()
			if g:tab_complete
				let b:SuperTabDisabled=1
				let g:tab_complete = 0
				echo "SuperTab Disabled"
			else
				let b:SuperTabDisabled=0
				let g:tab_complete = 1
				echo "SuperTab Enabled"
			endif
	endfunction
endif

"" Show invisible whitespace
nnoremap <silent> <leader>t :call ToggleTabComplete()<CR>

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

"" Remember cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"" make/cmake
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake

if has("gui_running")
autocmd BufWritePre * :call TrimWhitespace()
endif

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 0
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = ',e'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_show_hidden = 1 

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"" Remove trailing whitespace on <leader>S
nnoremap <silent> <leader>S :call TrimWhitespace()<cr>:let @/=''<CR>

"" Toggle AutoPairs on/of
" nnoremap <silent> <leader>[ :call AutoPairsToggle()<CR>

set nopaste

"" Copy/Paste/Cut
noremap YY "+y<CR>
noremap PP "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
"noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>\

" nnoremap <Tab> :bn<CR>
" nnoremap <S-Tab> :bp<CR>

"" Close buffer
noremap <leader>q :bp<cr>:bd #<cr>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Open current line on GitHub
noremap ,o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>

"" Custom config

noremap  <silent> <C-Q>         :q<CR>
vnoremap <silent> <C-Q>         <C-C>:q<CR>
inoremap <silent> <C-Q>         <C-O>:q<CR>

let g:javascript_enable_domhtmlcss = 1
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"" shows file-tree for netrw when nerdtree not installed
let g:netrw_liststyle=3

"" start JSHint with asi true, which suppresses semicolon warnings
noremap <leader>j :JSHint asi:true<CR>

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 45
