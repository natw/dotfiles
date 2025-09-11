-- mappings that mostly aren't tied to a specific plugin

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

local m = function(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
end
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

nm("<c-n>", function() require("diagnostics").next_thing() end)
nm("<c-p>", function() require("diagnostics").prev_thing() end)

m("t", "<esc>", "<c-\\><c-n>")

nm("<leader>i", ":Inspect<cr>")

vim.keymap.set({ "v" }, "=", "gq", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "==", "mMgggqGg`M", { noremap = false, silent = true })

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

vim.keymap.set("c", "<c-a>", "<Home>", { noremap = true })
vim.keymap.set("c", "<c-b>", "<S-Left>", { noremap = true })
vim.keymap.set("c", "<c-f>", "<S-Right>", { noremap = true })

vim.keymap.set({ "x", "o" }, "il", function()
  require("indentnav").select_indent(false)
end, { noremap = true, silent = true })

vim.keymap.set({ "x", "o" }, "al", function()
  require("indentnav").select_indent(true)
end, { noremap = true, silent = true })

vim.keymap.set({ "n", "v", "o" }, "]l", function()
  require("indentnav").goto_next_line_at_same_indent()
end, { noremap = true, silent = true })

vim.keymap.set({ "n", "v", "o" }, "[l", function()
  require("indentnav").goto_prev_line_at_same_indent()
end, { noremap = true, silent = true })
