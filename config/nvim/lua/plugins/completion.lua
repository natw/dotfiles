vim.api.nvim_set_option("completeopt", "menu,menuone,noselect")

-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#confirm-candidate-on-tab-immediately-when-theres-only-one-completion-entry
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function cmp_setup()
  local cmp = require("cmp")

  local if_cmp_visible = function(actionFn)
    return function(fallback)
      if cmp.visible() then
        actionFn()
      else
        fallback()
      end
    end
  end

  cmp.setup({
    sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "nvim_lsp_signature_help" },
      { name = "luasnip" },
      { name = "path" },
      { name = "buffer" },
    },
    preselect = cmp.PreselectMode.None,
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      -- ["<Tab>"] = if_cmp_visible(cmp.select_next_item),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          if #cmp.get_entries() == 1 then
            cmp.confirm({ select = true })
          else
            cmp.select_next_item()
          end
        --[[ Replace with your snippet engine (see above sections on this page)
      elseif snippy.can_expand_or_advance() then
        snippy.expand_or_advance() ]]
        elseif has_words_before() then
          cmp.complete()
          if #cmp.get_entries() == 1 then
            cmp.confirm({ select = true })
          end
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<s-Tab>"] = if_cmp_visible(cmp.select_prev_item),
      ["<c-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
      ["<c-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
      ["<c-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
      ["<c-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
      ["<CR>"] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          else
            fallback()
          end
        end,
        s = cmp.mapping.confirm({ select = true }),
        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      }),
    },
    view = {
      entries = "native",
    },
    experimental = {
      ghost_text = {},
    },
    enabled = function()
      -- disable completion in comments
      local context = require("cmp.config.context")
      -- keep command mode completion enabled when cursor is in a comment
      if vim.api.nvim_get_mode().mode == "c" then
        return true
      else
        return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
      end
    end,
  })
end

return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    config = cmp_setup,
    dependencies = {
      { "hrsh7th/cmp-path", lazy = false },
      { "hrsh7th/cmp-buffer", lazy = false },
      { "hrsh7th/cmp-nvim-lua", lazy = false },
      { "hrsh7th/cmp-nvim-lsp", lazy = false },
      { "hrsh7th/cmp-nvim-lsp-signature-help", lazy = false },
      { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp", lazy = false },
      { "saadparwaiz1/cmp_luasnip", lazy = false },
    },
  },
}
