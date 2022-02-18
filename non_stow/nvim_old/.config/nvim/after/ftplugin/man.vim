" Fancy stuff for man pages
	 nnoremap <buffer> gO :call man#show_toc()<CR>:wincmd L<CR>:setlocal laststatus=0 nonumber norelativenumber<CR>:exe 'vertical resize ' . (winwidth(0) * 1 / 2)<CR>
	 cnoreabbrev q qa!
