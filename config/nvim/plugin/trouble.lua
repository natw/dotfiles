require("trouble").setup {
  icons = true,
}

local opts = {silent = true, noremap = true}
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>TroubleToggle<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>rr", "<cmd>TroubleToggle<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>rw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>rd", "<cmd>Trouble document_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>Trouble loclist<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>qq", "<cmd>Trouble quickfix<cr>", opts)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)
