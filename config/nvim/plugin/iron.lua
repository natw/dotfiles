local iron = require('iron.core')

iron.setup {
  config = {
    repl_definition = {
      sql = {
        command = {"psql"}
      },
      pgsql = {
        command = {"psql"}
      },
    },
  },

  keymaps = {
    send_motion = "<leader>sc",
    visual_send = "<leader>sc",
    send_line = "<leader>sl",
    send_mark = "<leader>s.",
    cr = "<leader>s<cr>",
    interrupt = "<leader>s<space>",
    exit = "<leader>sq",
    clear = "<leader>cl",
  }
}

vim.api.nvim_buf_set_keymap(0, 'v', '<leader>ss', '<cmd>lua require("iron.core").visual_send()<cr>', { noremap=true, silent=true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ss', '<cmd>lua require("iron.core").send_motion("ip")<cr>', { noremap=true, silent=true })
