let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1

setlocal softtabstop=4
setlocal shiftwidth=4

nmap ,m :ElmMake<cr>

let g:neomake_elm_elmmake_maker = {
  \ 'exe': 'elm',
  \ 'args': ['make --output /dev/null --warn'],
  \ 'errorformat': '-- %m -+ %f',
  \ }