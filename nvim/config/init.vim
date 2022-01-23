" General indent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Start plugins
call plug#begin('~/.vim/plugged')

" Wrap
set nowrap
nnoremap <F4> :set wrap!<CR>

" Fold
set foldmethod=syntax
set foldlevel=1
" Fold with the spacebar
nnoremap <space> za
" zm fold level
" zM fold all levels
" zr unfold level
" zR unfold all levels
Plug 'tmhedberg/SimpylFold'

" Colourscheme
Plug 'flazz/vim-colorschemes'
if &diff
    " Vimdiff highlight
    " hi DiffAdd cterm=none ctermfg=White ctermbg=Red gui=none guifg=White guibg=Red
    " hi DiffDelete cterm=none ctermfg=White ctermbg=Red gui=none guifg=White guibg=Red
    " hi DiffText cterm=none ctermfg=White ctermbg=Red gui=none guifg=White guibg=Red
    " " The diff line highlight
    " hi DiffChange cterm=none ctermfg=Black ctermbg=White gui=none guifg=Black guibg=White
    " " Vim highlight
    " hi Visual term=reverse cterm=reverse
    colorscheme tender
else
    colorscheme molokai
endif
" Plug 'drewtempelmeyer/palenight.vim'
" set background=dark
" colorscheme palenight

" Git
Plug 'mhinz/vim-signify'
nnoremap <LocalLeader>gV :Gvsplit<CR>
nnoremap <LocalLeader>gv :Gvdiffsplit!<CR>
" Take the left pane
nnoremap <LocalLeader>gvc :diffget //2<CR>
" Take the right pane
nnoremap <LocalLeader>gvb :diffget //3<CR>
Plug 'tpope/vim-fugitive'

" Finding
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
map ; :Files<CR>
map <LocalLeader>; :Rg<CR>

" Comment
" gc in visual to toggle
Plug 'tomtom/tcomment_vim'

" Python Virtualenv
Plug 'jmcantrell/vim-virtualenv'

" OpenSCAD
Plug 'sirtaj/vim-openscad'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Indent
Plug 'Vimjas/vim-python-pep8-indent'

" JSON
Plug 'elzr/vim-json'
" Disable fancy concealing of attribute quotes.
let g:vim_json_syntax_conceal = 0

" Markdown
" mdr downloadable from https://github.com/MichaelMure/mdr/releases/
let g:preview_markdown_auto_update = 1
Plug 'skanehira/preview-markdown.vim'

" Terraform
autocmd FileType terraform noremap <buffer> <LocalLeader>= :TerraformFmt<CR>
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
let g:terraform_completion_keys = 1
let g:terraform_registry_module_completion = 0

" VCL
let g:vcl_fold = 1
Plug 'fgsch/vim-varnish'

" Unimpaired
" [l and ]l to nav errors
Plug 'tpope/vim-unimpaired'

" Initialize plugin system
call plug#end()

" Development file settings
" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=180 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
" JavaScript
au BufNewFile,BufRead *.js
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=180 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
" TypeScript
au BufNewFile,BufRead *.ts
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=180 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
" Varnish Configuration Language
au BufNewFile,BufRead *.vcl
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=180 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Browser file settings
au BufNewFile,BufRead *.html
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=180 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
au BufNewFile,BufRead *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=180 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" JSON file settings
au BufNewFile,BufRead *.json
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set filetype=json |
    \ set textwidth=180 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" UTF-8 support
set encoding=utf-8

" Syntax
let python_highlight_all=1
syntax on

" Line numbers
" set nu

" Highlight search
" * search on word
set hlsearch

" System clipboard
set clipboard=unnamed

" Status Bar in single window. 0=never, 1=only with two windows, 2=always
set laststatus=2

" Be able to write the crontab
autocmd FileType crontab setlocal bkc=yes

" Mouse
set mouse=a
" set mouse=v " Mac
set mousefocus

" Enable the cursorline
set cursorline
hi CursorLine ctermbg=234
" https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg

" Parenthesis
hi MatchParen cterm=none ctermbg=green ctermfg=black

" Tabs
nmap <C-h> :tabnew<CR>
nmap <C-l> :tabclose<CR>
nmap <C-j> :tabnext<CR>
nmap <C-k> :tabprevious<CR>

" Spelling
autocmd BufReadPost,BufNewFile *.md,*.txt set spell spelllang=en_gb

" Keyword help
" K
autocmd BufNewFile,BufRead *.py set keywordprg=pydoc3

" Bell
set belloff=all

" Whitespace removal
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.json :%s/\s\+$//e
autocmd BufWritePre *.md :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.tf :%s/\s\+$//e
autocmd BufWritePre *.ts :%s/\s\+$//e

" Clipboard
" Yanking in the WSL
let s:clip = '/mnt/c/Windows/system32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
end

" Navigation
" ``      = ping pong
"
" [[      = previous def / class
" ]]      = next def / class
"
" Shift+[ = previous paragraph
" Shift+] = next paragraph

" Folds
" zm increases foldlevel by one
" zM closes all open folds
" zr decreases foldlevel by one
" zR opens all closed folds

" Highlight
" * highlight and go to next occurrance of word cursor is on
" # highlight and go to previous occurrance of word cursor is on
" Allow use of shift and arrow for highlight
set keymodel=startsel

" Spelling
" set spell spelllang=en_gb
" [s ]s move between misspellings
" z= to get alternatives
" zg to add word to personal dictionary

" Debug Pdb
" \r = run
" \b = breakpoint
" next
" step
" continue

" Terminal
" :ter

" Fuzzy file search
" ;

" Colour overrides
" Generally making things a little darker
hi Normal ctermbg=232
hi SignColumn ctermbg=233
hi CursorLine ctermbg=233 

" Cursor for different modes
if &term =~ "xterm\\|rxvt"
    " use an orange cursor in insert mode
    let &t_SI = "\<Esc>]12;blue\x7"
    " use a red cursor otherwise
    let &t_EI = "\<Esc>]12;red\x7"
    " reset cursor when vim exits
    autocmd VimLeave * let &t_me="\<Esc>]12;magenta\x7"
endif

" -----------------------------------------------------------------------------
" Lua plugins
lua require('plugins')

lua << END
	require('lualine').setup{
		options = { theme = 'powerline' }
	}
END
