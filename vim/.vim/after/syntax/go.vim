" let s:current_syntax=b:current_syntax
" unlet b:current_syntax
" syntax include @SQL syntax/sql.vim
" syntax region queryLiteral matchgroup=Snip start="Query = `" end="`" contains=@sql
" let b:current_syntax=s:current_syntax
