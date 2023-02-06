
return {
  {
    'folke/trouble.nvim',
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
    },
    keys = {
      { "<leader>r", "<cmd>TroubleToggle<cr>" },
      { "<leader>rr", "<cmd>TroubleToggle<cr>" },
      { "<leader>rw", "<cmd>Trouble workspace_diagnostics<cr>" },
      { "<leader>rd", "<cmd>Trouble document_diagnostics<cr>" },
      { "<leader>ll", "<cmd>Trouble loclist<cr>" },
      { "<leader>qq", "<cmd>Trouble quickfix<cr>" },
      { "gR", "<cmd>Trouble lsp_references<cr>" },
    },
    config = function()
      require("trouble").setup {
        icons = true,
      }
    end
  },
}
