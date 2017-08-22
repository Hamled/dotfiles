""" Core setup """
runtime util.vim
runtime general.vim
runtime plugins.vim
runtime mappings.vim " Set our mappings after all plugins

""" Plugin & other configuration """
colorscheme molokai

" Filetype configs
runtime ft.vim
runtime ft/python.vim
runtime ft/css.vim
runtime ft/typescript.vim

" Airline config
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '¦'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Startify config
let g:startify_session_dir = util#get_cache_dir('sessions')
let g:startify_change_to_vcs_root = 1
let g:startify_show_sessions = 1
call util#ensure_exists(g:startify_session_dir)

" Other configs
let g:deoplete#enable_at_startup = 1

" If we have local configuration, use it
if !empty(filter(split(&rtp, ','), 'filereadable(v:val . "/local.vim")'))
  runtime local.vim
endif
