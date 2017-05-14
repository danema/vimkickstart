" -------------------------
"  VIM template by @danema
" -------------------------

" User interface
  set background=dark
  let g:solarized_termcolors=256
  let g:solarized_termtrans = 0
  set guifont=Menlo\ Regular:h20

" Window navigation
  map <Esc>[1;3A :wincmd k<CR>
  map <Esc>[1;3B :wincmd j<CR>
  map <Esc>[1;3D :wincmd h<CR>
  map <Esc>[1;3C :wincmd l<CR>

" NERDTree
  let g:NERDTreeMapOpenInTab='<Enter>'
  let NERDTreeShowHidden=1
  map <C-n> :NERDTreeTabsToggle<CR>
  autocmd BufWritePost * call NERDTreeFocus() | call g:NERDTree.ForCurrentTab().getRoot().refresh() | call g:NERDTree.ForCurrentTab().render() | wincmd w

" Support Mouse-scroll & Better File navigation
  set mouse=nicr
  set nocompatible
  set whichwrap+=<,>,[,]
  set backspace=indent,eol,start

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

" Syntastic
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 1
  let g:syntastic_enable_balloons = 1

  autocmd BufWritePost * :SyntasticCheck

" Solarized
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

" On save auto-create the enclosing folder if it doesn't already exist
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

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
    Plugin 'trotter/autojump.vim'

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
    Plugin 'scrooloose/syntastic'

  " In-Vim Shell
    Plugin 'Conque-Shell'
    Plugin 'shougo/vimshell.vim'
    Plugin 'shougo/vimproc.vim'

  " Script Library
    Plugin 'L9'
    Plugin 'Improved-AnsiEsc'

  call vundle#end()
