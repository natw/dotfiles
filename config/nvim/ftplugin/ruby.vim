setlocal list

nmap <space>h :s/:\(\w\+\)\s\+=> /\1: /<cr>

let ruby_no_expensive = 1
