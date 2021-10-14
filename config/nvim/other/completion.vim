set completeopt-=longest
set completeopt+=menu
set completeopt+=noinsert
set completeopt+=noselect


lua <<EOF

local cmp = require('cmp')
cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
  mapping = {
    ['<tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
    ['<c-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
    ['<c-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'}),
  },
}

EOF
