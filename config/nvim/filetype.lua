vim.filetype.add({
  extension = {},
  filename = {
    ["tmux.conf"] = "tmux",
    ["Capfile"] = "ruby",
    ["Gemfile"] = "ruby",
    ["Vagrantfile"] = "ruby",
    ["~/.kube/config"] = "yaml",
    ["Chart.lock"] = "yaml",
  },
  pattern = {
    -- ["%g+.pkr.hcl"] = "hcl.packer",
    ["%g+.yaml.gotmpl"] = "yaml",
  },
})
