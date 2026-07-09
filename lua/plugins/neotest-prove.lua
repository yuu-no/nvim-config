return {
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      {
        "yuu-no/neotest-prove",
        dir = vim.fn.expand("~/ghq/github.com/yuu-no/neotest-prove"),
      },
    },
    opts = {
      adapters = {
        ["neotest-prove"] = {},
      },
      status = { virtual_text = false },
    },
  },
}
