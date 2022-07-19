local iron = require('iron.core')

iron.setup {
  config = {
    repl_definition = {
      pgsql = {
        command = {"psql"}
      },
    },
  },

  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_line = "<space>sl",
    send_mark = "<space>s.",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  }
}