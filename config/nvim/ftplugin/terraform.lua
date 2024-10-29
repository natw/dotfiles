require("utils").onsave("TF", function(args)
  require("conform").format({ bufnr = args.buf })
end)

vim.bo.commentstring = [[# %s]]
