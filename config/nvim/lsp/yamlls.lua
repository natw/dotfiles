-- config for enabling single file support?
--
return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
  settings = {
    redhat = {
      telemetry = {
        enabled = false,
      },
    },
    yaml = {
      yamlVersion = "1.2",
      format = {
        enable = true,
      },
      validate = true,
      hover = true,
      completion = true,

      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/deploy.yaml",
      },
    },
  },
}
