vim.cmd("set debug=throw")
vim.api.nvim_set_var('ale_sign_highlight_linenrs', true)

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

vim.cmd("runtime options.vim")
require("plugins")
vim.cmd("runtime mappings.vim")
require("options")

vim.o.runtimepath = vim.o.runtimepath .. "$GOROOT/misc/vim"

vim.cmd("colorscheme railscasts")
vim.cmd("let $VIMHOME=expand('<sfile>:p:h')")

vim.cmd("filetype indent off")
