local M = {}

-- these get used in ftplugin/go, I think

-- I grabbed this from some github issue somewhere
-- For some reason, golsp made the reorganization of imports
-- (which includes adding missing ones)
-- a code action rather than part of the formatting.
-- Apparently something like this is necessary to run a specific code action,
-- but I haven't really looked too deeply into it.
function M.org_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, 'utf-8')
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

function M.format()
  vim.lsp.buf.format(nil, 1000)
end

function M.alternate()
  local fname = vim.api.nvim_buf_get_name(0)
  if fname:match("^$") then
    print("empty?")
    return
  end
  local altfname = ""
  if vim.endswith(fname, "_test.go") then
    local parts = vim.split(fname, "_test.go")
    altfname = parts[1] .. ".go"
  elseif vim.endswith(fname, ".go") then
    local parts = vim.split(fname, ".go$")
    altfname = parts[1] .. "_test.go"
  else
    print("weird file name")
    return
  end

  vim.api.nvim_command("edit " .. altfname)
end

return M
