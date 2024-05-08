return {
  -- can probably remove some of these, but I'll see next time I actually use these filetypes
  { 'guns/vim-clojure-static', ft = { "clojure" } },
  { 'Olical/conjure', ft = { 'clojure' } },
  { 'eraserhd/parinfer-rust', ft = { "clojure", "lisp" }, build = 'cargo build --release' },
  { 'lervag/vimtex', ft = { 'tex', 'latex' } },
}
