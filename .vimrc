" Default back to standard shell for vim, since vim doesn't play nicely with fish
if &shell =~# 'fish$'
    set shell=sh
endif

" Automatic installation and setup of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify directory for plugins
call plug#begin('~/.vim/bundle')

" List all vim plugins (ie https://vimawesome.com/)
Plug 'altercation/vim-colors-solarized'
Plug 'sheerun/vim-polyglot'

" Initialize the plugin system
call plug#end()

