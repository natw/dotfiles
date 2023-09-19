local function guard_config()
  local ft = require("guard.filetype")

  ft("go"):fmt("gofmt")

  require("guard").setup({
    lsp_as_default_formatter = true,
  })
end

return {
  { 'nvimdev/guard.nvim', lazy = false, config = guard_config, dependencies = { "nvimdev/guard-collection" } },
}
