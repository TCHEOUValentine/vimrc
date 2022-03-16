# Tyzlo's Vim config

![](screenshot.png)

## Included Plugins
I used `Vim-plug` to manage the plugins. 

- [vim-airline](https://github.com/vim-airline/vim-airline): add a status line at the bottom
- [vim-airline-theme](https://github.com/vim-airline/vim-airline-themes): add theme for the airline
- [vim-fugitive](https://github.com/tpope/vim-fugitive): better git commands in vim (quiet commands)
- [nerdtree](https://github.com/preservim/nerdtree): file system explorer
- [nerdcommenter](https://github.com/preservim/nerdcommenter): fast commenting
- [AutoComplPop](https://github.com/vim-scripts/AutoComplPop): automatically open the code completion menu 
- [ultisnips](https://github.com/SirVer/ultisnips): snipets for vim
- [auto-pairs](https://github.com/jiangmiao/auto-pairs): insert or delete brackets, parenthesis and quotes in pair
- [vim-man](https://github.com/vim-utils/vim-man): open man pages in vim

## Included color schemes
- [gruvbox](https://github.com/morhetz/gruvbox)
- [iceberg](https://github.com/cocopon/iceberg.vim)
- [vim-atom-dark](https://github.com/gosukiwi/vim-atom-dark)

## Key Mappings
I set the `Leader key` to `Space`.

`Ctrl+h` go to the left split
```
map <C-h> <C-w>h 
```

`Ctrl+l` go to the right split
```
map <C-l> <C-w>l 
```

`ii` Normal mode from Insert mode faster
```
inoremap ii <Esc>
```

`Ctrl+j` move down current or selected line(s)
```
nnoremap <C-j> :m .+1<CR>
vnoremap <C-j> :m '>+1<CR>gv=gv
```

`Ctrl+k` move up current or selected line(s)
```
nnoremap <C-k> :m .-2<CR>
vnoremap <C-k> :m '<-2<CR>gv=gv
```

`Ctrl+s` save the current file
```
noremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>
```

`Ctrl+f` Toggle NerdTree 
```
nnoremap <C-f> :NERDTreeToggle<CR>
```

## Other cool things I use a lot when I code
`s` in NerdTree, open the selected file in a new split

`:vs` in Normal mode, the current file in a new split (helpful when editing a long file)

`Ctrl+wr` in Normal mode, rotate the split rightward

`Leader+cc` comment the current or selected line(s)

`Leader+cu` uncomment the current or selected line(s)

`<` indent to the left the current or selected line(s)

`>` indent to the right the current or selected line(s)

`Ctrl+p` in code completion menu, select the previous entry

`Ctrl+n` in code completion menu, select the next entry
