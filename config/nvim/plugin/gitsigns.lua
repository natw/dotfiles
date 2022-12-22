require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    -- get blame info for that line
    vim.keymap.set('n', '<leader>gb', function()
      gs.blame_line{full=true}
    end, { buffer = bufnr })

    -- see a proper diff of the whole file
    vim.keymap.set('n', '<leader>gd', function()
      gs.diffthis()
    end, { buffer = bufnr })
  end
}
