local options = {
  mode = "float",
  float = {
    border = "single"
  },
  filetype = {
    python = "python -u",
    javascript = "node",
    typescript = "tsx",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
    },
  },
}

return options
