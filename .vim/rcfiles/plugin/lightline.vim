if neobundle#is_installed("lightline.vim")
    " show always
    set laststatus=2
	let g:lightline = {
		\ 'colorscheme': 'wombat',
		\ }
endif
