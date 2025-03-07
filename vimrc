call plug#begin()
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-sensible'
Plug 'w0rp/ale'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'pandark/42header-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'rust-lang/rust.vim'
Plug 'wagnerf42/vim-clippy'
Plug 'ycm-core/YouCompleteMe'
Plug 'github/copilot.vim'
call plug#end()

filetype detect

let g:termdebug_wide = 1

colorscheme desertEx

set belloff=all
set mouse=a
set cc=80
set list
set listchars=trail:~,extends:>,tab:▸·
set number
set relativenumber
syntax on
set hlsearch
set cursorline
set cursorcolumn

autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set relativenumber
autocmd FileType c setlocal comments=sr:/*,mb:**,ex:*/
autocmd BufRead,BufNewFile *.h,*.c set filetype=c
autocmd CmdLineEnter : set ignorecase
autocmd CmdLineLeave : set noignorecase

filetype plugin indent on

let fts = ['yaml', 'yaml.docker-compose', 'python']
if index(fts, &filetype) == -1
	autocmd Filetype * setlocal sw=4 sts=4 ts=4 noexpandtab
else
	autocmd Filetype yaml setlocal sw=2 sts=2 ts=2 expandtab
	autocmd Filetype yaml.docker-compose setlocal sw=2 sts=2 ts=2 expandtab
	autocmd Filetype python setlocal sw=4 sts=4 ts=4 expandtab
endif

map <C-g> :NERDTreeToggle<CR>
nmap <f1> :FortyTwoHeader<CR>

noremap <Home>				^
vnoremap <Tab>				>
vnoremap <S-Tab>			<
nnoremap <Esc>^[			<Esc>^[
vnoremap <C-c>				"+y

let g:syntastic_mode_map = {
	\"mode": "passive",
	\"active_filetype": [],
	\"passive_filetype": []
\}
nnoremap <C-w>E :SyntasticCheck<CR>

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
let g:ale_c_clang_options='-Wall -Wextra -Wpedantic -Iinclude -Iincludes -Ilibft -Ilibft/includes -I..libft/includes'
let g:ale_c_gcc_options = g:ale_c_clang_options
let g:ale_linter			= { 'c': ['gcc'] }

let g:ycm_autoclose_preview_window_after_insertion = 1
noremap <C-]>				:YcmCompleter GoTo<CR>
