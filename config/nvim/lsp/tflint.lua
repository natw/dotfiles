return {
  cmd = { "tflint", "--langserver" },
  filetypes = { "terraform" },
  root_markers = { ".tflint.hcl", ".terraform" },
}
