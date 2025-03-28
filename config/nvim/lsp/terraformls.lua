return {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars" },
  root_markers = { ".terraform" },
  init_options = {
    ignoreSingleFileWarning = true,
  },
  settings = {
    experimentalFeatures = {
      prefillRequiredField = true,
    },
  },
  on_attach = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
  end,
}
