local options = {
  mode = "float",
  float = {
    border = "single",
  },
  filetype = {
    python = "python -u",
    javascript = "node",
    typescript = "tsx",
    go = "go run",
    lua = "lua",
    zig = "zig run",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt",
    },
  },
}

return options
