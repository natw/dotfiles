return {
  {
    "junegunn/fzf.vim",
    config = function()
      puts("farts")
    end,
    keys = {
      {
        "<leader>t",
        function()
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
