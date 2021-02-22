setlocal formatoptions+=n
setlocal list
map <Leader>mp :!markdown % > %.html && open %.html && sleep 1 && rm %.html<CR><CR>
