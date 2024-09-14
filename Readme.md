# Nvim
> Zelong Guo, @ GFZ, Potsdam  
2024-04-20 13:23  

> update: 2023-05-10 19:50  

### Installation

Open `init.vim` with `(neo)Vim`, then:  
```vim
:PlugInstall
```

### Notes about mapping of vimrc and Ultisnips

Mapping in vimrc:
We cancle the settings place holder and complete (), [] and {} etc in Ultisnips (all.snippets):

```vim
" this part is selected from init.vim

" =======================
" only the 'jk' keeped
" Insert mode return Esc
" Visural mode need Esc or ctrl+c
inoremap jk <Esc>


" =======================
" the followings are removed to all.snippets, and we also cancle the place holder
" Auto-completion
" Auto backspace when typing double parenthesis
" inoremap "" ""<++><Esc>4hi
" inoremap '' ''<++><Esc>4hi
" inoremap () ()<++><Esc>4hi
" inoremap {} {}<++><Esc>4hi
" inoremap [] []<++><Esc>4hi
" inoremap <> <><++><Esc>4hi
" inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
" Press space twice to jump to the next '<++>' and edit it, i.e., place holder
" map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
```

**Todo**: Color settings with Latex formula ...

