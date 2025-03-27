local rpath = vim.split(package.path, ";")
table.insert(rpath, "lua/?.lua")
table.insert(rpath, "lua/?/init.lua")

return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
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
        callSnippet = "Both",
      },
      diagnostics = {
        globals = { "vim" },
        neededFileStatus = {
          ["codestyle-check"] = "Any",
        },
        disable = { "inject-field" },
      },
      workspace = {
        -- library = vim.api.nvim_get_runtime_file("", true),
        library = {
          vim.env.VIMRUNTIME,
        },
        checkThirdParty = false, -- this is what got sumneko to stop asking to change settings or something
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
