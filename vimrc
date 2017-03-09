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


" netrw toggle
" -----------------------------------------------------------------------------
" credit: http://ivanbrennan.nyc/blog/2014/01/16/rigging-vims-netrw/

	let g:netrw_liststyle = 1         " thin (change to 3 for tree)
	let g:netrw_banner = 0            " no banner
	let g:netrw_altv = 1              " open files on right
	let g:netrw_preview = 1           " open previews vertically
	let g:netrw_retmap = 1						" define shortcut to return to netrw window

	fun! VexOpen(dir)
		let g:netrw_browse_split = 4    " open files in previous window
		let vex_width = 40

		execute "Vexplore"
		let t:vex_buf_nr = bufnr("%")
		wincmd H

		call VexSize(vex_width)
	endf

	fun! VexSize(vex_width)
		execute "vertical resize" . a:vex_width
		set winfixwidth
		call NormalizeWidths()
	endf

	fun! NormalizeWidths()
		let eadir_pref = &eadirection
		set eadirection=hor
		set equalalways! equalalways!
		let &eadirection = eadir_pref
	endf

	fun! VexClose()
		let cur_win_nr = winnr()
		let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )

		1wincmd w
		close
		unlet t:vex_buf_nr

		execute (target_nr - 1) . "wincmd w"
		call NormalizeWidths()
	endf

	fun! VexToggle(dir)
		if exists("t:vex_buf_nr")
			call VexClose()
		else
			call VexOpen(a:dir)
		endif
	endf

	noremap <silent><leader>n :call VexToggle(getcwd())<CR>


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

	"" Show invisible whitespace
	nnoremap <silent> <leader>- :call ToggleInvisibles()<CR>
