local conform_opts = {
  notify_on_error = true,
  -- log_level = vim.log.levels.TRACE,
  formatters_by_ft = {
    -- ["*"] = { "injected" },
    lua = { "stylua" },
    python = { "isort", "black" },
    cpp = { "clang_format" },
    json = { "jq" },
    -- go = { "goimports", "gofumpt" },
    latex = { "latexindent" },
    packer = { "packer_fmt" },
    psql = { "pg_format" },
    -- ruby = { "rubyfmt" },
    ruby = { "standardrb" },
    rust = { "rustfmt" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
    terraform = { "terraform_fmt" },
    yaml = { "yamlfmt" },
    hcl = { "packer_fmt" },
    -- yaml = { "yamlfix" },
  },
}

return {
  {
    "stevearc/conform.nvim",
    opts = conform_opts,
    lazy = true,
    event = { "BufWritePre" },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}
