Tips:
- Use the telescope help tags (leader + fh) for searching all helps!!! Very useful!

-------------------------------------------------------------------------------------------------------------------------------------------------------

TODO:

- *nvim-tree key mappings*

- lsp: jump, go to definition etc ..., mason  

- nvim-cmp: automatic completion  
- tree sitter : highlight  

- Ultisnipist!  

- complete ftplugin/, add more file types ...

- update the readme file, refer to the nice boy ...  

- when using <leader>fh to look for help page, sometimes still come across the opened help page would create a new buffer under the current buffer, rather than overwrite the current buffer...  

- read the help page of vim ... Looking through all of them ...  
- More actions about telescope.vim, like LSP to find some specific functions in the file? And also other functionalities please watch the videos on online platforms ...  

- telescope cannot find file, e.g, when we are editing the init.lua within neovim, and we cannot find and open the telescope.lua using telescope, there must be something went wrong ...  
  Updated: now could search files within git root driectory, if it's not git repository, then search from current cwd. Maybe added: also search from other directories? Using the vim-rooter plugins? Expand more directories?   
  Updated: Now you can use <leader>fr to open recent files. But it still cannot work if we wanna edit my github.io repository for example, can we expand the searching directory?  

-- comment and comment box

-------------------------------------------------------------------------------------------------------------------------------------------------------

Solved partially:  
- when you are searching and trying to open a new file with telescope, how to make it a default behaviour to opening it with a new tab  
  Updated: Now have solved. But when the tab's name is [No Name], what could we do to open the file with current tab?  

-------------------------------------------------------------------------------------------------------------------------------------------------------

Pending:  
- automatic toggle horizontal and vertical windows (buffers)?
- using leader and b/w to split the windows (buffers) within vim? And also tab leader t? (for tabs which is often used so it's may not a good idea ...)


-------------------------------------------------------------------------------------------------------------------------------------------------------

Solved:
- buffer and tab, especially how to switch between tabs ...  
  Update: with defaults keymaps and bufferline plugin

- how to switch the tabs within nvim, tab-bufferline plugins ???  
  Update: Done

- add fast jump to a tab when there are many tabs ... Using a plugin like bufferline? Add the number is a good option, you may using telescope at the 2nd tab and the new tab is 5th because you already opened 4 tabs ...  
  Update: Done

- !!! Sometimes you use telescope <leader>fh to find the help page, and you may wanna open the help page at another window (buffer) under the same tab rather than a new tab, how to do this?  -- actions.select_vertical, actions.select_horizontal etc ...  
  Update: Done, we solved this by setting some default maps within nvim rather than by telescope action.

- change the wait time for combination mapping, e.g, jk under the visual mode? I think it's the same problem if we use the b/w + other key as a combination to split windows and buffers ...  
  Updated: NO, MAYBE we stick with using s for windows because b/w are all often used ...

- about the alpha-vim
  - check https://github.com/AdamWhittingham/vim-config to add recent links or files
  - add how many plugins already started?
  - make the display to the left?
  Update: All done.


