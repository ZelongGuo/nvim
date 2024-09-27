
# NeoVim

> Now I have moved to lua script, if you are using vim or just want using vim script, please see another branch. The configuration of vim script may be quite different between lua script.

## tree TODO .....
```bash
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
├── init.lua                   # vim confnguration entrance
├── lazy-lock.json             # plugins version info
└── lua
    ├── config                 # vim config details
    │   ├── defaults.lua       # default set-ups
    │   ├── keymaps.lua        # kwy mappings
    │   └── lazy.lua           # lazy.vim entrance
    ├── plugins                # plugins of lazy.vim
    │   ├── bufferline.lua
    │   ├── colorscheme.lua
    │   ├── statusline.lua
    │   ├── telescope.lua
    │   └── yazi.lua
    └── utils                  # utilities 
        └── functions.lua

```

## Requirmants
- NeoVIM v0.10+, for more please refer to requirements.txt

## Key Binding and Plugins

### Default mappings  
| keys                 | operations                                | Mode   |
|----------------------|-------------------------------------------|--------|
| **Cursor Move:**     |                                           |        |
| `i`                  | up                                        | Normal |
| `k`                  | down                                      | Normal |
| `j`                  | left                                      | Normal |
| `l`                  | right                                     | Normal |
| `I`                  | 5i                                        | Normal |
| `K`                  | 5k                                        | Normal |
| `J`                  | 5j                                        | Normal |
| `L`                  | 5l                                        | Normal |
| `W`                  | jump 5 words backward                     | Normal |
| `B`                  | jump 5 words forward                      | Normal |
| `<C-i>`              | jump to the top of the current screen     | Normal |
| `<C-k>`              | jump to the bottom of the current screen  | Normal |
| `<C-m>`              | jump to the middle of the current screen  | Normal |
| `<C-j>`              | jump to the beginning of the current line | Normal |
| `<C-l>`              | jump to the end of the current line       | Normal |
| `f`                  | find backward                             | Normal |
| **`F`**              | find forward                              | Normal |
| `H`                  | insert from the beginning of the line     | N -> I |
| `A`                  | insert from the end of the line           | N -> I |
| `<C-j>`              | backspace                                 | Insert |
| `<C-l>`              | delete    dfdf dsfdfv                     | Insert |
| ~~**Placeholder:**~~ |                                           |        |
| `<leader><leader>`   | go to next place holder (N)               | Normal |
| `,f`                 | go to next place holder (I)               | Insert |
| **Highlight:**       |                                           |        |
| `<leader><CR>`       | cancel highlights                         | Normal |
| **Others:**          |                                           |        |
| `<jk>`               | back to Normal mode                       | I & V  |
| `S`                  | save current file                         | Normal |
| `Q`                  | quit                                      | Normal |


### Buffers and tabs management
> More tabs and buffers management see related plugins:
telescope ....

#### Tabs management

Default key maps  

| keys  | operations               |
|-------|--------------------------|
| `tn`  | new **empty** tab        |
| `tN`  | new **duplicated** tab   |
| `tl`  | move to next tab         |
| `tj`  | move to prev tab         |
| `tml` | move current tab to next |
| `tmj` | move current tab to prev |

Tabs management in **bufferline.vim**  

| keys             | operations     |
|------------------|----------------|
| `t1`             | go to 1st tab  |
| `t2`             | go to 2nd tab  |
| ...              | ....           |
| `t9`             | go to 9th tab  |
| `t <C-l>`        | go to last tab |
| `t <C-j>` = `t1` | go to 1st tab  |


#### Buffers (windows / panels) management under current tab
Default key maps  

| keys                          | operations                                         |
|-------------------------------|----------------------------------------------------|
| **Create buffers:**           |                                                    |
| `sn`                          | new **empty** buffer (default to right vertically) |
| `si`                          | new **empty** buffer up horizontal                 |
| `sk`                          | new **empty** buffer bottom horizontal             |
| `sj`                          | new **empty** buffer left vertically               |
| `sl`                          | new **empty** buffer right vertically, (=`sn`)     |
| `sI`                          | new **duplicated** buffer up                       |
| `sK`                          | new **duplicated** buffer down                     |
| `sJ`                          | new **duplicated** buffer left                     |
| `sL`                          | new **duplicated** buffer right                    |
| **Move buffers:**             |                                                    |
| `<leader>i`                   | move to up buffer                                  |
| `<leader>k`                   | move to down buffer                                |
| `<leader>j`                   | move to left buffer                                |
| `<leader>l`                   | move to right buffer                               |
| **Switch between buffers:**   |                                                    |
| `sml` (= `smj` = `si` = `sk`) | rotate the buffers                                 |
| **Resize buffers:**           |                                                    |
| `<Up>`                        | resize +5                                          |
| `<Down>`                      | resize +5                                          |
| `<Left>`                      | vertical resize -5                                 |
| `<Right>`                     | vertical resize +5                                 |

> TODO: Setting for toggling between horizontal and vertical buffer views?  

Tabs management in **telescope.vim**  
> Further read of telescope help is needed for getting smoother experiences ...  

Telescope Startup & Searching Set-ups:  
| keys         | operations                                       |
|--------------|--------------------------------------------------|
| `<leader>ff` | find files                                       |
| `<leader>fg` | find characters, `live_grep`                     |
| `<leader>fh` | help pages                                       |
| `<leader>fr` | recent files                                     |
| `<leader>fb` | find buffers                                     |
| `<leader>ft` | find tabs (rely on the telescope-tab dependency) |

Navigation in Insert and Normal Modes:  
| keys             | operations   | keys             | operations                   |
|------------------|--------------|------------------|------------------------------|
| **Insert Mode:** |              | **Normal Mode:** |                              |
| `<C-i>`          | move up      | `i`              | move up                      |
| `<C-j>`          | move left    | `j`              | move left                    |
| `<C-k>`          | move down    | `k`              | move down                    |
| `<C-l>`          | move right   | `l`              | move right                   |
| `<C-c>`          | close        | `<Esc>`          | close                        |
| `<Up>`           | prev history | `gg`             | move to top                  |
| `<Down>`         | next history | `G`              | move to bottom               |
|                  |              | `?`              | keys shortcuts, `which keys` |

Buffers and Tabs Opening Ways:  
| keys      | operations                                                               |
|-----------|--------------------------------------------------------------------------|
| `<CR>`    | open in **current buffer** (may follow `tn`), `select_default`           |
| *`<C-t>`* | *open in a new tab, **(not recommended)***                               |
| *`<C-s>`* | *open in a new vertical buffer under current tab, **(not recommended)*** |

> *Note: here only vertical split supported, using default key maps to toggle buffer views ...*
*`<C-t>` and `<C-s>` are not recommended because it may be better if you use nvim default key maps more ...*

*The nvim startup plugin alpha-vim could could lead you a new buffer to open recent files.**  


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

