return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  keys = {
    {
      "<leader>gg",
      function()
        require("gitsigns").toggle_signs()
      end,
      desc = "Toggle Signs",
      noremap = true,
      silent = true,
    },
    {
      "<leader>gb",
      function()
        require("gitsigns").blame_line({ full = true })
      end,
      desc = "Blame Line",
    },
    {
      "<leader>gd",
      function()
        require("gitsigns").diffthis()
      end,
      desc = "DiffThis",
    },
  },
  config = {
    auto_attach = true,
  },
}
