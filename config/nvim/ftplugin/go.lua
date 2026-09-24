vim.bo.expandtab = false
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
-- vim.bo.updatetime = 200
vim.o.foldmethod = "indent"
-- setlocal foldexpr=nvim_treesitter#foldexpr()

vim.cmd [[ setlocal indentkeys-=<:> ]]

vim.api.nvim_create_user_command("A", function()
  require("go_funcs").alternate()
end, {})

-- nnoremap <leader>rt ot.Run("", func(t *testing.T) {<cr>})<esc>kci"

require("utils").onsave("GO", function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.buf.format({
    timeout_ms = 1000,
    bufnr = bufnr,
  })
end)

require("utils").onsave("GO", function()
  require("go_funcs").org_imports(3000)
end)

vim.treesitter.start()


local function open_go_doc()
  local clients = vim.lsp.get_clients({
    bufnr = 0,
    name = "gopls",
  })
  local client = clients[1]
  local range = vim.lsp.util.make_range_params(0, client.offset_encoding)
  client:exec_cmd(
    {
      title = "show docs",
      command = "gopls.doc",
      arguments = {
        {
          Location = {
            uri = range.textDocument.uri,
            range = range.range,
          },
          ShowDocument = true,
        }
      },
    },
    {
      bufnr = 0,
    }
  )
end

vim.keymap.set("n", ",,g", open_go_doc, { desc = "Open Go docs in browser" })
