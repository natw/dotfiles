-- mappings that mostly aren't tied to a specific plugin

local m = require("utils").map
local nm = function(lhs, rhs)
  m("n", lhs, rhs)
end

-- my muscle memory for ctrl-c is strong, but I want the InsertLeave autocmd
m("i", "<c-c>", "<esc>")

nm("<c-h>", "gT")
nm("<c-l>", "gt")

vim.keymap.set({ "n", "v" }, "<leader>c", "gc", { remap = true })

nm("<leader>v", "V`]")
nm("<leader><leader>", "<c-^>")

nm(",f", ":cfirst<cr>")
nm(",c", ":cc<cr>")

nm(",t", ":tabnew<cr>")

nm("<c-w><c-c>", "<c-[>")

nm("<c-n>", require("diagnostics").next_thing)
nm("<c-p>", require("diagnostics").prev_thing)

m("t", "<esc>", "<c-\\><c-n>")

nm("<leader>t", ":call nat#GitFZF()<cr>")

nm("<leader>hi", ":TSHighlightCapturesUnderCursor<cr>")
nm("<leader>i", ":Inspect<cr>")

vim.keymap.set({ "v" }, "=", "gq", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "==", "gggqG", { noremap = false, silent = true })

local c = function(a, b)
  vim.api.nvim_create_user_command(a, b, {})
end
c("W", "w")
c("Wq", "wq")
c("Q", "q")
c("Vsp", "vsp")
c("Wa", "wa")

nm("<leader>wc", ":%s/<c-r><c-w>//gn<CR>")

c("Rmsp", [[%s/\s\+$//]])

vim.api.nvim_command([[:command! -nargs=1 -complete=file EditOrMkFileWithDir :call nat#EditOrMkFileWithDir(<q-args>)]])
vim.api.nvim_command([[nnoremap <leader>fe :EditOrMkFileWithDir <C-R>=expand("%:p:h") . "/" <cr>]])
