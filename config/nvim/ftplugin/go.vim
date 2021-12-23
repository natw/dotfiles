setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal updatetime=200

:command! A GoAlternate

" nnoremap tt :GoInfo<cr>
" nnoremap tT :GoDefType<cr>
" nnoremap ,,d :GoDeclsDir<cr>

nnoremap <leader>rt ot.Run("", func(t *testing.T) {<cr>})<esc>kci"

lua require('hover_doc_link')
nnoremap <silent> gx :call v:lua.hover_doc_link('pkg.go.dev')<cr>

" I grabbed this from some github issue somewhere
" For some reason, golsp made the reorganization of imports
" (which includes adding missing ones)
" a code action rather than part of the formatting.
" Apparently something like this is necessary to run a specific code action,
" but I haven't really looked too deeply into it.
lua <<EOF
  function org_imports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit)
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end

  function format()
    vim.lsp.buf.formatting_sync(nil, 1000)
  end
EOF

augroup GO_LSP
	autocmd!
  " autocmd BufWritePre <buffer> :silent! lua vim.lsp.buf.formatting_sync(nil, 1000)
  autocmd BufWritePre <buffer> :silent! lua format()

  autocmd BufWritePre <buffer> :silent! lua org_imports(3000)
augroup END


" setlocal foldmethod=expr
" setlocal foldexpr=nvim_treesitter#foldexpr()
