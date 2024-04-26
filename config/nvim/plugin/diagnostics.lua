vim.g.diagnostics_active = true

function _G.toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.hide()
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.show()
  end
end

vim.keymap.set("n", "<leader>d", toggle_diagnostics, { noremap = true, silent = true })
