return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "eslint_d", "prettier" },
        typescript = { "eslint_d", "prettier" },
        typescriptreact = { "eslint_d", "prettier" },
        json = { lsp_format = "never" },
        perl = { "trim_whitespace" },
      },
    },
    enable = false,
  },
}
