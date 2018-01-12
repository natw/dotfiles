fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nnoremap <M-g> :call JumpToDef()<cr>
inoremap <M-g> <esc>:call JumpToDef()<cr>i
