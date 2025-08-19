return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      -- {
      --   "<leader>t",
      --   function()
      --     require('fzf-lua').git_files()
      --   end,
      --   { desc = "fzf-lua.git_files()", noremap = true, silent = true },
      -- },
      {
        "<leader>fz",
        ":FzfLua ",
      },
    },
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
  },
}
