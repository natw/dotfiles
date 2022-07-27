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

vim.api.nvim_set_keymap('n', '<leader>d', ':call v:lua.toggle_diagnostics()<CR>',  {noremap = true, silent = true})
