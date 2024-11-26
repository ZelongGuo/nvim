" /opt/homebrew/opt/neovim/share/nvim/runtime/ftplugin
" /Users/zelong/.local/share/nvim/lazy/vimtex/ftplugin/tex.vim
"
setlocal colorcolumn=

" setting indentation
setlocal expandtab
setlocal autoindent
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

let g:tex_flavor = 'latex'  " recognize tex files as latex

" Spell
setlocal spell
setlocal spelllang=en_us
"setlocal spellfile=~/.vim/spell/en.utf-8.add
"setlocal spellfile+=~/books/practical_vim/jargon.utf-8.add

" TODO: setting different folding strategy
"

