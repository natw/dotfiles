vim.filetype.add({
  extension = {
    ["tmux.conf"] = "tmux",
    ["yaml.gotmpl"] = "yaml",
  },
  filename = {
    ["Capfile"] = "ruby",
    ["Gemfile"] = "ruby",
    ["Vagrantfile"] = "ruby",
    ["~/.kube/config"] = "yaml",
    ["Chart.lock"] = "yaml",
  },
  pattern = {
  },
})
