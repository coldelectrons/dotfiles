version 7.3
set nocompatible

" let Vundle manage Vundle
" required!
syntax off
filetype off " required for vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" other bundles
" code completion and CXX support
"Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
" color themes
Bundle 'tpope/vim-vividchalk'
Bundle 'nanotech/jellybeans.vim'
" major helpers
Bundle 'Lokaltog/vim-easymotion'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'vim-scripts/ZoomWin'
Bundle 'scrooloose/nerdcommenter'
" certain filetypes
Bundle 'jansenm/vim-cmake'
Bundle 'ingydotnet/yaml-vim'
Bundle 'vim-scripts/yaml.vim'
Bundle 'vim-scripts/openscad.vim'
" minor helplers
Bundle 'Raimondi/delimitMate'

syntax on
filetype off " required for vundle
"filetype plugin indent on
filetype plugin on
"set foldmethod=syntax
set clipboard=unnamedplus
let s:cpo_save=&cpo
set cpo&vim
map! <S-Insert> <MiddleMouse>
vmap [% [%m'gv``
vmap ]% ]%m'gv``
vmap a% [%v]%
map <S-Insert> <MiddleMouse>
let &cpo=s:cpo_save
unlet s:cpo_save
set iskeyword+=.
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set softtabstop=4
set background=dark
set backspace=indent,eol,start
set guifont=Monospace\ 12
set helplang=en
set history=50
set mouse=a
set printoptions=paper:a4
set ruler
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set termencoding=utf-8
set viminfo='40,\"80
set window=41
set hlsearch hls
set magic
color vividchalk
autocmd FileType make setlocal noexpandtab

" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
"map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>
" normal mode F5 will do the manual compile/diags with YCM
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" make YCM and Ultisnips compatible
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:UltiSnipsExpandTrigger = '<c-j>'
"let g:UltiSnipsJumpForwardTrigger = '<s-tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
"let g:UltiSnipsListSnippets = '<c-s-j>'
let g:UltiSnipsEditSplit = 'horizontal'

" minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"-------------------------------------------------------------------------------
" taglist.vim : toggle the taglist window
"-------------------------------------------------------------------------------
 noremap <silent> <F11>  <Esc><Esc>:Tlist<CR>
inoremap <silent> <F11>  <Esc><Esc>:Tlist<CR>

" -- optional --
" auto close options when exiting insert mode or moving away
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"set completeopt=menu,menuone

" turn off YCM for certain filetypes
let g:ycm_filetype_specific_completion_to_disable = {} 
let g:ycm_filetype_blacklist = {
     \ 'tagbar' : 1,
     \ 'qf' : 1,
     \ 'notes' : 1,
     \ 'markdown' : 1,
     \ 'md' : 1,
     \ 'unite' : 1,
     \ 'text' : 1,
     \ 'txt' : 1,
     \ 'vimwiki' : 1,
     \}

" turn off the annoying popup
let g:ycm_confirm_extra_conf = 0

" vim: set ft=vim :
