vim.o.termguicolors  = true                  -- use gui colors in terminal
vim.o.regexpengine   = 2                     -- use new regex engine.  maybe slower sometimes?
vim.o.conceallevel   = 0                     -- show text normally
vim.o.smartindent    = true                  -- still smart
vim.o.shiftwidth     = 2                     -- width of line-initial tab, maybe some other stuff
vim.o.shiftround     = false                 -- always indent to a multiple of shiftwidth
vim.o.softtabstop    = 2                     -- 2 space tabs (soft)  Tab settings are mostly set in filetype-specfic settings anyway
vim.o.tabstop        = 2                     -- 2 space tabs (hard)
vim.o.expandtab      = true                  -- use soft tabs
vim.o.mouse          = "nv"                  -- let the mouse do stuff
vim.o.backspace      = "indent,eol,nostop"   -- make backspace work like it should
vim.o.scrolloff      = 10                    -- rows on either side of the cursor when scrolling
vim.o.splitright     = true                  -- open new vertical splits on the right side
vim.o.splitbelow     = true                  -- open new horizontal splits on the bottom
vim.o.smartcase      = true                  -- case-insensitive searching
vim.o.winwidth       = 50                    -- dumb setting
vim.o.winminwidth    = 50                    -- minimum window width.  makes ^W| useful
vim.o.winheight      = 16                    -- also dumb
vim.o.wildmode       = "longest,list"        -- show menu for tab-completion
vim.o.completeopt    = "menuone"             -- and just the menu
vim.o.foldlevelstart = 99                    -- forces folds open by default
vim.o.foldenable     = true                  -- enable fold
vim.o.joinspaces     = false                 -- don't use two spaces after a . when joining lines
vim.o.grepprg        = "ag --vimgrep"        -- better than grep
vim.o.background     = "dark"                -- dark terminals 4 lyfe
vim.o.lazyredraw     = true                  -- don't redraw while executing macros or that sort of thing
vim.o.title          = true                  -- set window title
vim.o.errorbells     = false                 -- DESTROY ALL BELLS
vim.o.showmatch      = true                  -- highlight matching brackets
vim.o.showtabline    = 1                     -- only show file tabs when more than one file open
vim.o.backupdir      = "/tmp,/var/tmp,~/tmp" -- keep backup files in one place instead of next to the file
vim.o.directory      = "/tmp,/var/tmp,~/tmp" -- directory to keep swap files in
vim.o.number         = true                  -- show line numbers
vim.o.listchars      = "tab:»·,trail:·"      -- when 'list' option set, show hard tabs and trailing spaces
vim.o.formatoptions  = "croqlj"              -- see :h fo-table
vim.o.hlsearch       = true
vim.o.incsearch      = true
vim.o.clipboard      = "unnamed"             -- use osx clipboard
vim.o.undodir        = "/tmp/vim-undo"
vim.o.undofile       = true
vim.o.termguicolors  = true
vim.o.signcolumn     = "yes"                 -- don't collapse sign column. To prevent annoying flicker of text moving side to side

vim.o.commentstring = "# %s"

vim.o.foldmethod="expr"
vim.o.foldexpr="nvim_treesitter#foldexpr()"
vim.o.nofoldenable = true

vim.g.python_highlight_all = 1
