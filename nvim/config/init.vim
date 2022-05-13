" Required
set nocompatible
filetype off

" Clipboard
" Tell Neovim to use system clipboard
set clipboard=unnamedplus

" General indent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
"
" Cursor
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=i:block-Cursor-blinkwait0-blinkon500-blinkoff500

" Start plugins
call plug#begin('~/.vim/plugged')

" Wrap
let &showbreak = '↪ '
set nowrap
nnoremap <F4> :set wrap!<CR>

" Whitespace
let &listchars='space:·,tab:▸ ,trail:~'
set nolist
nnoremap <F5> :set list!<CR>

" Colourscheme
Plug 'flazz/vim-colorschemes'
if &diff
    colorscheme tender
else
    colorscheme molokai
endif

" Git
" Plug 'mhinz/vim-signify'
nnoremap <LocalLeader>gV :Gvsplit<CR>
nnoremap <LocalLeader>gv :Gvdiffsplit!<CR>
" Take the left pane
nnoremap <LocalLeader>gvc :diffget //2<CR>
" Take the right pane
nnoremap <LocalLeader>gvb :diffget //3<CR>
Plug 'tpope/vim-fugitive'

" Find
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
" swap down / up with c-j / c-k
let g:Lf_CommandMap = {'<Down>': ['<C-J>'], '<Up>': ['<C-K>'], '<C-J>': ['<Down>'], '<C-K>': ['<Up>']}
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
map ; :Leaderf file<CR>
map <LocalLeader>; :Leaderf rg<CR>

" Comment
" gc in visual to toggle
Plug 'tomtom/tcomment_vim'

" Python Virtualenv
Plug 'jmcantrell/vim-virtualenv'

" Python Format
autocmd FileType python noremap <buffer> <LocalLeader>= :call Autopep8()<CR>
let g:autopep8_diff_type='vertical'
let g:autopep8_max_line_length=180
Plug 'tell-k/vim-autopep8'

" Python Docstring
nmap <LocalLeader>l <Plug>(pydocstring)
let g:pydocstring_doq_path = '/home/spindicator/.local/bin/doq'
Plug 'heavenshell/vim-pydocstring'
" Plug 'yaegassy/coc-pydocstring', {'do': 'yarn install --frozen-lockfile'}

" Completion, Lint, Refactor
function! SplitIfNotOpen(...)
    let fname = a:1
    let call = ''
    if a:0 == 2
	let fname = a:2
	let call = a:1
    endif
    let bufnum=bufnr(expand(fname))
    let winnum=bufwinnr(bufnum)
    if winnum != -1
	" Jump to existing split
	exe winnum . "wincmd w"
    else
	" Make new split as usual
	exe "vsplit " . fname
    endif
    " Execute the cursor movement command
    exe call
endfunction
command! -nargs=+ CocSplitIfNotOpen :call SplitIfNotOpen(<f-args>)
nmap <LocalLeader>d <Plug>(coc-definition)
nmap <LocalLeader>n <Plug>(coc-references)
nmap <LocalLeader>r <Plug>(coc-rename)
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" File explorer
" https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_localcopydircmd = 'cp -r'
hi! link netrwMarkFile Search
map <F7> :Lexplore<CR>

" OpenSCAD
Plug 'sirtaj/vim-openscad'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Fold
set foldmethod=syntax
set foldlevel=3
" Fold with the spacebar
nnoremap <space> za
Plug 'tmhedberg/SimpylFold'

" Indent
" Plug 'Vimjas/vim-python-pep8-indent'

" JSON
" Disable fancy concealing of attribute quotes.
let g:vim_json_syntax_conceal = 0
Plug 'elzr/vim-json', { 'for': 'json' }

" JSON Format
autocmd FileType json noremap <buffer> <LocalLeader>= :%!python3 -c "import json, sys, collections; print(json.dumps(json.loads(sys.stdin.read(), object_pairs_hook=collections.OrderedDict), indent=2))"<CR>

" Markdown
" mdr downloadable from https://github.com/MichaelMure/mdr/releases/
let g:preview_markdown_auto_update = 1
Plug 'skanehira/preview-markdown.vim', { 'for': 'markdown' }

" Terraform
autocmd FileType terraform noremap <buffer> <LocalLeader>= :TerraformFmt<CR>
Plug 'hashivim/vim-terraform', { 'for': ['terraform', 'tf'] }
Plug 'juliosueiras/vim-terraform-completion', { 'for': ['terraform', 'tf'] }
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

" Crontab write
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
set spellsuggest=best,9
set spellfile=~/.vim/spell/en.utf-8.add

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

" set completeopt-=preview
" autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Navigation
" ``      = ping pong
"
" %       = matching brace
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

" Fuzzy search
" ; = file
" \; = rg

" -----------------------------------------------------------------------------
" Lua 
lua << END
  require('plugins')

  --- require'lspconfig'.pylsp.setup{}

	require('lualine').setup{
		options = { theme = 'powerline' }
	}
  require('gitsigns').setup()
END
