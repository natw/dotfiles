local iron = require('iron')

iron.core.add_repl_definitions {
  pgsql = {
    psql = {
      command = {"psql"}
    },
  },
}
