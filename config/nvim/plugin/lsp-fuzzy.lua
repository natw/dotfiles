vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    else
      client.request = require('lspfuzzy').wrap_request(client.request)
    end
  end
})
