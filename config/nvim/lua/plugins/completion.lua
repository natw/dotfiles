vim.api.nvim_set_option("completeopt", "menu,menuone,noselect")

-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#confirm-candidate-on-tab-immediately-when-theres-only-one-completion-entry
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local if_cmp_visible = function(actionFn)
  return function(fallback)
    if require("cmp").visible() then
      actionFn()
    else
      fallback()
    end
  end
end

local function cmp_setup()
  local cmp = require("cmp")

  cmp.setup({
    sources = cmp.config.sources({
      { name = "nvim_lsp_signature_help" },
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
    }, {
      { name = "path" },
      { name = "buffer" },
    }),

    preselect = cmp.PreselectMode.None,

    formatting = {
      format = require("lspkind").cmp_format({
        mode = "symbol_text",
        maxwidth = 50,
        ellipsis_char = "...",
        show_labelDetails = true,
        menu = {
          buffer = "[Buf]",
          nvim_lsp = "[LSP]",
          snippet = "[Snip]",
          nvim_lua = "[Lua]",
          nvim_lsp_signature_help = "[Sig]",
        },
      }),
    },

    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },

    -- window = {
    --   completion = cmp.config.window.bordered(),
    --   documentation = cmp.config.window.bordered(),
    -- },

    mapping = {
      ["<c-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
      ["<c-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
      ["<c-b>"] = cmp.mapping.scroll_docs(-4),
      ["<c-f>"] = cmp.mapping.scroll_docs(4),

      ["<s-tab>"] = if_cmp_visible(cmp.select_prev_item),
      ["<tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          if #cmp.get_entries() == 1 then
            cmp.confirm({ select = true })
          else
            cmp.select_next_item()
          end
        elseif vim.snippet.active({ direction = 1 }) then
          vim.snippet.jump(1)
        elseif has_words_before() then
          cmp.complete()
          if #cmp.get_entries() == 1 then
            cmp.confirm({ select = true })
          end
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<s-cr>"] = if_cmp_visible(function()
        cmp.confirm({ select = true })
      end),

      ["<cr>"] = cmp.mapping({
        i = function(fallback)
          -- If I select a completion item with <cr>, then I also want the newline
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }, function()
              fallback()
            end)
          else
            fallback()
          end
        end,
        s = cmp.mapping.confirm({ select = true }),
        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      }),
    },

    view = {
      entries = { name = "custom" },
    },

    experimental = {
      ghost_text = {}, -- { hl_group = "something" }
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
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "onsails/lspkind.nvim" },
    },
  },
}
