"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                " Disable compatibility with vi
filetype on                     " Auto detect fieltype
filetype plugin on              " Enable & load plugin for detected filtype
filetype indent on              " Auto indent for detected filtype
syntax on                       " Syntax highlight
set nu relativenumber           " Set line number
set tabstop=4 softtabstop=4     " Tab = indent 4 columns
set expandtab                   " Use space instead of tab
set nobackup                    " Do not auto save backups
set wrap                        " Wrap lines
set incsearch                   " Highlight during search
set ignorecase                  " No case sensitive search
set smartcase                   " Case sensitive when type capital letters
set noshowmode                  " Do not show vim mode
set showmatch                   " Show matching words during search
set nohlsearch                  " No highlighting words after search
set wildmenu                    " Auto complete with tab
set exrc                        " Custom vimrc inside that folder
set guicursor=                  " Cursor as a block, not thin line
set hidden                      " A buffer becomes hiddens when abandonned
set noerrorbells                " Silent
set noswapfile                  " No swap
set nobackup                    " No backups
set scrolloff=8                 " Star scroll the screen 8 lines before
set signcolumn=yes              " An extra column for messages
set colorcolumn=80              " Warning at column 86 if I go too far
set t_Co=256                    " Set term colours, if supported
set background=dark             " Background to dark
" PLUGINS ------------------------------------------------------- {{{
    call plug#begin('~/.vim/plugged')
        Plug 'itchyny/lightline.vim'                    " Statusline/tabline 
        Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}                                          " Instant markdown

        Plug 'frazrepo/vim-rainbow'                     " Parenthese colours
        Plug 'ap/vim-css-color'                         " Colour review for css
        Plug 'junegunn/limelight.vim'                   " Block light focus
        Plug 'junegunn/vim-emoji'                       " Emojis, bc why not
"       Plug 'romgrk/doom-one.vim'                      " Doom-one theme
        call plug#end()
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'""
" lightline.vim theme
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
set laststatus=2                " Always show statusline            

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Instant-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_autostart = 0         " Turns off auto preview
let g:instant_markdown_browser = "surf"      " Uses surf for preview
map <Leader>md :InstantMarkdownPreview<CR>   " Previews .md file
map <Leader>ms :InstantMarkdownStop<CR>      " Kills the preview


