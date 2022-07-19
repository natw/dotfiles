vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>rr", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<leader>rw", "<cmd>Trouble workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>rd", "<cmd>Trouble document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>qq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)
