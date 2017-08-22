autocmd FileType markdown setlocal nolist
autocmd FileType vim setlocal fdm=indent keywordprg=:help
autocmd FileType crontab setlocal backupcopy=yes " necessary for crontab -e to work
