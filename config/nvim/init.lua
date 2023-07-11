-- vim.cmd("set debug=throw")
vim.loader.enable() -- experimental?
require("lazy-nvim")

require("mappings")
vim.cmd("runtime mappings.vim")
require("options")

vim.o.runtimepath = vim.o.runtimepath .. "$GOROOT/misc/vim"

vim.cmd("colorscheme railscasts")
vim.cmd("let $VIMHOME=expand('<sfile>:p:h')")
