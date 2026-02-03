return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(opt)
      opt.ensure_installed = {}
      opt.auto_install = false

      return opt
    end,
  },
}
