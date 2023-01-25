vim.api.nvim_set_option("completeopt", "menu,menuone,noselect")

local function cmp_setup()
  local cmp = require('cmp')

  local if_cmp_visible = function(actionFn)
    return function(fallback)
      if cmp.visible() then
        actionFn()
      else
        fallback()
      end
    end
  end

  cmp.setup {
    sources = {
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'path' },
      { name = 'buffer' },
    },
    preselect = cmp.PreselectMode.None,
    mapping = {
      ['<Tab>'] = if_cmp_visible(cmp.select_next_item),
      ['<s-Tab>'] = if_cmp_visible(cmp.select_prev_item),
      ['<c-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'}),
      ['<c-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
      ['<c-j>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
      ['<c-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'}),
    },
    view = {
      entries = "native",
    },
    experimental = {
      ghost_text = true,
    },
  }
end

return {
  {
    'hrsh7th/nvim-cmp',
    lazy = false,
    config = cmp_setup,
    dependencies = {
      { 'hrsh7th/cmp-path', lazy = false },
      { 'hrsh7th/cmp-buffer', lazy = false },
      { 'hrsh7th/cmp-nvim-lua', lazy = false },
      { 'hrsh7th/cmp-nvim-lsp', lazy = false },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', lazy = false },
    },
  }
}
