let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1

setlocal softtabstop=4
setlocal shiftwidth=4

nmap ,m :ElmMake<cr>

" let g:neomake_elm_elmmake_maker = {
  " \ 'exe': 'elm',
  " \ 'args': ['make --output /dev/null --warn'],
  " \ 'errorformat': '-- %m -+ %f',
  " \ }

" call neocomplete#util#set_default_dictionary(
  " \ 'g:neocomplete#sources#omni#input_patterns',
  " \ 'elm',
  " \ '\.')

" define elm-make maker
let g:neomake_elm_elmmake_maker = {
  \ 'exe': 'elm-make',
  \ 'buffer_output': 1,
  \ 'errorformat':
    \ '%E%.%#--\ %m\ -%# %f' . ',' .
    \ '%C%l\\|' . ',' .
    \ '%C%.%#'
\ }

" enable elm-make on elm
let g:neomake_elm_enabled_makers = [ 'elmmake' ]

" use neomake to build different files
" augroup neomake_neomake_build
  " autocmd! BufRead,BufWritePost *.elm Neomake elmmake
" augroup end
