
return {
  {
    'folke/trouble.nvim',
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
      require("trouble").setup {
        icons = true,
      }
      local u = require("utils")
      u.map("n", "<leader>r", "<cmd>TroubleToggle<cr>")
      u.map("n", "<leader>rr", "<cmd>TroubleToggle<cr>")
      u.map("n", "<leader>rw", "<cmd>Trouble workspace_diagnostics<cr>")
      u.map("n", "<leader>rd", "<cmd>Trouble document_diagnostics<cr>")
      u.map("n", "<leader>ll", "<cmd>Trouble loclist<cr>")
      u.map("n", "<leader>qq", "<cmd>Trouble quickfix<cr>")
      u.map("n", "gR", "<cmd>Trouble lsp_references<cr>")
    end
  },
}
