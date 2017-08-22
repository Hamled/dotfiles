augroup TypescriptLinter
  autocmd FileType typescript
        \ autocmd! BufWritePost <buffer> Neomake
augroup END
