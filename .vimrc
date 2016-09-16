" use vim settings rather than Vi settings
set nocompatible

" Pathogen (to load all plugins in the bundle folder)
execute pathogen#infect()

" General config
set number                      " line numbers
set backspace=indent,eol,start  " backspace through everything in insert mode
set showcmd                     " show incomplete commands in the bottom
set showmode                    " show current mode in the bottom
set visualbell                  " no sounds
set autoread                    " reload file changes from outside of vim

" to make vim act like other editors, buffers can exist in the background
set hidden

syntax on
syntax enable

set clipboard=unnamed

" seach settings
set incsearch                   " find the next match as we type
set hlsearch                    " highlight the searches by default
set viminfo='100,f1             " save up to 100 marks

" turn off .swp files
set noswapfile
set nobackup
set nowb

" persistant undo
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smarttab autoindent

" hide gui scroll bars and title bar
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=T

set guifont=Inconsolata:h15

filetype plugin on
filetype indent on

set listchars=tab:›\ ,eol:¬

"set nowrap
set wrap
set linebreak

" folding
set foldmethod=manual       " fold manually
set foldnestmax=3           " deppest fold is level 3
set nofoldenable            " dont fold by default

" completion
set wildmode=list:longest
set wildmenu                " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ " stuff to ignore when tab completing
set wildignore=*vim/backups*
set wildignore=*DS_Store*
set wildignore=*.gem
set wildignore=log/**
set wildignore=tmp/**
set wildignore=*png,*jpg,*.gif

set background=dark
colorscheme solarized

set splitright

" allow syntax and magic chars to be selected
set magic
set encoding=utf-8

" shorcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
set list

map <leader>' :NERDTreeToggle<CR>
map <leader>g :GITGutterToggle<CR>
map <leader>/ <leader>ci

set t_Co=256;
if (!has('nvim'))
  set term=xterm-256color
endif
set termencoding=utf-8

function! Tab(value)
  let &shiftwidth=a:value
  let &softtabstop=a:value
  let &tabstop=a:value
endfunction

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_alaways_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exex = 'tidy5'
let g:syntastic_html_checkers=['html5']
let g:syntastic_scss_checkers=['scss_lint']
let g:syntastic_javascript_checkers = ['standard']
" let g:syntastic_javascript_checkers = ['padded-standard']

let g:jsx_ext_required = 0

" highlight OverLength ctermbg=black ctermfg=white guibg=#073642
highlight OverLength ctermbg=black guibg=#073642
match OverLength /\%81v.\+/

let g:flow#autoclose = 1

if has("gui_running")

  set lines=80
  set columns=150
  set fuopt+=maxhorz

  " save folds
  au BufWinLeave * mkview
  au BufWinEnter * silent loadview

  " add syntax
  au BufNewFile,BufRead *.less set filetype=less
  au BufNewFile,BufRead *.scss set filetype=scss
  au BufNewFile,BufRead *.plist set filetype=xml
  au BufNewFile,BufRead *.md set filetype=markdown
  au BufNewFile,BufRead *.hx set filetype=haxe
  "au BufNewFile,BufRead *.json set filetype=javascript
  au BufNewFile,BufRead *.es6 set filetype=javascript
  au BufNewFile,BufRead *.coffee set filetype=coffee
  au BufNewFile,BufRead *.ts set filetype=typescript
  au BufNewFile,BufRead *.jade set filetype=pug
  au BufNewFile,BufRead *.pug set filetype=pug

  " odd ones
  au BufNewFile,BufRead *.soy set filetype=soy
  au BufNewFile,BufRead *.ftl set filetype=html

  "au BufWritePost *.js :JSHint
  "let g:jshint2_confirm = 0

end

if (has('nvim'))
  tnoremap <Esc> <C-\><C-n>
end
