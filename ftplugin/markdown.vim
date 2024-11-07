setlocal shiftwidth=2 softtabstop=2 expandtab smarttab
setlocal colorcolumn=

"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
inoremap <buffer> <c-e> <Esc>/<++><CR>:nohlsearch<CR>"_c4l
inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
inoremap <buffer> ,n ---<Enter><Enter>
inoremap <buffer> ,b **** <++><Esc>F*hi
inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
inoremap <buffer> ,i ** <++><Esc>F*i
inoremap <buffer> ,d `` <++><Esc>F`i
inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
inoremap <buffer> ,m - [ ] 
inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
inoremap <buffer> ,a [](<++>) <++><Esc>F[a
inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
inoremap <buffer> ,l --------<Enter>


"" Auto-completion
"" Auto backspace when typing double parenthesis
"inoremap <buffer> "" ""<++><Esc>4hi
"inoremap <buffer> '' ''<++><Esc>4hi
"inoremap <buffer> () ()<++><Esc>4hi
"inoremap <buffer> {} {}<++><Esc>4hi
"inoremap <buffer> [] []<++><Esc>4hi
"inoremap <buffer> <> <><++><Esc>4hi
"inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
"Press space twice to jump to the next '<++>' and edit it, i.e., place holder
"map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
