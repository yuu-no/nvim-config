return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { lsp_format = "never" },
        perl = { "trim_whitespace" },
      },
    },
  },
}
