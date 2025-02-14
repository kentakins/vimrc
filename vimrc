" vim-bootstrap b0a75e4

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
	set nocompatible							 " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "html,javascript"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(vimplug_exists)
	if !executable("curl")
		echoerr "You have to install curl or first install vim-plug yourself!"
		execute "q!"
	endif
	echo "Installing Vim-Plug..."
	echo ""
	silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let g:not_finish_vimplug = "yes"

	autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'avelino/vim-bootstrap-updater'
Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'

if isdirectory('/usr/local/opt/fzf')
	Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
	Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
				let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

if v:version >= 703
	Plug 'Shougo/vimshell.vim'
endif

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'


" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'


"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
	source ~/.vimrc.local.bundles
endif

call plug#end()

" Required:
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast
set nowrap
set showcmd

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
" set tabstop=2
" set softtabstop=0
" set shiftwidth=2
" set expandtab

set autoindent
set noexpandtab
set tabstop=2
set shiftwidth=2

"" Set relative number line
set rnu


"" Map leader to ,
let mapleader=','

"" Setup Ale/Eslint
let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_echo_msg_warning_str = '⚠ Warning'
let g:ale_enabled = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 200
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 1
let g:ale_linter_aliases = {}
let g:ale_linters = {'vim': ['vint'], 'markdown': ['mdl'], 'sh': ['shellcheck'], 'html': ['tidy'], 'javascript': ['eslint'], 'python': ['flake8']}
let g:ale_open_list = 0
let g:ale_set_highlights = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
let g:ale_sign_column_always = 0
let g:ale_sign_error = '⚠'
let g:ale_sign_offset = 1000000
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
let g:ale_warn_about_trailing_whitespace = 1

" nmap <silent> <leader>] :ALENext<cr>
" nmap <silent> <leader>[ :ALEPrevious<cr>

nmap <silent> <C-g> <Plug>(ale_previous_wrap)
nmap <silent> <C-h> <Plug>(ale_next_wrap)

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

if exists('$SHELL')
		set shell=$SHELL
else
		set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1



" undo history
" -----------------------------------------------------------------------------

" put plugins and dictionaries in this dir
let vimDir = '$HOME/.config/nvim'
let &runtimepath.=','.vimDir
" keep undo history across sessions by storing it in a file
if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" no console pops up
	call system('mkdir ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif
set undolevels=1000 "maximum number of changes that can be undone



"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
	if has("gui_mac") || has("gui_macvim")
		set guifont=Menlo:h12
		set transparency=7
	endif
else
	let g:CSApprox_loaded = 1

	" IndentLine
	let g:indentLine_enabled = 0
	let g:indentLine_concealcursor = 0
	let g:indentLine_char = '┆'
	let g:indentLine_faster = 1

	if $COLORTERM == 'gnome-terminal'
		set term=gnome-256color
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

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
	set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'distinguished'
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=0
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent><leader>e :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" terminal emulation
if g:vim_bootstrap_editor == 'nvim'
	nnoremap <silent> <leader>sh :terminal<CR>
else
	nnoremap <silent> <leader>sh :VimShellCreate<CR>
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
	autocmd!
	autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
	autocmd!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" make/cmake
augroup vimrc-make-cmake
	autocmd!
	autocmd FileType make setlocal noexpandtab
	autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
" nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>F :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =	"find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
	let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
	set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
	let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
	set grepprg=rg\ --vimgrep
	command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>F :FZF -m<CR>

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
	autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
	set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
	" pbcopy for OSX copy/paste
	vmap <C-x> :!pbcopy<CR>
	vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>q :bd<CR>
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l
" noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"*****************************************************************************
"" Custom configs
"*****************************************************************************

autocmd Filetype *.* %retab!
autocmd BufNewFile,BufRead *.mjs set filetype=javascript

" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 noexpandtab


" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
	autocmd!
	autocmd FileType javascript set tabstop=2|set shiftwidth=2|set noexpandtab
augroup END


"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = '|'
	let g:airline_left_sep					= '▶'
	let g:airline_left_alt_sep			= '»'
	let g:airline_right_sep					= '◀'
	let g:airline_right_alt_sep			= '«'
	let g:airline#extensions#branch#prefix		 = '⤴' "➔, ➥, ⎇
	let g:airline#extensions#readonly#symbol	 = '⊘'
	let g:airline#extensions#linecolumn#prefix = '¶'
	let g:airline#extensions#paste#symbol			 = 'ρ'
	let g:airline_symbols.linenr		= '␊'
	let g:airline_symbols.branch		= '⎇'
	let g:airline_symbols.paste			= 'ρ'
	let g:airline_symbols.paste			= 'Þ'
	let g:airline_symbols.paste			= '∥'
	let g:airline_symbols.whitespace = 'Ξ'
else
	let g:airline#extensions#tabline#left_sep = ''
	let g:airline#extensions#tabline#left_alt_sep = ''

	" powerline symbols
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = ''
	let g:airline_symbols.readonly = ''
	let g:airline_symbols.linenr = ''
endif

" syntax stuff
" -----------------------------------------------------------------------------

	" theme reference
	" cterm 	hex
	" 255 	#ffffff // white
	" 232 	#080808 // grey
	" 233 	#121212 // grey
	" 234 	#1c1c1c // grey
	" 235 	#262626 // grey
	" 237 	#3a3a3a // grey
	" 244 	#808080 // grey
	" 009		#ff0000 // red
	" 047		#00d75f // green
	" 122		#87ffd7 // aquamarine
	" 045		#00d7ff // turquoise

	" set t_Co=256
	" set term=xterm-256color
	syntax on
	autocmd BufEnter * :syntax sync fromstart

	" tweak delek theme into hula-blue
	" colorscheme delek
	" hi LineNr ctermfg=246 guifg=#949494
	" hi Comment ctermfg=246 guifg=#949494

	hi Cursor					ctermfg=235		ctermbg=255		cterm=NONE			guifg=#262626		guibg=#ffffff		gui=NONE
	hi Visual					ctermfg=NONE 	ctermbg=024		cterm=NONE			guifg=NONE			guibg=#005f87		gui=NONE
	hi CursorLine			ctermfg=NONE	ctermbg=024		cterm=NONE			guifg=NONE			guibg=#005f87		gui=NONE
	hi CursorColumn		ctermfg=NONE 	ctermbg=024		cterm=NONE			guifg=NONE			guibg=#005f87		gui=NONE
	hi ColorColumn		ctermfg=NONE 	ctermbg=NONE	cterm=NONE			guifg=NONE			guibg=NONE			gui=NONE
	hi LineNr					ctermfg=241		ctermbg=NONE	cterm=NONE			guifg=#606060		guibg=NONE			gui=NONE
	hi VertSplit			ctermfg=241		ctermbg=NONE	cterm=NONE			guifg=#626262		guibg=NONE			gui=NONE
	hi MatchParen			ctermfg=255		ctermbg=024 	cterm=NONE			guifg=#ffffff		guibg=#005f87 	gui=NONE
	hi StatusLine			ctermfg=255		ctermbg=241 	cterm=BOLD			guifg=#ffffff		guibg=#626262 	gui=BOLD
	hi StatusLineNC		ctermfg=255		ctermbg=241 	cterm=NONE			guifg=#ffffff		guibg=#626262 	gui=NONE
	hi Pmenu					ctermfg=NONE	ctermbg=NONE 	cterm=NONE			guifg=NONE			guibg=NONE 			gui=NONE
	hi PmenuSel				ctermfg=NONE	ctermbg=241 	cterm=NONE			guifg=NONE			guibg=#626262 	gui=NONE
	hi IncSearch			ctermfg=NONE	ctermbg=024 	cterm=NONE			guifg=NONE			guibg=#005f87 	gui=NONE
	hi Search					ctermfg=NONE	ctermbg=024 	cterm=NONE			guifg=NONE			guibg=#005f87 	gui=NONE
	hi Directory			ctermfg=045		ctermbg=NONE 	cterm=NONE			guifg=#00d7ff		guibg=NONE 			gui=NONE
	hi Folded					ctermfg=246		ctermbg=024 	cterm=NONE			guifg=#949494		guibg=#005f87 	gui=NONE
	hi SignColumn			ctermfg=NONE 	ctermbg=024 	cterm=NONE			guifg=NONE 			guibg=#005f87 	gui=NONE
	hi Normal					ctermfg=255		ctermbg=NONE 	cterm=NONE			guifg=#ffffff		guibg=#0b2632 	gui=NONE
	hi Boolean				ctermfg=177		ctermbg=NONE	cterm=NONE			guifg=#af87ff		guibg=NONE			gui=NONE
	hi Character			ctermfg=177		ctermbg=NONE	cterm=NONE			guifg=#af87ff		guibg=NONE			gui=NONE
	hi Comment				ctermfg=244		ctermbg=NONE	cterm=NONE			guifg=#808080		guibg=NONE			gui=NONE
	hi Conditional		ctermfg=009		ctermbg=NONE	cterm=NONE			guifg=#ff0000		guibg=NONE			gui=NONE
	hi Constant				ctermfg=NONE 	ctermbg=NONE	cterm=NONE			guifg=NONE 			guibg=NONE			gui=NONE
	hi Define					ctermfg=009		ctermbg=NONE	cterm=NONE			guifg=#ff0000		guibg=NONE			gui=NONE
	hi DiffAdd				ctermfg=122		ctermbg=NONE	cterm=BOLD			guifg=#87ffd7		guibg=NONE			gui=BOLD
	hi DiffDelete			ctermfg=009 	ctermbg=NONE	cterm=NONE			guifg=#ff0000 	guibg=NONE			gui=NONE
	hi DiffChange			ctermfg=NONE 	ctermbg=024 	cterm=NONE			guifg=NONE 			guibg=NONE			gui=NONE
	hi DiffText				ctermfg=NONE	ctermbg=024		cterm=BOLD			guifg=NONE			guibg=#005f87		gui=BOLD
	hi ErrorMsg				ctermfg=NONE	ctermbg=NONE	cterm=UNDERLINE guifg=NONE			guibg=NONE			gui=UNDERLINE
	hi WarningMsg			ctermfg=NONE	ctermbg=NONE	cterm=NONE			guifg=NONE			guibg=NONE			gui=NONE
	hi Float					ctermfg=177		ctermbg=NONE	cterm=NONE			guifg=#af87ff		guibg=NONE			gui=NONE
	hi Function				ctermfg=045		ctermbg=NONE	cterm=NONE			guifg=#00d7ff		guibg=NONE			gui=NONE
	hi Identifier			ctermfg=045 	ctermbg=NONE	cterm=NONE			guifg=#00d7ff 	guibg=NONE			gui=NONE
	hi Keyword				ctermfg=009		ctermbg=NONE	cterm=NONE			guifg=#ff0000		guibg=NONE			gui=NONE
	hi Label					ctermfg=045		ctermbg=NONE	cterm=NONE			guifg=#00d7ff		guibg=NONE			gui=NONE
	hi NonText				ctermfg=238		ctermbg=NONE 	cterm=NONE			guifg=#444444		guibg=NONE			gui=NONE
	hi Number					ctermfg=177		ctermbg=NONE	cterm=NONE			guifg=#af87ff		guibg=NONE			gui=NONE
	hi Operator				ctermfg=009		ctermbg=NONE	cterm=NONE			guifg=#ff0000		guibg=NONE			gui=NONE
	hi PreProc				ctermfg=045		ctermbg=NONE	cterm=NONE			guifg=#00d7ff		guibg=NONE			gui=NONE
	hi Special				ctermfg=255		ctermbg=NONE	cterm=NONE			guifg=#ffffff		guibg=NONE			gui=NONE
	hi SpecialKey			ctermfg=238 	ctermbg=NONE  cterm=NONE			guifg=#444444 	guibg=NONE			gui=NONE
	hi Statement			ctermfg=009 	ctermbg=NONE	cterm=NONE			guifg=#ff0000 	guibg=NONE			gui=NONE
	hi StorageClass		ctermfg=045 	ctermbg=NONE	cterm=NONE			guifg=#00d7ff 	guibg=NONE			gui=NONE
	hi String					ctermfg=047		ctermbg=NONE	cterm=NONE			guifg=#00d75f		guibg=NONE			gui=NONE
	hi Tag						ctermfg=009		ctermbg=NONE	cterm=NONE			guifg=#ff0000		guibg=NONE			gui=NONE
	hi Title					ctermfg=255		ctermbg=NONE	cterm=BOLD			guifg=#ffffff		guibg=NONE			gui=BOLD
	hi Todo						ctermfg=246		ctermbg=NONE	cterm=INVERSE		guifg=#949494		guibg=NONE			gui=INVERSE
	hi Type						ctermfg=009		ctermbg=NONE	cterm=NONE			guifg=#ff0000		guibg=NONE			gui=NONE
	hi underlined			ctermfg=NONE 	ctermbg=NONE	cterm=UNDERLINE guifg=NONE 			guibg=NONE			gui=UNDERLINE

	" whitespace
	hi NonText ctermfg=238 guifg=#444444
	hi SpecialKey ctermfg=238 guifg=#444444
	" set listchars=space:‧,eol:¬,tab:··
	set nolist
	set fillchars-=vert:\|

	" custom javastript highlighting
	hi jsFuncArgs 					ctermfg=011 	ctermbg=NONE	cterm=NONE			guifg=#ffdf00 	guibg=NONE			gui=NONE
	hi jsFuncCall 					ctermfg=045 	ctermbg=NONE	cterm=NONE			guifg=#00d7ff 	guibg=NONE			gui=NONE
	hi jsFuncArgExpression 	ctermfg=045 	ctermbg=NONE	cterm=NONE			guifg=#00d7ff 	guibg=NONE			gui=NONE
	hi jsVariableDef				ctermfg=011 	ctermbg=NONE	cterm=NONE			guifg=#ffdf00 	guibg=NONE			gui=NONE
	hi jsStorageClass				ctermfg=045 	ctermbg=NONE	cterm=NONE			guifg=#00d7ff 	guibg=NONE			gui=NONE
	hi jsRepeat							ctermfg=011 	ctermbg=NONE	cterm=NONE			guifg=#ffdf00 	guibg=NONE			gui=NONE
	hi jsArrowFunction 			ctermfg=045 	ctermbg=NONE	cterm=NONE			guifg=#00d7ff 	guibg=NONE			gui=NONE

	hi jsObjectKey					ctermfg=250 	ctermbg=NONE	cterm=NONE			guifg=#bcbcbc 	guibg=NONE			gui=NONE
	hi jsObjectProp 				ctermfg=250 	ctermbg=NONE	cterm=NONE			guifg=#bcbcbc 	guibg=NONE			gui=NONE
	hi jsObjectBraces 			ctermfg=246 	ctermbg=NONE	cterm=NONE			guifg=#949494 	guibg=NONE			gui=NONE

	hi jsTemplateExpression ctermfg=047 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpCharClass 		ctermfg=047 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpBoundary 		ctermfg=047 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpBackRef 			ctermfg=047 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpQuantifier 	ctermfg=047 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpOr 					ctermfg=047 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpMod 					ctermfg=047 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpGroup 				ctermfg=047 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpString 			ctermfg=047 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpSpecial 			ctermfg=047 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE

	" ALE highlighting
	hi ALEErrorSign ctermfg=009 ctermbg=none cterm=none
	hi ALEError ctermfg=009 ctermbg=none cterm=underline

" toggle paste mode
" -----------------------------------------------------------------------------

	if !exists('*PasteOn')
		function PasteOn()
			set paste
			:startinsert
			echo "Ready to paste"
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

	nnoremap <silent> <leader>p :call TogglePasteMode()<CR>

" toggle invisibles
" -----------------------------------------------------------------------------

	if !exists('*ShowInvisibles')
		function ShowInvisibles()
			"" whitespace chars
			hi NonText ctermfg=238 guifg=#444444
			hi SpecialKey ctermfg=238 guifg=#444444
			set listchars=space:‧,eol:¶,tab:┆\
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

	nnoremap <silent> <leader>- :call ToggleInvisibles()<CR>


" trim trailing whitespace
" -----------------------------------------------------------------------------

	if !exists('*TrimWhitespace')
		function TrimWhitespace()
			%s/\s\+$//e
			%s/;$//e
		endfunction
	endif

	nnoremap <silent><leader>S :call TrimWhitespace()<CR>

" remap tab to keyword completion
" -----------------------------------------------------------------------------
	function! TabComplete(direction)
		let col = col('.') - 1
		if !col || getline('.')[col - 1] !~ '\k'
			return "\<tab>"
		elseif "backward" == a:direction
			return "\<c-p>"
		elseif "forward" == a:direction
			return "\<c-n>"
		else
			return "\<c-x>\<c-k>"
		endif
	endfunction

	inoremap <tab> <c-r>=TabComplete ("forward")<CR>


" toggle tab completion
" -----------------------------------------------------------------------------
	function! ToggleTabCompletion()
		if mapcheck("\<tab>", "i") != ""
			:iunmap <tab>
			echo "tab completion off"
		else
			:imap <tab> <c-n>
			echo "tab completion on"
		endif
	endfunction

	map <Leader>t :call ToggleTabCompletion()<CR>

" dx deploy
" -----------------------------------------------------------------------------
	function! DxDeploy()
		" call inputsave()
		" let v = input('Enter DX version (<enter> to cancel):')
		" call inputrestore()
		" if empty(v)
		" else
			:cd ~/dx-aws
			execute '!npm run deploy:dx'
		" endif
	endfunction

	map <leader>d :call DxDeploy()<CR>

