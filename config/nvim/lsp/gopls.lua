-- old config had this:
-- on_attach = function(_, bufnr)
--   on_attach(_, bufnr)
--   vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
-- end,

return {
  cmd = { "gopls" },
  -- cmd = { "gopls", "-logfile", "/tmp/gopls.log", "-rpc.trace" },
  filetypes = { "go", "gomod", "gowork", "gotmpl", "tmpl" },
  root_markers = { "go.mod" },
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      completeFunctionCalls = false,
      semanticTokens = true,
      usePlaceholders = true,
      -- verboseOutput = true,
      gofumpt = true,
      ["local"] = "github.com/amount,github.com/kin,github.com/natw",
      staticcheck = true,
      analyses = {
        ST1000 = false,
        ST1020 = false,
        nillness = true,
        unusedparams = true,
        unusedwrite = true,
      },
      codelenses = {
        test = true,
        gc_details = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
