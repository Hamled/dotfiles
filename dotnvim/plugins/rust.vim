call dein#add('rust-lang/rust.vim')
let g:rustfmt_autosave = 1

call dein#add('phildawes/racer')
call dein#add('racer-rust/vim-racer')
let g:racer_cmd = expand('~/.cargo/bin/racer')
let g:racer_experimental_completer = 1
