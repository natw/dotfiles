vim.bo.expandtab = false
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
-- vim.bo.updatetime = 200
vim.o.foldmethod = "indent"
-- setlocal foldexpr=nvim_treesitter#foldexpr()

vim.api.nvim_create_user_command("A", function()
  require("go_funcs").alternate()
end, {})

-- nnoremap <leader>rt ot.Run("", func(t *testing.T) {<cr>})<esc>kci"

require("utils").onsave("GO", function()
  vim.lsp.buf.format({
    timeout_ms = 1000,
    bufnr = 0,
  })
end)

require("utils").onsave("GO", function()
  require("go_funcs").org_imports(3000)
end)

