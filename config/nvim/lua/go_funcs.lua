local M = {}

function M.alternate()
  print("hi!")
end

-- I grabbed this from some github issue somewhere
-- For some reason, golsp made the reorganization of imports
-- (which includes adding missing ones)
-- a code action rather than part of the formatting.
-- Apparently something like this is necessary to run a specific code action,
-- but I haven't really looked too deeply into it.
function M.org_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit)
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

function M.format()
  vim.lsp.buf.formatting_sync(nil, 1000)
end

return M
