augroup reload_browser
	autocmd!
	autocmd BufWritePost * !sh ~/Scripts/reload_browser2.sh
augroup END
