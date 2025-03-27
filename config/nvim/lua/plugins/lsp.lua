vim.lsp.set_log_level("off")
if vim.env.DEBUG_LSP == "true" then
  require("vim.lsp.log").set_format_func(vim.inspect)
  vim.lsp.set_log_level("debug")
end

vim.diagnostic.config({
  underline = false,
  update_in_insert = false,
  virtual_text = false,
  severity_sort = true,
  virtual_lines = { current_line = true },
  float = {
    source = true,
    header = "",
    prefix = "",
  },
})

-- local on_attach = function(_, bufnr)
-- end

local function lspconfig_config()
  local lsp = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- lsp.pyright.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   settings = {
  --     python = {
  --       pythonPath = "/opt/homebrew/bin/python3",
  --     },
  --   },
  -- })

  -- lsp.pylsp.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   settings = {
  --     pyls = {
  --       configurationSources = {
  --         "pycodestyle",
  --       },
  --       plugins = {
  --         pyflakes = {
  --           enabled = false,
  --         },
  --         -- pyls_mypy = {
  --         --   enabled = false,
  --         --   --   live_mode = false,
  --         -- },
  --       },
  --     },
  --   },
  -- })
  --
  -- lsp.rust_analyzer.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   -- settings = {
  --   --   ['rust-analyzer'] = {
  --   --   },
  --   -- },
  -- })

  -- lsp.ts_ls.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  -- })

  -- lsp.clojure_lsp.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  -- })

  -- local rpath = vim.split(package.path, ";")
  -- table.insert(rpath, "lua/?.lua")
  -- table.insert(rpath, "lua/?/init.lua")
  -- local lualspRoot = vim.env.HOME .. "/src/lua-language-server"

  -- local root_files = {
  --   '.luarc.json',
  --   '.luarc.jsonc',
  --   '.luacheckrc',
  --   '.stylua.toml',
  --   'stylua.toml',
  --   'selene.toml',
  --   'selene.yml',
  --   '.git',
  -- }

  -- lsp.lua_ls.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   -- cmd = {lualspRoot .. "/bin/macOS/lua-language-server", "-E", lualspRoot .. "/main.lua"},
  --   root_dir = lsp.util.root_pattern(root_files),
  -- })

  -- lsp.texlab.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   cmd = { "texlab" },
  --   settings = {
  --     texlab = {
  --       build = {
  --         args = { "-pdf", "-xelatex", "-interaction=nonstopmode", "-synctex=1", "%f" },
  --         executable = "latexmk",
  --         forwardSearchAfter = false,
  --         onSave = true,
  --       },
  --       chktex = {
  --         onEdit = true,
  --         onOpenAndSave = true,
  --       },
  --       latexFormatter = "latexindent",
  --       latexindent = {
  --         modifyLineBreaks = true,
  --       },
  --     },
  --   },
  -- })
  --

  -- lsp.ruby_lsp.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   init_options = {
  --     formatter = 'standard',
  --     linters = { 'standard' },
  --   },
  -- })

  -- lsp.sorbet.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   cmd = { "bundle", "exec", "srb", "t", "--lsp" },
  -- })

  -- lsp.clangd.setup{
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   cmd = {"clangd", "--log=verbose", "--enable-config"},
  -- }

  -- lsp.yamlls.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   single_file_support = true,
  -- })

  -- lsp.nim_langserver.setup({})

  -- lsp.bashls.setup({})

  -- require("lspfuzzy").setup({})
end

vim.cmd("sign define LspDiagnosticsSignError text=> texthl=LspDiagnosticsSignError linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignWarning text=> texthl=LspDiagnosticsSignWarning linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignInformation text=> texthl=LspDiagnosticsSignInformation linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignHint text=> texthl=LspDiagnosticsSignHint linehl= numhl=")

return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = lspconfig_config,
  --   event = { "BufReadPre", "BufNewFile" },
  --   dependencies = {},
  -- },
  -- {
  --   "ojroques/nvim-lspfuzzy",
  --   dependencies = { "junegunn/fzf.vim" },
  --   cmd = { "LspDiagnosticsAll" },
  -- },
}
