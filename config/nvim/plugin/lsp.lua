-- require("vim.lsp.log").set_format_func(vim.inspect)
-- vim.lsp.set_log_level("debug")

vim.lsp.enable({
  "arduino_language_server",
  "bashls",
  "clangd",
  "clojure-lsp",
  "gleam",
  "gopls",
  "lua_ls",
  "nimlangserver",
  "sorbet",
  "terraformls",
  "tflint",
  "vimls",
  "yamlls",
  "zls",
  "zuban",
})

vim.lsp.config("*", {
  root_markers = { ".git" },
  on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    vim.keymap.set("n", "g?", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)

    vim.keymap.set("n", ",,r", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    vim.keymap.set("n", ",,i", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.keymap.set("n", ",,t", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    vim.keymap.set("n", ",,h", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    vim.keymap.set("n", ",,re", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    vim.keymap.set("n", ",,ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    vim.keymap.set("n", ",,q", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
    vim.keymap.set("n", ",,d", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
    vim.keymap.set("n", ",,w", '<cmd>lua vim.lsp.buf.workspace_symbol(".")<cr>', opts)
    vim.keymap.set("n", ",,ci", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", opts)
    vim.keymap.set("n", ",,co", "<cmd>lua vim.lsp.buf.outgoing_calls()<cr>", opts)
    vim.keymap.set("n", ",,cr", "<cmd>lua vim.lsp.codelens.refresh({ bufnr = 0 })<cr>", opts)
    vim.keymap.set("n", ",,cl", "<cmd>lua vim.lsp.codelens.run()<cr>", opts)
    vim.keymap.set("n", ",,?", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
    end, opts)

    vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
    vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)

    vim.keymap.set("n", "==", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 10000 })<cr>", opts)
  end,
})
