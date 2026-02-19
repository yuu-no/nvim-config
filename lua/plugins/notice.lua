return {
  "folke/noice.nvim",
  optional = true,
  opts = {
    presets = { inc_rename = true },
    routes = {
      {
        filter = { event = "msg_show", kind = "shell_out", find = "^grep" },
        skip = true,
      },
    },
  },
}
