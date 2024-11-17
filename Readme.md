# NeoVim

> Now I have moved to lua script, if you are using vim or just want using vim script, please see another branch. The configuration of vim script may be quite different between lua script.

## tree TODO .....
```bash
~/.config/nvim/
├── Readme.md
├── TODO.md
├── ftplugin   # the filetype info which would be load based on file type
├── init.lua  # nvim confnguration entrance
├── lazy-lock.json # plugins version info
├── lua
│   ├── config
│   │   ├── defaults.lua
│   │   ├── keymaps.lua
│   │   └── lazy.lua
│   ├── plugins  # plugins of lazy.vim
│   │   ├── deprecated
│   │   ├── editor
│   │   ├── lang
│   │   ├── lsp
│   │   └── ui
│   └── utils
├── requirements.txt
├── spell
└── ultisnips
```

## Requirements
- NeoVIM v0.10+, for more please refer to requirements.txt

## Key Binding and Plugins

### Default mappings  
| keys                 | operations                                | mode   |
|----------------------|-------------------------------------------|--------|
| **Cursor Move:**     |                                           |        |
| `i`                  | up                                        | N      |
| `k`                  | down                                      | N      |
| `j`                  | left                                      | N      |
| `l`                  | right                                     | N      |
| `I`                  | 5i                                        | N      |
| `K`                  | 5k                                        | N      |
| `J`                  | 5j                                        | N      |
| `L`                  | 5l                                        | N      |
| `W`                  | jump 5 words backward                     | N      |
| `B`                  | jump 5 words forward                      | N      |
| `<C-i>`              | jump to the top of the current screen     | N      |
| `<C-k>`              | jump to the bottom of the current screen  | N      |
| `<C-m>`              | jump to the middle of the current screen  | N      |
| `<C-j>`              | jump to the beginning of the current line | N      |
| `<C-l>`              | jump to the end of the current line       | N      |
| `f`                  | find backward                             | N      |
| **`F`**              | find forward                              | N      |
| `H`                  | insert from the beginning of the line     | N -> I |
| `A`                  | insert from the end of the line           | N -> I |
| `<C-j>`              | backspace                                 | I      |
| `<C-l>`              | delete                                    | I      |
| ~~**Placeholder:**~~ |                                           |        |
| `<leader><leader>`   | go to next place holder (N)               | N      |
| `,f`                 | go to next place holder (I)               | I      |
| **Highlight:**       |                                           |        |
| `<leader><CR>`       | cancel highlights                         | N      |
| **Others:**          |                                           |        |
| `<jk>`               | back to Normal mode                       | I & V  |
| `S`                  | save current file                         | N      |
| `Q`                  | quit                                      | N      |


### Buffers and tabs management
> More tabs and buffers management see related plugins:
telescope ....

#### Tabs management

| keys        | operations               | keys               | operations     |
|-------------|--------------------------|--------------------|----------------|
| **Default** |                          | **bufferline.vim** |                |
| `tn`        | new **empty** tab        | `t1`               | go to 1st tab  |
| `tN`        | new **duplicated** tab   | `t2`               | go to 2nd tab  |
| `tl`        | move to next tab         | ...                | ....           |
| `tj`        | move to prev tab         | `t9`               | go to 9th tab  |
| `tml`       | move current tab to next | `t <C-l>`          | go to last tab |
| `tmj`       | move current tab to prev | `t <C-j>` = `t1`   | go to 1st tab  |


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

*The nvim startup plugin alpha-vim could could lead you a new buffer to open recent files.*  


