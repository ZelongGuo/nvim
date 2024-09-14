"" ___  ___      _   _        _                    
" |  \/  |     | \ | |      (_)                   
" | .  . |_   _|  \| |_   ___ _ __ ___  _ __ ___ 
" | |\/| | | | | . ` \ \ / / | '_ ` _ \| '__/ __|
" | |  | | |_| | |\  |\ V /| | | | | | | | | (__ 
" \_|  |_/\__, \_| \_/ \_/ |_|_| |_| |_|_|  \___|
"          __/ |                                 
"         |___/                                  
"
" Author: Zelong Guo @ GFZ, Potsdam
" Email: zelong.guo@outlook.com 
"

" ==================== Auto load for first time uses ====================
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYNVIMRC
endif

" +++++++++++++++++++++++++++++e Some VIM Setting ++++++++++++++++++++++++++++++
set hidden
let mapleader = " "
syntax enable
syntax on
set autochdir
set number
set relativenumber
set notimeout
" normal mode timeout
set timeoutlen=0
" insert and visual modes timeout
set ttimeoutlen=0
set cursorline
set cursorcolumn
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
" Check English 
set spell
"set ignorecase
"set colorcolumn=100
"Mouse is not allowed
set mouse=
set updatetime=100
" set folding
set foldmethod=marker
set foldmarker=<center>,</center>
" set indent
"set smartindent
set cindent
set shiftwidth=4
" Enable true color support, important for colorschemes
if has("termguicolors")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    set termguicolors
endif

" Don't save the marks for next-time opening files
set viminfo='100,\"0
" Automatically located the cursor to the place of last exiting file
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif

" set foldmethod=expr
" set foldexpr=MarkdownFold()
" function! MarkdownFold()
"   " define the rules for folding
"   if getline(v:lnum) =~ '^ *<.*>.*<.*>$'
"     return '>'
"   else
"     return '='
"   endif
" endfunction

noremap <silent> j h
noremap <silent> i k
noremap <silent> k j
noremap <silent> J 7h
noremap <silent> I 5k
noremap <silent> K 5j
noremap <silent> L 7l
" go to start of the line
noremap <C-j> 0
" go to end of the line
noremap <C-l> $
" go to the top of the screen
noremap <C-i> H 
" go to the bottom of the screen
noremap <C-k> L 
" go to the Middile of the screen
noremap <C-m> M 
noremap h i
noremap H I
" Faster in-line navigation
noremap W 5w
noremap B 5b
"noremap M L
noremap <LEADER><CR> :nohlsearch<CR>

" Insert and Visual mode return Esc 
inoremap jk <Esc>
vnoremap jk <Esc>
" Delte a character, same to 'backspace'
inoremap <C-j> <C-h>
" The following part of auto-completion about double parenthesis has moved to all.snippets
" Auto backspace when typing double parenthesis
" inoremap "" ""<++><Esc>4hi
" inoremap '' ''<++><Esc>4hi
" inoremap () ()<++><Esc>4hi
" inoremap {} {}<++><Esc>4hi
" inoremap [] []<++><Esc>4hi
" inoremap <> <><++><Esc>4hi
inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
" Press space twice to jump to the next '<++>' and edit it, i.e., place holder
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

map s <nop>
map S :w<CR>
map Q :q<CR>
" Here we automatically resize the windowns of iTerm2 and Chrome with the apple script
map R :call ResizeWindow4MP()<CR>
map E :call RecoverWindows()<CR>
"++++++++++++++++++++++++++++++ Self-defining Function ++++++++++++++++++++++++++++++
func ResizeWindow4MP()
	exec "silent ! osascript  ~/.config/AppleScript/resize_windows_V2.scpt"
	exec ":MarkdownPreview"
	" you can use command + tab to change the current focus to item
	" exec "silent ! osascript  ~/.config/AppleScript/reactivate_iTerm.scpt"
endfunc
func RecoverWindows()
	exec "silent ! osascript  ~/.config/AppleScript/recover_window_V2.scpt"
endfunc
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" split the screen, change between window and resize the window
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>
map <LEADER>l <C-w>l
map <LEADER>j <C-w>h
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" some VI/VIM settings
set nocompatible
set backspace=indent,eol,start
"set mouse=a
"set list
let laststatus=2
set scrolloff=5

"++++++++++++++++++++++++++++++ Self-defining Function ++++++++++++++++++++++++++++++
" Add the files header automatically
autocmd BufNewFile *.sh exec ":call SetTitle4sh()"
func SetTitle4sh()
	call setline(1,"#!/bin/bash")
	call append(1," ")
	call append(2, "# Zelong Guo, ".strftime("%d.%m.%Y"))
	call append(3," ")
	normal G
endf
autocmd BufNewFile *.py exec ":call SetTitle4py()"
func SetTitle4py()
	call setline(1,"#!/usr/bin/env python")
	call append(1," ")
	normal G
endf

" Shortcut key for GMT to add some pre-settings: Press F4
map <F4> :call SetSettings4gmt()<CR>
func SetSettings4gmt()
	call append(4, "gmt set MAP_FRAME_PEN 1p")
	call append(5, "gmt set FONT_ANNOT_PRIMARY 8p")
	call append(6, "gmt set FONT_ANNOT_SECONDARY 7p")
	call append(7, "gmt set FONT_LABEL 8p")
	call append(8, "gmt set MAP_TICK_LENGTH 0.1c")
	call append(9, "gmt set MAP_FRAME_TYPE Plain")
	call append(10, "gmt set MAP_ANNOT_OFFSET_PRIMARY 1p")
	call append(11, "gmt set MAP_ANNOT_OFFSET_SECONDARY 1p")
	call append(12, "gmt set MAP_LABEL_OFFSET 1.5p")
	call append(13, "gmt set MAP_ANNOT_OBLIQUE lat_parallel")
	call append(14, " ")
	call append(15, " ")
	call append(16, "gmt begin <++> tif")
	call append(17, " ")
	call append(18, " ")
	call append(19, "gmt end show")
	call append(20, "rm gmt*")
endf

" Quickly Run with One Click and Standard Output to quickfix (with
" asyncrun.vim plugin)
map <F5> :call CompileRunGcc()<CR>
func CompileRunGcc()
	" save the file firstly
	exec 'w'
	if &filetype == 'sh'
		":!time bash %
		:AsyncRun! time bash %
		:copen
	elseif &filetype == 'python'
		exec "AsyncRun! time python %"
		exec "copen"
	elseif &filetype == 'c'
		" -g create debugging information for gdb or lldb
		exec "AsyncRun! gcc -g % -o %<"
		exec "copen"
	elseif &filetype == 'cpp'
		" -g create debugging information for gdb or lldb
		exec "AsyncRun! g++ -g % -o %<"
		exec "copen"
	endif
endfunc


"++++++++++++++++++++++++++++++ Install Plugins +++++++++++++++++++++++++++++++
" to install your plugin, just copy the plugin name from github to the below
" section, and then type:
" PlugInstall
" to uinstall your plug, just comment the below corresponding plug, and then
" delete it under the .vim/plugged directory. 

call plug#begin('$HOME/.config/nvim/plugged')
" Color Scheme
"Plug 'ZelongGuo/nvim-deus'
"Plug 'ZelongGuo/eleline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
"Plug 'rafi/awesome-vim-colorschemes'
"Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
"Plug 'connorholyday/vim-snazzy'
Plug 'xiyaowong/nvim-cursorword' 

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Bookmarks
Plug 'kshenoy/vim-signature'

" A small plugin for standard output to quickfix window
" it's good implemetation for GMT, for Python debugging you can install
" vimspector plugin
Plug 'skywind3000/asyncrun.vim'

" Git
"Plug 'mhinz/vim-signify'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown'}
" then you should run :call mkdp#util#install() to activate the markdownpreview, in case more errors you can find in the github page of markdown-preview.nvim
" Plug 'SirVer/ultisnips',{'for':'markdown'} " Important, in this case, snippets is only valid for markdown
Plug 'SirVer/ultisnips'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
" Plug 'preservim/vim-markdown'
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
"Plug 'vimwiki/vimwiki'

" Editor enhancement
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'

" Debugging, but now turn to lldb ...
"Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --verbose'}

call plug#end()

" ==================== coc.nvim ====================
" If you come across errors with coc-explorer, see the providing error message
let g:coc_global_extensions = [
	\ 'coc-explorer']
"
" Use tab for trigger completion with characters ahead and navigate
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
" Here I use <Tab> and <S-Tab> to navigate
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ <SID>CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <C-t> to trigger completion
inoremap <silent><expr> <C-t> coc#refresh() 

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> <LEADER>h :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap tt :CocCommand explorer<CR>

" "======
" " markdown noremap under insert mode
" " Now the followings have been migrated to markdown.snippets
" "======
" autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
" " Bold text
" autocmd Filetype markdown inoremap <buffer> ,b ****<++><left><left><left><left><left><left>
" " Italic text
" autocmd Filetype markdown inoremap <buffer> ,i **<++><left><left><left><left><left>
" " deleted text
" autocmd Filetype markdown inoremap <buffer> ,d ~~~~<++><left><left><left><left><left><left>
" " link
" autocmd Filetype markdown inoremap <buffer> ,a [](<++>)<++><Esc>F[a
" " pictures
" "autocmd Filetype markdown inoremap <buffer> ,p ![](<++>)<++><Esc>F[a
" autocmd Filetype markdown inoremap <buffer> ,p <div align=center><img src="" width="<++>%" height="auto"></div><++><Esc>Fr3la
" " enter to next line
" "autocmd Filetype markdown inoremap ,p ![](<++>)<++><Esc>F[a
" " Color text
" autocmd Filetype markdown inoremap <buffer> ,c <font size="3"  color="red"></font><++><Esc>F>F>a
" " Background color
" autocmd Filetype markdown inoremap <buffer> ,bc <table><tr><td bgcolor=gray></td></tr></table><++><Esc>Fyla
" " " Mathematical formula
" " autocmd Filetype markdown inoremap <buffer> m<Tab>  $$<++><left><left><left><left><left>
" " autocmd Filetype markdown inoremap <buffer> M<Tab>  $$$$<++><left><left><left><left><left><left>
" " autocmd Filetype markdown inoremap <buffer> f<Tab>  \frac{}{<++>}<Esc>F{F{a


"++++++++++++++++++++++++++++++ Plugins Settings +++++++++++++++++++++++++++++++
"
" ==================== vim-table-mode  ====================" 
map <LEADER>tm :TableModeToggle<CR>

" ==================== nvim-cursorword ====================" 
" Only highlight the word under the cursor
hi default CursorWord cterm=underline gui=underline

" ==================== indentLine ====================
let g:indentLine_char = '┆'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:markdown_syntax_conceal=0


" ==================== airline themes ====================
"let g:airline_theme='papercolor'
"let g:airline_theme='google_light'
let g:airline_theme='sol'

" ====================  vim-colorschemes / awesome-vim-colorschemes ====================
set background=light
"colorscheme solarized8_light_high
"colorscheme Atelier_DuneLight
"colorscheme Atelier_EstuaryLight
colorscheme Atelier_ForestLight
"colorscheme Atelier_PlateauLight
"colorscheme Atelier_SavannaLight
"colorscheme Atelier_SeasideLight
"colorscheme Atelier_SulphurpoolLight
"colorscheme LightTan
"colorscheme LightYellow
"colorscheme OceanicNextLight
"colorscheme flattened_light
"colorscheme habiLight
"colorscheme macvim-light
"colorscheme lightning
"colorscheme lightcolors
" colorscheme rakr-light
"colorscheme seoul256-light
"colorscheme tigrana-256-light


"" ==================== eleline.vim ====================
"let g:eleline_powerline_fonts = 0
"
"" ==================== Dress up my vim ====================
"silent! color deus

"hi NonText ctermfg=gray guifg=gray10
"hi SpecialKey ctermfg=blue guifg=grey70
"hi CursorLine guibg=gray20 ctermbg=black

" ====================  vim-snazzy  ==================== 
"color scheme snazzy


" ==================== Markdown Preview ====================
" More info refer to the webpage of markdown-previer.nvim
" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'light'
" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''


" " ==================== Vim-Markdown  ====================
" let g:vim_markdown_conceal = 0
" " code block
" let g:vim_markdown_conceal_code_block = 0
" " latex formula
" let g:tex_conceal = ""
" let g:vim_markdown_math = 1
" " disable folding
" let g:vim_markdown_folding_disabled = 1
" " apply above to other files
" let g:vim_markdown_auto_extension_ext = 'txt'

" ==================== vim-markdown-toc " ====================
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
let g:vmt_cycle_list_item_markers = 1


" ==================== ultisnips ====================
let g:UltiSnipsExpandTrigger = "<C-q>"
let g:UltiSnipsJumpForwardTrigger = "<C-q>"
let g:UltiSnipsJumpBackwardTrigger = "<C-w>"

" if &filetype ==# 'markdown'
" The folder contains the markdown.snippets, configrations can be refered to: " https://github.com/cold-soda-jay/Markdown-vim
" if you want use Ultisnips, e.g., in zsh, you can create zsh.snippets under the following directory
" refer to: https://github.com/honza/vim-snippets/tree/master/UltiSnips
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/']
let g:UltiSnipsEditSplit="vertical"

" ==================== vimspector ====================
" see theCW for more vimspector settings
"let g:vimspector_enable_mappings = 'HUMAN'



