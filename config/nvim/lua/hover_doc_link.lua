local vim = vim
local util = require 'vim.lsp.util'

local function handleHover(patt)
  local h = function (err, method, result, client_id, bufnr, config)
    local body = result['contents']['value']
    local urls = {}
    for u in string.gmatch(body, '(http.*)%)') do
      table.insert(urls, u)
    end

    for i, url in pairs(urls) do
      if string.find(url, patt) then
        os.execute("open " .. url)
        return
      end
    end
  end
  return h
end

function _G.hover_doc_link(patt)
  local params = util.make_position_params()
  vim.lsp.buf_request(0, 'textDocument/hover', params, handleHover(patt))
end

