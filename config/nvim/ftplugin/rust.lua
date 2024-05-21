require("utils").onsave("RUST_FMT", function(args)
  require("conform").format({ buffnr = args.buf })
end)
