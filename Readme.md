
# NeoVim

> Now I have moved to lua script, if you are using vim or just want using vim script, please see another branch. The configuration of vim script may be little different between lua script.

## tree TODO .....
```
~/.config/nvim/
├── debug.lua
├── init.lua            neovim配置入口
├── lazy-lock.json        插件版本信息
├── lua
│   ├── autoload/        自己写的自动加载的脚本（插件）
│   ├── helper/            一些工具函数
│   └── plugins            插件目录
│       ├── dap/        调试
│       ├── edit/        编辑类
│       ├── lang/        特定语言类，例如tex, c/cpp, python这样分类
│       ├── lsp/        lsp相关
│       ├── tools/        工具类插件
│       ├── ui/            ui美化类插件
│       └── unused/        暂时不用的插件，不加载
├── my-snippets/        我的代码片段
├── README.md
├── stylua.toml            lua格式化
├── tasks.ini            代码运行全局配置
├── test/                各种乱七八糟的文件，测试效果用的
└── vimrc                基础配置

~/.config/nvim/
|--- jk

```

## Requirmants
- NeoVIM v0.9.2

## Key Binding


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

