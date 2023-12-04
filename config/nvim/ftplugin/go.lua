vim.bo.expandtab = false
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
-- vim.bo.updatetime = 200
vim.o.foldmethod = "indent"

vim.api.nvim_create_user_command("A", require("go_funcs").alternate, {})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ buffnr = args.buf })
  end,
})

-- nnoremap <leader>rt ot.Run("", func(t *testing.T) {<cr>})<esc>kci"
-- augroup GO_LSP
-- 	autocmd! * <buffer=abuf>
--   autocmd BufWritePre <buffer=abuf> :silent! lua require('go_funcs').format()
--   autocmd BufWritePre <buffer=abuf> :silent! lua require('go_funcs').org_imports(3000)
-- augroup END

-- setlocal foldexpr=nvim_treesitter#foldexpr()
