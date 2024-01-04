vim.bo.expandtab = false
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
-- vim.bo.updatetime = 200
vim.o.foldmethod = "indent"

vim.api.nvim_create_user_command("A", require("go_funcs").alternate, {})

-- nnoremap <leader>rt ot.Run("", func(t *testing.T) {<cr>})<esc>kci"

-- local go_lsp_group = vim.api.nvim_create_augroup('GO_LSP', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   buffer = 0,
--   group = go_lsp_group,
--   callback = function(_)
--     require('go_funcs').format()
--   end,
-- })

require("utils").onsave("GO", function()
  require("go_funcs").format()
end)
require("utils").onsave("GO", function()
  require("go_funcs").org_imports(3000)
end)

-- setlocal foldexpr=nvim_treesitter#foldexpr()
