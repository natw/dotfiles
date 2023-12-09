-- vim.opt_local.commentstring = [[// %s]]
vim.b.commentary_format = [[// %s]]
vim.api.nvim_create_user_command("A", ":ClangdSwitchSourceHeader", {})
