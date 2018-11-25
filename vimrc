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
	
	set shell=/bin/bash

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

	" theme reference
	" cterm 	hex
	" 255 	#ffffff
	" 232 	#080808
	" 233 	#121212
	" 234 	#1c1c1c
	" 235 	#262626
	" 237 	#3a3a3a
	" 244 	#808080
	" 197		#ff005f
	" 041		#00d75f
	" 154		#afff00
	" 081		#5fd7ff

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
	hi Directory			ctermfg=081		ctermbg=NONE 	cterm=NONE			guifg=#5fd7ff		guibg=NONE 			gui=NONE
	hi Folded					ctermfg=246		ctermbg=024 	cterm=NONE			guifg=#949494		guibg=#005f87 	gui=NONE
	hi SignColumn			ctermfg=NONE 	ctermbg=024 	cterm=NONE			guifg=NONE 			guibg=#005f87 	gui=NONE
	hi Normal					ctermfg=255		ctermbg=NONE 	cterm=NONE			guifg=#ffffff		guibg=#0b2632 	gui=NONE
	hi Boolean				ctermfg=141		ctermbg=NONE	cterm=NONE			guifg=#af87ff		guibg=NONE			gui=NONE
	hi Character			ctermfg=141		ctermbg=NONE	cterm=NONE			guifg=#af87ff		guibg=NONE			gui=NONE
	hi Comment				ctermfg=244		ctermbg=NONE	cterm=NONE			guifg=#808080		guibg=NONE			gui=NONE
	hi Conditional		ctermfg=197		ctermbg=NONE	cterm=NONE			guifg=#ff005f		guibg=NONE			gui=NONE
	hi Constant				ctermfg=NONE 	ctermbg=NONE	cterm=NONE			guifg=NONE 			guibg=NONE			gui=NONE
	hi Define					ctermfg=197		ctermbg=NONE	cterm=NONE			guifg=#ff005f		guibg=NONE			gui=NONE
	hi DiffAdd				ctermfg=NONE	ctermbg=022		cterm=BOLD			guifg=#ffffff		guibg=#afff00		gui=BOLD
	hi DiffDelete			ctermfg=197 	ctermbg=NONE	cterm=NONE			guifg=#ff005f 	guibg=NONE			gui=NONE
	hi DiffChange			ctermfg=NONE 	ctermbg=024 	cterm=NONE			guifg=NONE 			guibg=NONE			gui=NONE
	hi DiffText				ctermfg=NONE	ctermbg=024		cterm=BOLD			guifg=NONE			guibg=#005f87		gui=BOLD
	hi ErrorMsg				ctermfg=255		ctermbg=161		cterm=NONE			guifg=#ffffff		guibg=#d7005f		gui=NONE
	hi WarningMsg			ctermfg=255		ctermbg=161		cterm=NONE			guifg=#ffffff		guibg=#d7005f		gui=NONE
	hi Float					ctermfg=141		ctermbg=NONE	cterm=NONE			guifg=#af87ff		guibg=NONE			gui=NONE
	hi Function				ctermfg=081		ctermbg=NONE	cterm=NONE			guifg=#5fd7ff		guibg=NONE			gui=NONE
	hi Identifier			ctermfg=081 	ctermbg=NONE	cterm=NONE			guifg=#5fd7ff 	guibg=NONE			gui=NONE
	hi Keyword				ctermfg=197		ctermbg=NONE	cterm=NONE			guifg=#ff005f		guibg=NONE			gui=NONE
	hi Label					ctermfg=081		ctermbg=NONE	cterm=NONE			guifg=#5fd7ff		guibg=NONE			gui=NONE
	hi NonText				ctermfg=238		ctermbg=NONE 	cterm=NONE			guifg=#444444		guibg=NONE			gui=NONE
	hi Number					ctermfg=141		ctermbg=NONE	cterm=NONE			guifg=#af87ff		guibg=NONE			gui=NONE
	hi Operator				ctermfg=197		ctermbg=NONE	cterm=NONE			guifg=#ff005f		guibg=NONE			gui=NONE
	hi PreProc				ctermfg=081		ctermbg=NONE	cterm=NONE			guifg=#5fd7ff		guibg=NONE			gui=NONE
	hi Special				ctermfg=255		ctermbg=NONE	cterm=NONE			guifg=#ffffff		guibg=NONE			gui=NONE
	hi SpecialKey			ctermfg=238 	ctermbg=NONE  cterm=NONE			guifg=#444444 	guibg=NONE			gui=NONE
	hi Statement			ctermfg=197 	ctermbg=NONE	cterm=NONE			guifg=#ff005f 	guibg=NONE			gui=NONE
	hi StorageClass		ctermfg=081 	ctermbg=NONE	cterm=NONE			guifg=#5fd7ff 	guibg=NONE			gui=NONE
	hi String					ctermfg=041		ctermbg=NONE	cterm=NONE			guifg=#00d75f		guibg=NONE			gui=NONE
	hi Tag						ctermfg=197		ctermbg=NONE	cterm=NONE			guifg=#ff005f		guibg=NONE			gui=NONE
	hi Title					ctermfg=255		ctermbg=NONE	cterm=BOLD			guifg=#ffffff		guibg=NONE			gui=BOLD
	hi Todo						ctermfg=246		ctermbg=NONE	cterm=INVERSE		guifg=#949494		guibg=NONE			gui=INVERSE
	hi Type						ctermfg=197		ctermbg=NONE	cterm=NONE			guifg=#ff005f		guibg=NONE			gui=NONE
	hi underlined			ctermfg=NONE 	ctermbg=NONE	cterm=UNDERLINE guifg=NONE 			guibg=NONE			gui=UNDERLINE

	" whitespace
	hi NonText ctermfg=238 guifg=#444444
	hi SpecialKey ctermfg=238 guifg=#444444
	" set listchars=space:‧,eol:¬,tab:··
	set nolist
	set fillchars-=vert:\| 
	
	" custom javastript highlighting
	hi jsFuncArgs 					ctermfg=220 	ctermbg=NONE	cterm=NONE			guifg=#ffdf00 	guibg=NONE			gui=NONE
	hi jsFuncCall 					ctermfg=081 	ctermbg=NONE	cterm=NONE			guifg=#5fd7ff 	guibg=NONE			gui=NONE
	hi jsFuncArgExpression 	ctermfg=081 	ctermbg=NONE	cterm=NONE			guifg=#5fd7ff 	guibg=NONE			gui=NONE
	hi jsVariableDef				ctermfg=220 	ctermbg=NONE	cterm=NONE			guifg=#ffdf00 	guibg=NONE			gui=NONE
	hi jsStorageClass				ctermfg=081 	ctermbg=NONE	cterm=NONE			guifg=#5fd7ff 	guibg=NONE			gui=NONE
	hi jsRepeat							ctermfg=220 	ctermbg=NONE	cterm=NONE			guifg=#ffdf00 	guibg=NONE			gui=NONE
	hi jsArrowFunction 			ctermfg=081 	ctermbg=NONE	cterm=NONE			guifg=#5fd7ff 	guibg=NONE			gui=NONE

	hi jsObjectKey					ctermfg=250 	ctermbg=NONE	cterm=NONE			guifg=#bcbcbc 	guibg=NONE			gui=NONE
	hi jsObjectProp 				ctermfg=250 	ctermbg=NONE	cterm=NONE			guifg=#bcbcbc 	guibg=NONE			gui=NONE
	hi jsObjectBraces 			ctermfg=246 	ctermbg=NONE	cterm=NONE			guifg=#949494 	guibg=NONE			gui=NONE

	hi jsTemplateExpression ctermfg=041 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpCharClass 		ctermfg=041 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpBoundary 		ctermfg=041 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpBackRef 			ctermfg=041 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpQuantifier 	ctermfg=041 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpOr 					ctermfg=041 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpMod 					ctermfg=041 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpGroup 				ctermfg=041 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpString 			ctermfg=041 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE
	hi jsRegexpSpecial 			ctermfg=041 	ctermbg=NONE	cterm=NONE			guifg=#00d75f 	guibg=NONE			gui=NONE


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

	let g:netrw_liststyle = 4         " full date
	let g:netrw_banner = 0            " no banner
	let g:netrw_dirhistmax = 0
	let g:netrw_keepdir = 1
	let g:netrw_browse_split = 4
	let g:netrw_winsize = 30

	" noremap <silent><leader>e :e.<CR>

	let g:NetrwIsOpen=0

	function! ToggleNetrw()
			if g:NetrwIsOpen
					let i = bufnr("$")
					while (i >= 1)
							if (getbufvar(i, "&filetype") == "netrw")
									silent exe "bwipeout " . i 
							endif
							let i-=1
					endwhile
					let g:NetrwIsOpen=0
			else
					let g:NetrwIsOpen=1
					silent Vex
			endif
	endfunction

	" Add your own mapping. For example:
	noremap <silent><leader>e :call ToggleNetrw()<CR>

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
	
" dx deploy
" -----------------------------------------------------------------------------
	function! DxDeploy()
		call inputsave()
		let v = input('Enter DX version (<enter> to cancel):')
		call inputrestore()
		if empty(v)
		else
			:cd ~/dx-cloud
			execute '!npm run deploy' v
		endif
	endfunction

	map <leader>d :call DxDeploy()<CR>
