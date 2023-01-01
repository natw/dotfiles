local function change_extension(opts)
  local current_path = vim.fn.expand("%:p")
  local new_extension = opts.fargs[1]
  local new_filename = vim.fn.expand("%:p:r") .. "." .. new_extension
  vim.cmd("saveas " .. new_filename)
  os.remove(current_path)
end

vim.api.nvim_create_user_command("Chex", change_extension, { nargs = 1 })
