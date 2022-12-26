" I want to be able to just switch to a file without worrying about whether it
" already exists
" <leader>fe
function! nat#EditOrMkFileWithDir(path) abort
  if !filereadable(a:path)
    let l:basename = fnamemodify(a:path, ":p:h")
    call mkdir(l:basename, "p")
  endif
  execute 'edit' a:path
endfunction

function! nat#GitFZF()
  let l:git_root = system('git rev-parse --show-toplevel 2> /dev/null')
  call fzf#vim#files(substitute(l:git_root, "\n$", '' ,''))
endfunction

" show some debug info for syntax highlighting.
" currently mapped to <leader>hi
" defunct in neovim? at least with treesitter?
function! nat#HighlightingInfo() abort
  let l:itemSynID = synID(line('.'), col('.'), v:true)
  let l:transparencySynID = synID(line('.'), col('.'), v:false)
  let l:linkedSynID = synIDtrans(l:itemSynID)

  let l:itemName = synIDattr(l:itemSynID, "name")
  let l:linkedName = synIDattr(l:linkedSynID, "name")
  let l:transparencyName = synIDattr(l:transparencySynID, "name")

  let l:ctermfg = synIDattr(l:linkedSynID, "fg", "cterm")
  let l:ctermbg = synIDattr(l:linkedSynID, "bg", "cterm")
  let l:guifg = synIDattr(l:linkedSynID, "fg", "gui")
  let l:guibg = synIDattr(l:linkedSynID, "bg", "gui")

  let l:linkInfo = printf(" -> \"%s\"", l:linkedName)
  :echo printf("Group: \"%s\"%s   Overlay: \"%s\"   GUI: %s/%s   cterm: %s/%s",
        \ l:itemName, l:linkInfo, l:transparencyName,
        \ l:guifg, l:guibg,
        \ l:ctermfg, l:ctermbg
        \)
endfunction
