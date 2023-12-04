-- config for both regular lsp stuff and null-lsp

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
    source = "always",
    header = "",
    prefix = "",
  },
})

local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local bm = function(lhs, rhs)
    require("utils").bufmap("n", lhs, rhs, opts)
  end

  bm("K", "<cmd>lua vim.lsp.buf.hover()<cr>")
  bm("gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
  bm("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
  bm("g?", "<cmd>lua vim.diagnostic.open_float()<cr>")

  bm(",,r", "<cmd>lua vim.lsp.buf.references()<cr>")
  bm(",,i", "<cmd>lua vim.lsp.buf.implementation()<cr>")
  bm(",,t", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
  bm(",,h", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
  bm(",,re", "<cmd>lua vim.lsp.buf.rename()<cr>")
  bm(",,ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
  bm(",,q", "<cmd>lua vim.diagnostic.setloclist()<cr>")
  bm(",,sd", "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
  bm(",,sw", '<cmd>lua vim.lsp.buf.workspace_symbol(".")<cr>')
  bm(",,ci", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>")
  bm(",,co", "<cmd>lua vim.lsp.buf.outgoing_calls()<cr>")

  bm("[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
  bm("]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

  -- bm("==", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 10000 })<cr>")
  -- vim.api.nvim_command("autocmd CursorHold <buffer> lua require('echo-diagnostics').echo_line_diagnostic()")
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
    init_options = {
      isNeovim = true,
      indexes = {
        runtimepath = true,
      },
      diagnostic = {
        enable = true,
      },
    },
  })

  lsp.terraformls.setup({
    on_attach = on_attach,
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
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      gopls = {
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
      },
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

  lsp.ruby_ls.setup({})

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
end

-- local function nls_config()
--   local nls = require("null-ls")
--   nls.setup({
--     debug = (vim.env.DEBUG_LSP == "true"),
--     on_attach = on_attach,
--     capabilities = vim.lsp.protocol.make_client_capabilities(),
--     root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git", ".standard.yml"),
--     sources = {
--       nls.builtins.diagnostics.shellcheck,
--       nls.builtins.formatting.shfmt,

--       nls.builtins.formatting.black,
--       nls.builtins.formatting.isort,
--       -- nls.builtins.diagnostics.mypy,

--       nls.builtins.diagnostics.golangci_lint,

--       nls.builtins.diagnostics.standardrb.with({
--         timeout = 10000,
--         -- root_dir = function(_) -- what was this for?
--         --   return nil
--         -- end,
--       }),
--       nls.builtins.formatting.standardrb.with({
--         timeout = 10000,
--         extra_args = { "--no-parallel" },
--       }),

--       nls.builtins.formatting.latexindent,
--     },
--   })
-- end

vim.cmd("sign define LspDiagnosticsSignError text=> texthl=LspDiagnosticsSignError linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignWarning text=> texthl=LspDiagnosticsSignWarning linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignInformation text=> texthl=LspDiagnosticsSignInformation linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignHint text=> texthl=LspDiagnosticsSignHint linehl= numhl=")

return {
  { "neovim/nvim-lspconfig",  lazy = false, config = lspconfig_config },
  { "ojroques/nvim-lspfuzzy", lazy = false, config = {} },
  -- 'folke/lsp-colors.nvim' -- dunno if I actually need this atm. TODO: actually compare documents with this on and off
  -- { "jose-elias-alvarez/null-ls.nvim", lazy = false, config = nls_config },
}
