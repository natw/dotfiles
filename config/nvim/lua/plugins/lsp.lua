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
  float = {
    source = true,
    header = "",
    prefix = "",
  },
})

local on_attach = function(_, bufnr)
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
  vim.keymap.set("n", ",,sd", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
  vim.keymap.set("n", ",,sw", '<cmd>lua vim.lsp.buf.workspace_symbol(".")<cr>', opts)
  vim.keymap.set("n", ",,ci", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", opts)
  vim.keymap.set("n", ",,co", "<cmd>lua vim.lsp.buf.outgoing_calls()<cr>", opts)
  vim.keymap.set("n", ",,cr", "<cmd>lua vim.lsp.codelens.refresh({ bufnr = 0 })<cr>", opts)
  vim.keymap.set("n", ",,cl", "<cmd>lua vim.lsp.codelens.run()<cr>", opts)
  vim.keymap.set("n", ",,?", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
  end, opts)

  vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
  vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)

  -- vim.keymap.set("n", "==", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 10000 })<cr>", opts)
end

local function lspconfig_config()
  local lsp = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  lsp.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    -- cmd = { "clangd", "--log=verbose" },
  })

  lsp.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      python = {
        pythonPath = "/opt/homebrew/bin/python3",
      },
    },
  })

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

  lsp.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    -- settings = {
    --   ['rust-analyzer'] = {
    --   },
    -- },
  })

  lsp.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  lsp.vimls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    initializationOptions = {
      isNeovim = true,
      indexes = {
        runtimepath = true,
      },
      diagnostic = {
        enable = true,
      },
      suggest = {
        fromVimruntime = true,
        fromRuntimepath = true,
      },
    },
  })

  lsp.terraformls.setup({
    -- terraform-ls's semantic tokens are kind of jacked at the moment
    on_attach = function(client, opts)
      client.server_capabilities.semanticTokensProvider = nil
      return on_attach(client, opts)
    end,
    capabilities = capabilities,
    settings = {
      experimentalFeatures = {
        prefillRequiredField = true,
      },
    },
  })

  lsp.tflint.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  lsp.gopls.setup({
    on_attach = function(_, bufnr)
      on_attach(_, bufnr)
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    end,
    capabilities = capabilities,
    -- cmd = { "gopls", "-logfile", "/tmp/gopls.log", "-rpc.trace" },
    settings = {
      gopls = {
        experimentalPostfixCompletions = false,
        completeFunctionCalls = false,
        semanticTokens = true,
        usePlaceholders = true,
        -- verboseOutput = true,
        gofumpt = true,
        ["local"] = "github.com/amount,github.com/kin,github.com/natw",
        staticcheck = true,
        analyses = {
          nillness = true,
          fieldalignment = true,
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
    init_options = {
      usePlaceholders = true,
    },
  })

  lsp.clojure_lsp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  local rpath = vim.split(package.path, ";")
  table.insert(rpath, "lua/?.lua")
  table.insert(rpath, "lua/?/init.lua")
  -- local lualspRoot = vim.env.HOME .. "/src/lua-language-server"

  lsp.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    -- cmd = {lualspRoot .. "/bin/macOS/lua-language-server", "-E", lualspRoot .. "/main.lua"},
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = rpath,
        },
        format = {
          enabled = true,
          defaultConfig = {
            indent_style = "space",
            indent_size = "2",
          },
        },
        completion = {
          enable = true,
          displayContext = 1,
          showWord = "Enable", -- "Fallback"
          workspaceWord = true,
        },
        diagnostics = {
          globals = { "vim" },
          neededFileStatus = {
            ["codestyle-check"] = "Any",
          },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false, -- this is what got sumneko to stop asking to change settings or something
        },
        telemetry = {
          enable = false,
        },
      },
    },
  })

  lsp.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },

        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },

        cargo = {
          buildScripts = {
            enable = true,
          },
        },

        procMacro = {
          enable = true,
        },
      },
    },
  })

  lsp.texlab.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "texlab" },
    settings = {
      texlab = {
        build = {
          args = { "-pdf", "-xelatex", "-interaction=nonstopmode", "-synctex=1", "%f" },
          executable = "latexmk",
          forwardSearchAfter = false,
          onSave = true,
        },
        chktex = {
          onEdit = true,
          onOpenAndSave = true,
        },
        latexFormatter = "latexindent",
        latexindent = {
          modifyLineBreaks = true,
        },
      },
    },
  })

  lsp.sorbet.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "bundle", "exec", "srb", "t", "--lsp" },
  })

  -- lsp.clangd.setup{
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   cmd = {"clangd", "--log=verbose", "--enable-config"},
  -- }

  lsp.yamlls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      redhat = {
        telemetry = {
          enabled = false,
        },
      },
      yaml = {
        yamlVersion = "1.2",
        format = {
          enable = true,
        },
        validate = true,
        hover = true,
        completion = true,

        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/deploy.yaml",
        },
      },
    },
    single_file_support = true,
  })

  lsp.nim_langserver.setup({})

  lsp.bashls.setup({})
end

vim.cmd("sign define LspDiagnosticsSignError text=> texthl=LspDiagnosticsSignError linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignWarning text=> texthl=LspDiagnosticsSignWarning linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignInformation text=> texthl=LspDiagnosticsSignInformation linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignHint text=> texthl=LspDiagnosticsSignHint linehl= numhl=")

return {
  {
    "neovim/nvim-lspconfig",
    config = lspconfig_config,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {},
  },
  {
    "ojroques/nvim-lspfuzzy",
    dependencies = { "junegunn/fzf.vim" },
    cmd = { "LspDiagnosticsAll" },
  },
}
