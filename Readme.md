
# NeoVim

> Now I have moved to lua script, if you are using vim or just want using vim script, please see another branch. The configuration of vim script may be quite different between lua script.

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
├── Readme.md
├── init.lua
├── lazy-lock.json
└── lua
    ├── config
    │   ├── defaults.lua
    │   ├── keymaps.lua
    │   └── lazy.lua
    ├── plugins
    │   ├── bufferline.lua
    │   ├── colorscheme.lua
    │   ├── statusline.lua
    │   ├── telescope.lua
    │   └── yazi.lua
    └── utils
        └── functions.lua

```

## Requirmants
- NeoVIM v0.10+

## Key Binding and Plugins

### Buffers and tabs management
> More tabs and buffers management see related plugins:
telescope ....

| keys | operations |
|------|------------|
| `tn` | new tab    |

> TODO: setting for toggling between horizontal and vertical buffer views ...

### **TELESCOPE**
> Further read of telescope help is needed for getting smoother experiences ...

#### Telescope Startup & Searching Set-ups:
| keys        | operations                                       |
|-------------|--------------------------------------------------|
| `leader ff` | find files                                       |
| `leader fg` | find characters, `live_grep`                     |
| `leader fh` | help pages                                       |
| `leader fb` | find buffers                                     |
| `leader ft` | find tabs (rely on the telescope-tab dependency) |

#### Navigation in Insert and Normal Modes:
| keys            | operations                   |
|-----------------|------------------------------|
| **Insert Mode** |                              |
| `UP`            | prev history                 |
| `DOWN`          | next history                 |
| `C-i`           | move up                      |
| `C-k`           | move down                    |
| `C-j`           | move left                    |
| `C-l`           | move right                   |
| `C-t`           | open in a new tab            |
| `C-c`           | close                        |
| **Normal Mode** |                              |
| `i`             | move up                      |
| `k`             | move down                    |
| `j`             | move left                    |
| `l`             | move right                   |
| `gg`            | move to top                  |
| `G`             | move to bottom               |
| `C-t`           | open in a new tab            |
| `ESC`           | close                        |
| `?`             | keys shortcuts, `which keys` |

#### Buffers and Tabs Opening Ways:
| keys    | operations                                                     |
|---------|----------------------------------------------------------------|
| `CR`    | open in **current buffer** (may follow `tn`), `select_default` |
| *`C-t`* | *open in a new tab*                                            |
| *`C-s`* | *open in a new vertical buffer under current tab*              |

> *Note: here only vertical split supported, using default key maps to toggle buffer views ...*
*`C-t` and `C-s` are not recomandded because  it may be better if you use nvim default key maps more ...*


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

