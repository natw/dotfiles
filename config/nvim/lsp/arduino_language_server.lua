return {
  cmd = { "arduino-language-server", "-cli-config", "/Users/nat/projects/checklist/arduino-cli.yaml" },
  filetypes = { "arduino" },
  root_markers = { "sketch.yaml", "arduino-cli.yaml" },
  capabilities = {
    textDocument = {
      semanticTokens = vim.NIL,
    },
    workspace = {
      semanticTokens = vim.NIL,
    },
  },
}
