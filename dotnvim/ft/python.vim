autocmd FileType python setlocal foldmethod=indent
autocmd FileType python nnoremap <Leader>8 :PyLint<CR>
autocmd BufNewFile,BufRead *.bfg setlocal filetype=python
