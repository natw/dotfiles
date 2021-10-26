set completeopt=menu,menuone,noselect

lua <<EOF

local cmp = require('cmp')
cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
  preselect = cmp.PreselectMode.None,
  mapping = {
    -- ['<cr>'] = cmp.mapping.confirm({
    --   select = true,
    --   behavior = cmp.ConfirmBehavior.Insert,
    -- }),
    ["<tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
    ['<s-tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
    ['<c-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'}),
    ['<c-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
    ['<c-j>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
    ['<c-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'}),
    ['<c-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'}),
  },
  experimental = {
    ghost_text = true,
  },
}

EOF
