local lsp = require('lspconfig')

vim.lsp.set_log_level("debug")

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      underline = false,
      virtual_text = {
        spacing = 8,
      }
    }
  )


local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)

  buf_set_keymap('n', ',,r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', ',,i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', ',,t', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', ',,h', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', ',,rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', ',,ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', ',,q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', ',,d', '<cmd>lua vim.lsp.buf.workspace_symbol(".")<CR>', opts)
  buf_set_keymap('n', ',,ci', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
  buf_set_keymap('n', ',,co', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)

  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

  -- cmd = {"pyls", "-v", "--log-file", "/tmp/pyls.log"},
lsp.pylsp.setup {
  on_attach = on_attach,
  settings = {
    pyls = {
      configurationSources = {
        "pycodestyle"
      },
      plugins = {
        pyflakes = {
          enabled = false,
        },
        pyls_mypy = {
          enabled = true,
          live_mode = false,
        }
      }
    }
  }
}

lsp.vimls.setup {
  on_attach = on_attach,
  init_options = {
    isNeovim = true,
    indexes = {
      runtimepath = true,
    },
    diagnostic = {
      enable = true,
    },
  },
}

lsp.terraformls.setup { on_attach = on_attach }

lsp.gopls.setup {
  on_attach = on_attach,
  settings = {
    semanticTokens = true,
    usePlaceholders = true,
    analyses = {
      nillness = true,
    },
    codelens = {
      test = true,
      gc_details = true,
    },
  },
}

local rpath = vim.split(package.path, ";")
table.insert(rpath, "lua/?.lua")
table.insert(rpath, "lua/?/init.lua")

local lualspRoot = vim.env.HOME .. "/src/lua-language-server"

lsp.sumneko_lua.setup {
  on_attach = on_attach,
  cmd = {lualspRoot .. "/bin/macOS/lua-language-server", "-E", lualspRoot .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = rpath,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

lsp.texlab.setup{
  on_attach = on_attach,
  cmd = {"texlab"},
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
        onOpenAndSave = true
      },
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = true,
      },
    },
  },
}

require('lspfuzzy').setup {}
