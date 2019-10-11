call plug#begin()
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'pandark/42header.vim'
Plug 'maralla/completor.vim'
call plug#end()
packadd termdebug
let g:termdebug_wide = 1

colorscheme Monokai
let g:airline_thme='badwolf'
set background=dark

if !exists('g:airline_symbols')
	let g:airline_symboles = {}
endif
let g:airline_symboles.maxlinenr = 'lr'

set mouse=a
set cc=80
set list
set listchars=trail:~,extends:>,tab:▸·
set number
autocmd InsertEnter * :set relativenumber nonumber
autocmd InsertLeave * :set number norelativenumber
autocmd FileType c setlocal comments=sr:/*,mb:**,ex:*/
autocmd BufRead,BufNewFile *.h,*.c set filetype=c
setlocal sw=4 sts=4 ts=4 noexpandtab
map <C-g> :NERDTreeToggle<CR>
nmap <f1> :FortyTwoHeader<CR>
vnoremap <Tab>		>
vnoremap <S-Tab>	<
