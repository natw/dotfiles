vim.cmd("set debug=throw")
vim.api.nvim_set_var('ale_sign_highlight_linenrs', true)

vim.g.do_filetype_lua = 1

vim.cmd("runtime options.vim")
vim.cmd("runtime plugins.vim")
vim.cmd("runtime mappings.vim")

vim.o.runtimepath = vim.o.runtimepath .. "$GOROOT/misc/vim"

vim.cmd("colorscheme railscasts")
vim.cmd("let $VIMHOME=expand('<sfile>:p:h')")
