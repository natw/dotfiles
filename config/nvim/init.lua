vim.cmd("set debug=throw")
vim.loader.enable()

require("options")
require("lazy-nvim")
require("mappings")

vim.cmd("colorscheme railscasts")
vim.cmd("let $VIMHOME=expand('<sfile>:p:h')")

require("nvim-treesitter").install {
  "gleam",
  "hcl",
  "lua",
  "python",
  "ruby",
  "rust",
  "terraform",
  "yaml",
}
