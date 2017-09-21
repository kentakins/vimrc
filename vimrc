" default
" -----------------------------------------------------------------------------

	" prefs
	set tabstop=2
	set shiftwidth=2
	set expandtab
	set number
	set nowrap
	set ruler
	set nomodeline
	set backspace=indent,eol,start
	set scrolloff=10
	set hidden
	filetype plugin indent on
	filetype plugin on

	" searching
	set hlsearch
	set incsearch
	set ignorecase
	set smartcase

	" encoding
	set bomb
	set ttyfast
	set binary
	set spelllang=en
	set encoding=utf-8
	set fileencoding=utf-8
	set fileencodings=utf-8

	" allows :find to work in sub-dirs
	set path+=**
	set wildmode=longest,full
	set wildmenu
	

" custom mappings
" -----------------------------------------------------------------------------

	"" map leader to ,
	let mapleader=','

	" copy to local clipboard
	noremap YY "+y<CR>

	"" buffer nav
	noremap <leader>z :bp<CR>
	noremap <leader>x :bn<CR>
	noremap <leader>q :bd<CR>
	noremap <leader><space> :noh<CR>
	map <C-l> :ls<CR>

	"" no one is really happy until you have these shortcuts
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

" syntax stuff
" -----------------------------------------------------------------------------

	set t_Co=256
	set term=xterm-256color
	syntax on
	autocmd BufEnter * :syntax sync fromstart

	" tweak delek theme into hula-blue
	colorscheme delek
	hi LineNr ctermfg=246
	hi Comment ctermfg=246

	hi Cursor					ctermfg=235		ctermbg=255		cterm=NONE
	hi Visual					ctermfg=NONE 	ctermbg=024		cterm=NONE
	hi CursorLine			ctermfg=NONE	ctermbg=024		cterm=NONE
	hi CursorColumn		ctermfg=NONE 	ctermbg=024		cterm=NONE
	hi ColorColumn		ctermfg=NONE 	ctermbg=NONE	cterm=NONE
	hi LineNr					ctermfg=246		ctermbg=NONE	cterm=NONE
	hi VertSplit			ctermfg=241		ctermbg=NONE	cterm=NONE
	hi MatchParen			ctermfg=255		ctermbg=024 	cterm=NONE
	hi StatusLine			ctermfg=255		ctermbg=241 	cterm=BOLD
	hi StatusLineNC		ctermfg=255		ctermbg=241 	cterm=NONE
	hi Pmenu					ctermfg=NONE	ctermbg=NONE 	cterm=NONE
	hi PmenuSel				ctermfg=NONE	ctermbg=241 	cterm=NONE
	hi IncSearch			ctermfg=NONE	ctermbg=024 	cterm=NONE
	hi Search					ctermfg=NONE	ctermbg=024 	cterm=NONE
	hi Directory			ctermfg=081		ctermbg=NONE 	cterm=NONE
	hi Folded					ctermfg=246		ctermbg=024 	cterm=NONE
	hi SignColumn			ctermfg=NONE 	ctermbg=024 	cterm=NONE
	hi Normal					ctermfg=255		ctermbg=NONE 	cterm=NONE
	hi Boolean				ctermfg=141		ctermbg=NONE	cterm=NONE
	hi Character			ctermfg=141		ctermbg=NONE	cterm=NONE
	hi Comment				ctermfg=246		ctermbg=NONE	cterm=NONE
	hi Conditional		ctermfg=198		ctermbg=NONE	cterm=NONE
	hi Constant				ctermfg=NONE 	ctermbg=NONE	cterm=NONE
	hi Define					ctermfg=198		ctermbg=NONE	cterm=NONE
	hi DiffAdd				ctermfg=255		ctermbg=154		cterm=BOLD
	hi DiffDelete			ctermfg=198 	ctermbg=NONE	cterm=NONE
	hi DiffChange			ctermfg=NONE 	ctermbg=NONE	cterm=NONE
	hi DiffText				ctermfg=NONE	ctermbg=024		cterm=BOLD
	hi ErrorMsg				ctermfg=255		ctermbg=161		cterm=NONE
	hi WarningMsg			ctermfg=255		ctermbg=161		cterm=NONE
	hi Float					ctermfg=141		ctermbg=NONE	cterm=NONE
	hi Function				ctermfg=081		ctermbg=NONE	cterm=NONE
	hi Identifier			ctermfg=081 	ctermbg=NONE	cterm=NONE
	hi Keyword				ctermfg=198		ctermbg=NONE	cterm=NONE
	hi Label					ctermfg=081		ctermbg=NONE	cterm=NONE
	hi NonText				ctermfg=238		ctermbg=NONE 	cterm=NONE
	hi Number					ctermfg=141		ctermbg=NONE	cterm=NONE
	hi Operator				ctermfg=198		ctermbg=NONE	cterm=NONE
	hi PreProc				ctermfg=081		ctermbg=NONE	cterm=NONE
	hi Special				ctermfg=255		ctermbg=NONE	cterm=NONE
	hi SpecialKey			ctermfg=238 	ctermbg=NONE  cterm=NONE
	hi Statement			ctermfg=198 	ctermbg=NONE	cterm=NONE
	hi StorageClass		ctermfg=081 	ctermbg=NONE	cterm=NONE
	hi String					ctermfg=154		ctermbg=NONE	cterm=NONE
	hi Tag						ctermfg=198		ctermbg=NONE	cterm=NONE
	hi Title					ctermfg=255		ctermbg=NONE	cterm=BOLD
	hi Todo						ctermfg=246		ctermbg=NONE	cterm=INVERSE
	hi Type						ctermfg=198		ctermbg=NONE	cterm=NONE
	hi underlined			ctermfg=NONE 	ctermbg=NONE	cterm=UNDERLINE

	" whitespace
	hi NonText ctermfg=238
	hi SpecialKey ctermfg=238
	set listchars=space:‧,eol:¬,tab:··
	set nolist
	set fillchars-=vert:\| 


" file stuff
" -----------------------------------------------------------------------------

	" swp and stuff
	set nobackup
	set noswapfile
	set fileformats=unix,dos,mac
	set showcmd
	set shell=/bin/sh

	" put plugins and dictionaries in this dir
	let vimDir = '$HOME/.vim'
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


" netrw
" -----------------------------------------------------------------------------

	let g:netrw_liststyle = 1         " full date
	let g:netrw_banner = 0            " no banner

	fun! ExOpen(dir)
		if exists("t:vex_buf_nr")
			execute "Rex"
		else
			execute "Explore" . a:dir
			let t:vex_buf_nr = bufnr("%")
		endif
	endf

	noremap <silent><leader>e :call ExOpen(getcwd())<CR>


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
			hi NonText ctermfg=238
			hi SpecialKey ctermfg=238
			set listchars=space:‧,eol:¬,tab:\·\ 
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
		endfunction
	endif

	nnoremap <silent><leader>S :call TrimWhitespace()<CR>


" toggle comments
" -----------------------------------------------------------------------------

	let s:comment_map = { 
			\   "c": '\/\/',
			\   "cpp": '\/\/',
			\   "go": '\/\/',
			\   "java": '\/\/',
			\   "javascript": '\/\/',
			\   "lua": '--',
			\   "scala": '\/\/',
			\   "php": '\/\/',
			\   "python": '#',
			\   "ruby": '#',
			\   "rust": '\/\/',
			\   "sh": '#',
			\   "desktop": '#',
			\   "fstab": '#',
			\   "conf": '#',
			\   "profile": '#',
			\   "bashrc": '#',
			\   "bash_profile": '#',
			\   "mail": '>',
			\   "eml": '>',
			\   "bat": 'REM',
			\   "ahk": ';',
			\   "vim": '"',
			\   "tex": '%',
			\ }

	function! ToggleComment()
			if has_key(s:comment_map, &filetype)
					let comment_leader = s:comment_map[&filetype]
					if getline('.') =~ "^\\s*" . comment_leader . " " 
							" Uncomment the line
							execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
					else 
							if getline('.') =~ "^\\s*" . comment_leader
									" Uncomment the line
									execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
							else
									" Comment the line
									execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
							end
					end
			else
					echo "No comment leader found for filetype"
			end
	endfunction

	nnoremap gc :call ToggleComment()<cr>
	vnoremap gc :call ToggleComment()<cr>

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
