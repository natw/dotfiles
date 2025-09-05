vim.g.diagnostics_active = true

vim.diagnostic.config({
  underline = false,
  update_in_insert = false,
  virtual_text = false,
  severity_sort = true,
  -- virtual_lines = { current_line = true },
  float = {
    source = true,
    header = "",
    prefix = "",
  },
})

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

vim.cmd("sign define LspDiagnosticsSignError text=> texthl=LspDiagnosticsSignError linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignWarning text=> texthl=LspDiagnosticsSignWarning linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignInformation text=> texthl=LspDiagnosticsSignInformation linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignHint text=> texthl=LspDiagnosticsSignHint linehl= numhl=")
