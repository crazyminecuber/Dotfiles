"TODO Learn language server for python when learning django.
"DONE Get a better solotion for formatting text in latex or markdwon. Wrap is horrible. More like work/libreoffice
"DONE Make a vim wiki.
"DONE Make tabs look better.
"TODO When i open a file, convert spaces in the beginning to tabs to show them. And when i save the file write them back as spaces
"DONE fix bug with formatoptions not being correctly set on startup
	"Still have not figured out the settings though. Is there a way to filter categorys better? For example, i do not want tables to be reformatted in that way.

"DONE make resizing nicer:
"TODO Add plugin to preview what buttons do.
"TODO Make special search engines for each type of programming. Do so in order to search the documentation! Use openbrowser plugin.
"TODO Find way to make word *bold* and ~curly~ in markdown. I know surround is probably the answer but i have to type things fast in order to make it work.
"DONE Find source of cheat sheets for programming languages.
"TODO Tabsettings change when opening python filTabsettings change when opening python file
"TODO Make nice keybindings for jumping to defintion and tests.
"TODO Find keybinding for jumping to tag in split
"TODO sudo does not work in vim so saving as root does not work with :w!!
"TODO Vim does not automatilly update the contents of the file and does not sync with undotree. Have a clear warning imedially and not when saving that buffer has been updated? See diff between saved file and current buffer? Dynamically update buffer?0
"TODO f,F,t,T only searches current line?
"TODO Use makfile for makng documents and updating figures.
"TODO Use snippets for latex. Nice for \frac and \begin espically
"TODO Maybe use emacs and ORG-mode for making pdf:s? Depends on if tables are nicer.
"TODO Highlighting for one second when yanking would be nice.
"TODO Make my autocommands for number toggleable.
"TODO Would be nice to get errors in quickfixlist from django.
"TODO Look up how to smart rename (using language server) to rename variable in
	"entire project
"TODO CoC 'K' does not work with thing like global and nonlocal in python. Vim
"original does that
"TODO Linter is buggy? Figure out why!
"TODO Autcompletion for html,css, jinja?
"DONE Reload browser automatically?
"TODO Have to write file to have linter update some stuff (i.e. when i have
	 "removed unnasisary whitespace or added an empty line for style
"TODO Nerdtree does not sync across tabs
"DONE Automatically add and format braces when hitting enter.(Autoload to the
"reque!)
"TODO Show matching html tag somehow.
"TODO Checkout synctex in latex
"DONE CSS comments does not work properly. When i try to comment one part, it
	 "cmments the whole line.
	 "But not happy. The ways i would like to comment. A line, multiple lines
	 "with nice formatting, alternative comment markers, comment to the end.
	 "Comment a selected region inside a line (probably not that useful since
	 "it is a bad idea in most circomstances.), should work in both normalmode
	 "and visual mode.
"TODO Change so that search only searched the buffer in fokus.
"TODO Setup ultisnips with a language server to get autocompletion snippets.
"TODO Latex ligatures?
"TODO Image preview?
"TODO Open file in same location as i last cloed it? Or jump to it with
"shortcut?
"TODO Add <leader>fiw to insert wiki page or image in current wiki.

"Regarding autoformatting, it is probably just an anoyance. But autowrapping
"could be nice for booth comments in code and text in md and latex. Probably
"nice to not autowrap lines that are already longer than textwidth. So
"tcqln(jw?) and remove t for programming. w could be questionable for code
"commited to repos since they could care about whitespaces not being at the end.
"I will try without it for now.
" Autoformatting behaviour i want.
" * Autolinebreak on comments and text.
" * Auto-comment if i press shift-enter
" * Fix indenting quickly
" * Maybe quickly toogle autoformatting?
" * Better jump to definition and renaming. Now it did no properly identify what
" was in derived class or in specific class. I do not know where to figure out
" how to get this working.

"TODO Add shortcut to toggle linebreak
"TODO Find better way to add parenthesis. I add way to may on accident now. I
"have installed another plugin and i will se if i find it more intuitive. I will
"try to not down exact situations that bother me.
"TODO Could be a lot better at navigating around the text when inserting at
"sertain places. Doing a lot of hjkl
"TODO Use fzf for opening file in tab and vertical split
"TODO Learn how to commit line by line in git fugative
"TODO Try git rebase vs git merge. Try to do selective commit, where some just
"adds debug outputs and some fixes it and do a git cherrypick and just selct the
"one that fixes the bug.

" Thing that i have could have done more in cpp project Auto formatter More git
" fugative Better lsp integration. A lot worked well but a lot was buggy as
" well, or i do not understand. I fellt that i cannot trust it to rename symbols
" proberly, or it was me who is not understading how to tell it to change the
" symbol of base-class or just inherited class (But that should not really be a
" problem right?, it shoud not be questionable to what one shoul do in each
" situation right?, I think the problem was more that i used it once and it
" renamed thing that should not have been renamed). There also seems to be some
" problems with the way it find definitions of stuff(definition of constructors
" could not be found from h-files and sometimes it jumped to other files. I
" could also not get it to go to deklaration / definiton, it seemed random, wich
" one of the ones it went to.


"TODO Can i serach the edit history? For example if i am missing a line which i know some word in, then i can get that exact line back.

"TODO should learn checking utillities (formatting and compliency) for all languages

"TODO snippets

"TODO Vim wiki: kan man få en varning om man tar bort ett stycke som ett annat stycke länkar till? Så att länkar som inte leder någon vart undviks


"TODO checkout cheat.sh. It is better than google for programming questions and
"integrates nicely with vim. It know what language you are editing based on the
"file and you can type any query you want and can have the answer displayed in a
"buffer or immediattely paste it in. If you use a linter that finds errors, you
"do not even have to type! You can just querry the error immediatelly
" Disable compatibility for vi. No point in not having it
"
"
" TODO This file is a mess. Duplicates of CoC and hexokinase
if exists('g:vscode')
    " VSCode extension
    " ordinary neovim
else

set nocompatible
autocmd!
let mapleader =" "
set textwidth=80
set formatoptions=cqlnjt
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" Scrolling
	nnoremap <C-H> 3zh
	nnoremap <C-L> 3zl
	nnoremap <C-J> 3<C-E>
	nnoremap <C-K> 3<C-Y>


"Någon form ut av script för att kolla om plugins pluginet är installerat
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Live substitution
set inccommand=split
nnoremap Q <Nop>

" Olika plugins vet inte vad alla gör
call plug#begin('~/.config/nvim/plugged')
"colorchemes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasiser/vim-code-dark'
Plug 'rafi/awesome-vim-colorschemes'

" Syntax
Plug 'sirtaj/vim-openscad'

Plug 'bling/vim-airline'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

Plug 'tpope/vim-surround'
"Plug 'tpope/vim-commentary'

Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'

Plug 'junegunn/goyo.vim'
"Plug 'jreybert/vimagit'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'

"Plug 'kovetskiy/sxhkd-vim'
" Open url under cursor. Better than default
Plug 'tyru/open-browser.vim'
" Practice
"Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
" Toggle zoom
"Plug 'beauwilliams/imnotaquitter.vim'

Plug 'troydm/zoomwintab.vim'
" Many languages and fast
Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vista.vim'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-repeat'
"Plug 'jiangmiao/auto-pairs'
Plug 'tmsvg/pear-tree'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
"Plug 'lervag/vimtex'
"Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'Jacotsu/CoVim-Neovim'
Plug 'linluk/vim-c2h'
Plug 'rhysd/vim-clang-format'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'lambdalisue/suda.vim'
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
call plug#end()

"-------------------- Fix annoyances and improve quality of life --------------
" openbrowser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

set noerrorbells
"Allows for mouse controll
set mouse=a
"Combines systemclipboard with vim :D
set clipboard+=unnamedplus


" Something to do with plugins. Probably leave it if I dont know better.
filetype plugin on
"filetype on
" Sets encoding. Any point in using anything else?
	set encoding=utf-8

" Makes windcmd o toggle zoom instead of permanent zoom
nnoremap <leader>wo :ZoomWinTabToggle<CR>

" Makes c not store deleted text in register. Dumps in null register. Dont know if i want it.
nnoremap c "_c

" Enable autocompletion, maybe look further into this?
	set wildmode=longest,list,full
	set wildmenu

"Scrolls when there is only one row left instead of 0
	set scrolloff=1
" Splits open at the bottom and right
	set nosplitbelow splitright

" Auto resize windows when resizing terminal
	autocmd VimResized * wincmd =

" ctrl_a, ctrl_x werks on hexadecimal as well
set nrformats+=alpha
" ignore case when autocompleting in cmd-mode
	set ignorecase

" Case insensitive search until I use capital letter
	set smartcase
" Go to matching during the typing of a search
	set incsearch
" Uses spaces instead of tabs. I will try tabs for a while
set tabstop=4 softtabstop=4
set shiftwidth=4
 set smarttab
" Uncomment if i get tired of seing tabs all over
    set expandtab

" Tries to do smart indent
 set smartindent
 set autoindent

" Does not wrap
	set nowrap

" Sets path to all under path
" Used for using find
set path+=$PWD/**

" Highlightes all matches when searching and stops highliting matches when escape in normal mode is pressed is pressed.
set nohlsearch
nnoremap / :let @/=''<CR>:set hlsearch<CR>/
nnoremap ? :let @/=''<CR>:set hlsearch<CR>?
nnoremap <esc> :nohlsearch<CR>

set hidden
"--------------------------- Whitespace reprecentation ------------------------
" Display symbols instead of whitespace etc
	set list
" Replaces whitespace with symbols. And when there is text to scroll to horizontally.
	"Tabs do not tick out. Would be nice to make it more pronounced and put it to the right side.
	set listchars+=tab:\ \ ┋
	"set listchars+=tab:\ \ 
	"set listchars+=tab:\ \ ┫
	set listchars+=precedes:﮿
	set listchars+=extends:﯀
	set listchars+=eol:﬋
	set listchars+=trail:‿
"‖
"⎸
"⎹
"|
"⏭
"│
"┃
"┃
"❘
"⸡
"｜
"｜
"￨
"│
"│
"┫
"┫
"┋




"------------------------ Smart line numbers----------------------------------
"Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None




"------------------------ Smart line numbers----------------------------------

" Switches between relative line numbers and normal line number.
" Relative line numbers only in normal and visual mode when windows is active.
" The events are before the * and the command to execute is after. Wrapped in
" fucntion in order to make goyu able to enable /disable numbers on the fly.

" Start with number and relative number on
	set number relativenumber

" Function to set correct autocommands for above to work
function! SetSmartNumbers()
	augroup numbers
		autocmd!
		autocmd BufEnter,FocusGained,InsertLeave,WinEnter * set relativenumber
		autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * set norelativenumber
	augroup END
endfunction
" call it imideatelly
call SetSmartNumbers()
" Goyo plugin makes text more readable when writing prose:
	map <leader>G :Goyo \| set norelativenumber<CR>

" Autogrup for goyo to make it able to handly my special line numbers.
augroup goyo
	autocmd! | set nonumber
    autocmd User GoyoLeave call SetSmartNumbers()
    autocmd User GoyoEnter autocmd! numbers | set nonumber norelativenumber
augroup END

"----------------------Color and highlights----------------------------------
" Enable true color
  set termguicolors

" Set colorscheme
	colorscheme gruvbox

 " Highlight syntax
	syntax on
	set colorcolumn=80
	highlight ColorColumn ctermbg=0 guibg=lightgrey
	highlight Cursor guibg=#101010

	set bg=dark
	"highlight Whitespace guibg=grey
	"highlight Whitespace guifg=gray

" Highlighs unchanged text with grey
if &diff
    highlight! link DiffText MatchParen
endif

"-----------------------Windows and related------------------------------------
" Scrolls sidways when 5 columns away from side
	set sidescrolloff=5

"-----------------------Nice shortcuts------------------------------------

" Run code in awesomewm
nnoremap <leader>a :w<cr>:!cat test \| awesome-client <enter>
" Spell-check set to <leader>L for Language
map <leader>L :setlocal spell! spelllang=se<CR>

" Enabels ctrl-s
	imap <C-s> <C-O>:w<CR>
	nmap <C-s> :w<CR>
	vmap <C-s> <C-C>:w<CR>

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	"Highlights file open in buffer in nerdtree.
	map <leader>t :NERDTreeFind<CR><c-w><c-p>

" Shortcutting split navigation, saving a keypress:
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Windowcommand is nicer
nnoremap <leader>w <C-w>
"----------------------- Luke scripts ----------------------------------------

" Quits Vim if nerd tree is only window open
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Replace all is aliased to S. ( Not so nice when using interactive search and
	" replace)
	nnoremap S :%s//gc<Left><Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc. ( Use inbuilt compiler
	" instead and have it jump to errors?)
	nnoremap <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	nnoremap <leader>p :!opout <c-r>%<CR><CR>
	nnoremap <leader>a :w<cr>:!cat test \| awesome-client <enter>
" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e


" Source when vimrc is saved
    autocmd BufWritePost $MYVIMRC echo "vimrc sourced" | source $MYVIMRC



" Scrolls 5 chars when cursor get to edge of screen in horizontal direction
	set sidescroll=5



" EXPERIMENTAL ALTERNATIVE TO SWAPFILE (seems to work pretty well exept for
" when i edit the file externaly, then vim forgets about the changes :( )
	set noswapfile
	set nobackup
	set nowritebackup
	set undodir=~/.config/nvim/undodir
	set undofile


"----------------Undotree mapping -------------------------------------------
nnoremap <leader>u :UndotreeToggle<cr>
" Undotree options https://github.com/mbbill/undotree/blob/master/plugin/undtree.vim#L15
	let g:undotree_WindowLayout = 2
	let g:undotree_ShortIndicators = 1
	let g:undotree_SplitWidth = 30
	let g:undotree_DiffAutoOpen = 1
	let g:undotree_DiffpanelHeight = 7
	let g:undotree_SetFocusWhenToggle = 1
	let g:undotree_TreeNodeShape = '⃝⃝⏺'
	let g:undotree_DiffCommand = "diff"
	let g:undotree_RelativeTimestamp = 1
	let g:undotree_HighlightChangedText = 1
	let g:undotree_HighlightChangedWithSign = 1
	let g:undotree_HighlightSyntaxAdd = "DiffAdd"
	let g:undotree_HighlightSyntaxChange = "DiffChange"
	let g:undotree_HighlightSyntaxDel = "DiffDelete"
"
" FzF-----------------------------------------------------------
" Tips! When searhing for files, entries will be opened in vsplit if you press
" <c-v> or i horizontal split if you press <c-x> or in tabs if you press <c-x>
   let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
   let $FZF_DEFAULT_COMMAND = 'ag -g ""'
	" FZFSearch lines in the current file (open buffers? Have to look it up!)
	noremap <leader>fl <ESC>:BLines<CR>
	" FZFSearch file from the current working directory
	nnoremap <leader>ff <ESC>:Files<CR>
	" FZFSearch commits to the current git repo
	nnoremap <leader>fg <ESC>:BCommits<CR>
	nnoremap <leader>fr <ESC>:History<CR>
	" FZFSearch the first command in command mode. Not the best. Could have
	" some work done to it.
	cnoremap <C-f> Commands<CR>
	" Insert wiki file
	"TODO
	"nnoremap <leader>fiwf


"-------------------------Hexokinase-----------------------------------------
 " Vim Hexokinase
  let g:Hexokinase_refreshEvents = ['InsertLeave']

  let g:Hexokinase_optInPatterns = [
  \     'full_hex',
  \     'triple_hex',
  \     'rgb',
  \     'rgba',
  \     'hsl',
  \     'hsla',
  \     'colour_names'
  \ ]

  let g:Hexokinase_highlighters = ['backgroundfull']

  " Reenable hexokinase on enter
  autocmd VimEnter * HexokinaseTurnOn

" ------------------------------ Web dev -------------------------------------

" reload browser from vim Obs! not generic!
nnoremap <leader>br :!sh ~/Scripts/reload_browser2.sh<CR>

"------------------------------ NERDcommenter--------------------------------
    let g:NERDCustomDelimiters = {
        \ 'python': { 'left': '#', 'leftAlt': '"""', 'rightAlt': '"""' }
    \ }
	let g:NERDSpaceDelims = 1
"------------------------------ Vim which key--------------------------------
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

"------------------------------ Vim wiki --------------------------------
  "let g:vimwiki_list = [{'path': '~/vimwiki/',
                      "\ 'syntax': 'markdown', 'ext': '.wiki'}]
  "let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown':'markdown'}
  let g:vimwiki_ext2syntax = {}
  let g:vimwiki_list = [{
  \ 'path': '$HOME/vimwiki',
  \ 'template_path': '$HOME/vimwiki/template',
  \ 'template_default': 'default',
  \ 'auto_export': 1,
  \ 'template_ext': '.html'}]

"------------------------Pear tree---------------------------------------------
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 0
let g:pear_tree_smart_backspace = 1

"---------Fuction to show diff between saved file and current buffer----------
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

"-------------------------C2H--------------------------------------------------
"nnoremap
"-------------------- Fix annoyances and improve quality of life --------------
" openbrowser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

set noerrorbells
"Allows for mouse controll
set mouse=a
"Combines systemclipboard with vim :D
set clipboard+=unnamedplus


" Something to do with plugins. Probably leave it if I dont know better.
filetype plugin on
"filetype on
" Sets encoding. Any point in using anything else?
	set encoding=utf-8

" Makes windcmd o toggle zoom instead of permanent zoom
nnoremap <leader>wo :ZoomWinTabToggle<CR>

" Makes c not store deleted text in register. Dumps in null register. Dont know if i want it.
nnoremap c "_c

" Enable autocompletion, maybe look further into this?
	set wildmode=longest,list,full
	set wildmenu

"Scrolls when there is only one row left instead of 0
	set scrolloff=1
" Splits open at the bottom and right
	set nosplitbelow splitright

" Auto resize windows when resizing terminal
	autocmd VimResized * wincmd =

" ctrl_a, ctrl_x werks on hexadecimal as well
set nrformats+=alpha
" ignore case when autocompleting in cmd-mode
	set ignorecase

" Case insensitive search until I use capital letter
	set smartcase
" Go to matching during the typing of a search
	set incsearch
" Uses spaces instead of tabs. I will try tabs for a while
set tabstop=4 softtabstop=4
set shiftwidth=4
 set smarttab
" Uncomment if i get tired of seing tabs all over
"    set expandtab

" Tries to do smart indent
 set smartindent
 set autoindent

" Does not wrap
	set nowrap

" Sets path to all under path
" Used for using find
set path+=$PWD/**

" Highlightes all matches when searching and stops highliting matches when escape in normal mode is pressed is pressed.
set nohlsearch
nnoremap / :let @/=''<CR>:set hlsearch<CR>/
nnoremap ? :let @/=''<CR>:set hlsearch<CR>?
nnoremap <esc> :nohlsearch<CR>

set hidden
"--------------------------- Whitespace reprecentation ------------------------
" Display symbols instead of whitespace etc
	set list
" Replaces whitespace with symbols. And when there is text to scroll to horizontally.
	"Tabs do not tick out. Would be nice to make it more pronounced and put it to the right side.
	set listchars+=tab:\ \ ┋
	"set listchars+=tab:\ \ 
	"set listchars+=tab:\ \ ┫
	set listchars+=precedes:﮿
	set listchars+=extends:﯀
	set listchars+=eol:﬋
	set listchars+=trail:‿
"‖
"⎸
"⎹
"|
"⏭
"│
"┃
"┃
"❘
"⸡
"｜
"｜
"￨
"│
"│
"┫
"┫
"┋




"------------------------ Smart line numbers----------------------------------
"Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None




"------------------------ Smart line numbers----------------------------------

" Switches between relative line numbers and normal line number.
" Relative line numbers only in normal and visual mode when windows is active.
" The events are before the * and the command to execute is after. Wrapped in
" fucntion in order to make goyu able to enable /disable numbers on the fly.

" Start with number and relative number on
	set number relativenumber

" Function to set correct autocommands for above to work
function! SetSmartNumbers()
	augroup numbers
		autocmd!
		autocmd BufEnter,FocusGained,InsertLeave,WinEnter * set relativenumber
		autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * set norelativenumber
	augroup END
endfunction
" call it imideatelly
call SetSmartNumbers()
" Goyo plugin makes text more readable when writing prose:
	map <leader>G :Goyo \| set norelativenumber<CR>

" Autogrup for goyo to make it able to handly my special line numbers.
augroup goyo
	autocmd! | set nonumber
    autocmd User GoyoLeave call SetSmartNumbers()
    autocmd User GoyoEnter autocmd! numbers | set nonumber norelativenumber
augroup END

"----------------------Color and highlights----------------------------------
" Enable true color
  set termguicolors

" Set colorscheme
	colorscheme gruvbox

 " Highlight syntax
	syntax on
	set colorcolumn=80
	highlight ColorColumn ctermbg=0 guibg=lightgrey
	highlight Cursor guibg=#101010

	set bg=dark
	"highlight Whitespace guibg=grey
	"highlight Whitespace guifg=gray

" Highlighs unchanged text with grey
if &diff
    highlight! link DiffText MatchParen
endif

"-----------------------Windows and related------------------------------------
" Scrolls sidways when 5 columns away from side
	set sidescrolloff=5

"-----------------------Nice shortcuts------------------------------------
" Spell-check set to <leader>L for Language
map <leader>L :setlocal spell! spelllang=se<CR>

" Enabels ctrl-s
	imap <C-s> <C-O>:w<CR>
	nmap <C-s> :w<CR>
	vmap <C-s> <C-C>:w<CR>

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	"Highlights file open in buffer in nerdtree.
	map <leader>t :NERDTreeFind<CR><c-w><c-p>

" Shortcutting split navigation, saving a keypress:
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Windowcommand is nicer
nnoremap <leader>w <C-w>
"----------------------- Luke scripts ----------------------------------------

" Quits Vim if nerd tree is only window open
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Replace all is aliased to S. ( Not so nice when using interactive search and
	" replace)
	nnoremap S :%s//gc<Left><Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc. ( Use inbuilt compiler
	" instead and have it jump to errors?)
	nnoremap <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	nnoremap <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e


" Source when vimrc is saved
    autocmd BufWritePost $MYVIMRC echo "vimrc sourced" | source $MYVIMRC



" Scrolls 5 chars when cursor get to edge of screen in horizontal direction
	set sidescroll=5



" EXPERIMENTAL ALTERNATIVE TO SWAPFILE (seems to work pretty well exept for
" when i edit the file externaly, then vim forgets about the changes :( )
	set noswapfile
	set nobackup
	set nowritebackup
	set undodir=~/.config/nvim/undodir
	set undofile


"----------------Undotree mapping -------------------------------------------
nnoremap <leader>u :UndotreeToggle<cr>
" Undotree options https://github.com/mbbill/undotree/blob/master/plugin/undtree.vim#L15
	let g:undotree_WindowLayout = 2
	let g:undotree_ShortIndicators = 1
	let g:undotree_SplitWidth = 30
	let g:undotree_DiffAutoOpen = 1
	let g:undotree_DiffpanelHeight = 7
	let g:undotree_SetFocusWhenToggle = 1
	let g:undotree_TreeNodeShape = '⃝⃝⏺'
	let g:undotree_DiffCommand = "diff"
	let g:undotree_RelativeTimestamp = 1
	let g:undotree_HighlightChangedText = 1
	let g:undotree_HighlightChangedWithSign = 1
	let g:undotree_HighlightSyntaxAdd = "DiffAdd"
	let g:undotree_HighlightSyntaxChange = "DiffChange"
	let g:undotree_HighlightSyntaxDel = "DiffDelete"
"
" FzF-----------------------------------------------------------
" Tips! When searhing for files, entries will be opened in vsplit if you press
" <c-v> or i horizontal split if you press <c-x> or in tabs if you press <c-x>
   let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
	" FZFSearch lines in the current file (open buffers? Have to look it up!)
	noremap <leader>fl <ESC>:BLines<CR>
	" FZFSearch file from the current working directory
	nnoremap <leader>ff <ESC>:Files<CR>
	" FZFSearch commits to the current git repo
	nnoremap <leader>fg <ESC>:BCommits<CR>
	" FZFSearch the first command in command mode. Not the best. Could have
	" some work done to it.
	cnoremap <C-f> Commands<CR>
	" Insert wiki file
	"TODO
	"nnoremap <leader>fiwf


"-------------------------Hexokinase-----------------------------------------
 " Vim Hexokinase
  let g:Hexokinase_refreshEvents = ['InsertLeave']

  let g:Hexokinase_optInPatterns = [
  \     'full_hex',
  \     'triple_hex',
  \     'rgb',
  \     'rgba',
  \     'hsl',
  \     'hsla',
  \     'colour_names'
  \ ]

  let g:Hexokinase_highlighters = ['backgroundfull']

  " Reenable hexokinase on enter
  autocmd VimEnter * HexokinaseTurnOn

" ------------------------------ Web dev -------------------------------------

" reload browser from vim Obs! not generic!
nnoremap <leader>br :!sh ~/Scripts/reload_browser2.sh<CR>

"------------------------------ NERDcommenter--------------------------------
    let g:NERDCustomDelimiters = {
        \ 'python': { 'left': '#', 'leftAlt': '"""', 'rightAlt': '"""' }
    \ }
	let g:NERDSpaceDelims = 1
"------------------------------ Vim which key--------------------------------
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

"------------------------------ Vim wiki --------------------------------
  "let g:vimwiki_list = [{'path': '~/vimwiki/',
                      "\ 'syntax': 'markdown', 'ext': '.wiki'}]
  "let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown':'markdown'}
  let g:vimwiki_ext2syntax = {}
  let g:vimwiki_list = [{
  \ 'path': '$HOME/vimwiki',
  \ 'template_path': '$HOME/vimwiki/template',
  \ 'template_default': 'default',
  \ 'auto_export': 1,
  \ 'template_ext': '.html'}]

"------------------------Pear tree---------------------------------------------
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 0
let g:pear_tree_smart_backspace = 1

"---------Fuction to show diff between saved file and current buffer----------
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

"------------------------------------------------------------------------------
"CoC stuff


"Noted on lsp, coc and ale
" ale is mainly a linter and fixer, linter displays errors and things missed in
" formatting. Fixers fix formatting. CoC can be used for code completion and go
" to definition, documentation, locations used. It can show diagnostics,
" whatever that is, and it can go to implementation, call code action on stuff,
" whatever that is. It can also fix stuff

" TextEdit might fail if hidden is not set.
set hidden "already set

" Some servers have issues with backup files, see #649.
set nobackup "already set
set nowritebackup "already set

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  "set signcolumn=number
"else
  set signcolumn=yes
"endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh <Plug>(coc-hover)
" Use K to show documentation in preview window.
nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>
nmap <silent> gh  :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Map function and class text objects (Does this remap the default text object
" in vim as well?
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)




"------------------------------------------------------------------------------
"CoC stuff


"Noted on lsp, coc and ale
" ale is mainly a linter and fixer, linter displays errors and things missed in
" formatting. Fixers fix formatting. CoC can be used for code completion and go
" to definition, documentation, locations used. It can show diagnostics,
" whatever that is, and it can go to implementation, call code action on stuff,
" whatever that is. It can also fix stuff

" TextEdit might fail if hidden is not set.
set hidden "already set

" Some servers have issues with backup files, see #649.
set nobackup "already set
set nowritebackup "already set

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  "set signcolumn=number
"else
  set signcolumn=yes
"endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh <Plug>(coc-hover)
" Use K to show documentation in preview window.
nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>
nmap <silent> gh  :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Map function and class text objects (Does this remap the default text object
" in vim as well?
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


endif
