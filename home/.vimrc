" Globally applicable settings should be applied here, as well as anything else
" that needs to be loaded before the config files get executed.

" don't try to play nice with vi
set nocompatible

" allow buffers to be hidden when they're not saved
set hidden

" save the last 100 commands/search terms
set history=100

" use ; for <Leader>
let mapleader = ";"    

"" shortmess settings:
" f - use "(3 of 5)" instead of "(file 3 of 5)"
" i - use "[noeol]" instead of "[Incomplete last line]"
" l - use "999L, 888C" instead of "999 lines, 888 characters"
" m - use "[+]" instead of "[Modified]"
" n - use "[New]" instead of "[New File]"
" r - use "[RO]" instead of "[readonly]"
" x - use "[dos]" instead of "[dos format]", "[unix]" instead of "[unix
" format]", and "[mac]" instead of "[mac format]"
" t - truncate file message at the start if it is too long to fit on the
" command-line, "<" will appear in the left most column.
" T - trunctate other messages in the middle if they are too long to fit on
" the command line. "..." will appear in the middle.
" I - don't give the intro message when starting Vim.
set shortmess=atfilmnrxtTI

" turn filetype settings off so that stuff gets loaded from pathogen
filetype off

let xml_tag_completion_map = "<C-l>"
" use pathogen to load plugins/etc.
call pathogen#runtime_append_all_bundles()

" turn on all filetype settings, syntax, etc.
filetype plugin indent on
syntax on

if has('gui_running')
    set guioptions-=T   " Get rid of toolbar "
    set guioptions-=m   " Get rid of menu    "
endif

" load everything else in its own config file
runtime! config/**/*

" Shortcuts for editing Movable Type journal using mtsend.py
" (T)emplate- reads in the template file
map #mtt :0r ~/.config/mtos/empty.html<CR>:set filetype=html<CR>A
" (N)ew- posts new entry
"map #mtn :w !mtsend.py -N<CR>
" (G)et- retrieves latest post, enables HTML syntax highlighting
map #mtG :%!mtsend.py -q -G -<CR>:set filetype=html<CR>
" (g)et- retrieves specified post
map #mtg :%!mtsend.py -q -G
" (E)dit- uploads new revision to latest post
map #mte :w !mtsend.py -E -<CR>
" (R)ebuild- rebuild specified entry
map #mtr :!mtsend.py -R


let g:syntastic_disabled_filetypes = ['perl', 'html']
set wildmode=longest,list:longest,list:full
