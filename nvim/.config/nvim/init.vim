""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim-Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
" Python autocompletion and linting
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
" Un-/Comment line with 'gcc'
Plug 'tpope/vim-commentary'
" Powerline like status bar
Plug 'itchyny/lightline.vim'
" Show indentation when indented with spaces
Plug 'Yggdroot/indentLine'
" Colorschemes
Plug 'mennthor/Smyck-Color-Scheme'
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin Setups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable deoplete autocompletion, set tab completion and autoclose preview
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = '<C-n>'
autocmd CompleteDone * pclose!

" Lightline color scheme
let g:lightline = {'colorscheme': 'wombat'}

" Indent guides (space indentation only, for tabs see below)
let g:indent_guides_start_level = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=Black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=DarkGray


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Visual Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
colorscheme smyck

" Color every column greater than 80
highlight ColorColumn ctermbg=Black
let &colorcolumn=join(range(81,999),",")

" Linenumbers
set number


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Key-Remap Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Use tab and shift tab in insert for indent/unindent in insert mode a bol
inoremap <S-Tab> <C-d>

" Cycle completion menu on tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Move line up/down (alt-k, alt-j) and duplicate line (alt-shift-d) [OSX only]
nnoremap ˆ ddkP
nnoremap ı ddp
nnoremap ™ yyp


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Other Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab indentation settings: Tabs with 4 cols; Mark tabs, trail spaces and eol
set list listchars=tab:▸\ ,trail:∙,eol:¬
highlight NonText ctermfg=DarkGrey
highlight SpecialKey ctermfg=DarkGrey
set tabstop=4
set shiftwidth=4
set noexpandtab

" Set no word wrap
set nowrap

" Filename completion
set wildmenu
set wildmode=longest,list

" Centralize backups, swapfiles and undo history in temp folder
set backupdir=~/.local/tmp
set directory=~/.local/tmp
if exists("&undodir")
        set undodir=~/.local/mp
endif

" No error bells
set noerrorbells


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Custom Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Strip trailing whitespace (call with \ss)
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
