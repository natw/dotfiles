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

vim.keymap.set({ "v" }, "=", "gq", { remap = true })
vim.keymap.set({ "n" }, "==", "gggqG", { remap = true })
