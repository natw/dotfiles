setlocal commentstring=#%s

nmap <silent> ,b :%s/${\(\S[^}]*\S\)}/${ \1 }/g<cr><c-o>
