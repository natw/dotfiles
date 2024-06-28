return {
  {
    "junegunn/fzf.vim",
    keys = {
      {
        "<leader>t",
        function()
          -- TODO: rewrite this in lua?
          vim.cmd("call nat#GitFZF()")
        end,
        { desc = "nat#GitFZF()", noremap = true, silent = true },
      },
    },
    cmd = {
      "Files",
      "Buffers",
      "Colors",
      "Ag",
      "Lines",
      "BLines",
      "Tags",
      "BTags",
      "Changes",
      "Marks",
      "Jumps",
      "Windows",
      "History",
      "Commands",
      "Maps",
      "Helptags",
      "Filetypes",
    },
    dependencies = {
      { dir = "/opt/homebrew/opt/fzf" },
    },
  },
}
