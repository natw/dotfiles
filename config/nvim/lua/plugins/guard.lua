local function guard_config()
  local ft = require("guard.filetype")

  ft("go"):fmt("gofmt")

  ft("hcl"):fmt({
    cmd = "packer",
    args = { "fmt", "-" },
    stdin = true,
  })

  ft("lua"):fmt({
    cmd = "stylua",
    args = { "--indent-type", "Spaces", "--indent-width", "2", "-" },
    stdin = true,
  })

  require("guard").setup({
    lsp_as_default_formatter = true,
  })
end

return {
  { "nvimdev/guard.nvim", lazy = false, config = guard_config, dependencies = { "nvimdev/guard-collection" } },
}
