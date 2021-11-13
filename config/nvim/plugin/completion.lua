vim.api.nvim_set_option("completeopt", "menu,menuone,noselect")

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
    { name = 'path' },
    -- { name = 'buffer' },
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
  experimental = {
    ghost_text = true,
  },
}
cmp.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' },
    { name = 'path' },
  }
})

-- cmp.setup.cmdline('/', {
--   sources = cmp.config.sources({
--     { name = 'nvim_lsp_document_symbol' }
--   }, {
--     { name = 'buffer' }
--   })
-- })
