" -------------------------
"  VIM template by @danema
" ------------------------- 

" User interface
  set background=dark
  let g:solarized_termcolors=256
  let g:solarized_termtrans = 0
  set guifont=Menlo\ Regular:h20

  if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
    \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
    " Use the guicolorscheme plugin to makes 256-color or 88-color
    " terminal use GUI colors rather than cterm colors.
    runtime! plugin/guicolorscheme.vim
    GuiColorScheme solarized
  else
    " For 8-color 16-color terminals or for gvim, just use the
    " regular :colorscheme command.
    colorscheme solarized
  endif

" Window navigation
  map <Esc>[1;3A :wincmd k<CR>
  map <Esc>[1;3B :wincmd j<CR>
  map <Esc>[1;3D :wincmd h<CR>
  map <Esc>[1;3C :wincmd l<CR>

" NERDTree
  let g:NERDTreeMapOpenInTab='<Enter>'
  map <C-n> :NERDTreeTabsToggle<CR>

" Support Mouse-scroll
  set mouse=nicr

" Syntax highlighting & indentation
  syntax enable
  filetype plugin indent on
  set expandtab
  set tabstop=2 shiftwidth=2 softtabstop=2
  set autoindent

" Linenumbers
  set number
  set updatetime=250

" Silver Searcher
  if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0

    if !exists(":Ag")
      command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
      nnoremap \ :Ag<SPACE>
    endif
  endif

" Code completion
  let g:EclimCompletionMethod = 'omnifunc'
  "autocmd FileType ruby,eruby let g:EclimCompletionMethod = 'omnifunc'
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType java setlocal omnifunc=javacomplete#Complete

  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_include_object = 1
  autocmd FileType ruby,eruby let g:rubycomplete_include_objectspace = 1
  let g:ycm_seed_identifiers_with_syntax = 1

" Vundle
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'

  " Colorscheme
    Plugin 'guicolorscheme.vim'
    Plugin 'godlygeek/csapprox'

  " NERDTree
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    Plugin 'scrooloose/nerdtree'
    Plugin 'jistr/vim-nerdtree-tabs'
  
  " Navigation
    Plugin 'wincent/command-t'
    Plugin 'ctrlp.vim' 

  " Programming support
    Plugin 'vim-ruby/vim-ruby'
    Plugin 'tpope/vim-rails'
    Plugin 'mattn/emmet-vim'
    Plugin 'rubycomplete.vim'
    Plugin 'artur-shaik/vim-javacomplete2'
    Plugin 'valloric/youcompleteme'
    Plugin 'ervandew/eclim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

  " In-Vim Shell
    Plugin 'Conque-Shell' 
    Plugin 'shougo/vimshell.vim'
    Plugin 'shougo/vimproc.vim'

  " Script Library
    Plugin 'L9'
    Plugin 'Improved-AnsiEsc'
 
  call vundle#end()
