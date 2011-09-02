setlocal formatoptions+=n
setlocal comments=n:&gt;
setlocal listchars=tab:»·,trail:·
setlocal list
map <Leader>mp :!markdown % > %.html && open %.html<CR><CR>
