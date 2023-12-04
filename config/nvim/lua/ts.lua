local M = {}

function M.statusline()
	print(require("nvim-treesitter.statusline").statusline({
		indicator_size = 150,
		separator = "  ⮕  ",
		type_patterns = { "class", "function", "method", "module" },
	}))
end

return M
