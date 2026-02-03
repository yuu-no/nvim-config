return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = {}
    end,
  },
  {
    "nvim-lspconfig",
    opts = {
      servers = {
        nil_ls = { mason = false },
        eslint = { mason = false },
        vtsls = {
          mason = false,
          -- root_dir = function(fname)
          --   return require("lspconfig.util").root_pattern("package.json")(fname)
          -- end,
        },
        -- denols = {
        --   mason = false,
        --   root_dir = function(fname)
        --     return require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")(fname)
        --   end,
        -- },
        perlnavigator = {
          mason = false,
          cmd_env = vim.uv.fs_stat(".carmel") and {
            PERL5OPT = "-MCarmel::Setup",
          } or nil,
          settings = {
            perlnavigator = {
              parlPath = "/fout/perl/centos7_perl-5.38.2/bin/perl",
              perltidyEnabled = false,
              includePaths = {
                "lib",
                "t/lib",
                ".",
                "extlib/local/lib/perl5",
                "extlib/vendor/lib/perl5",
              },
            },
          },
        },
        lua_ls = {
          mason = false,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              runtime = {
                version = "LuaJIT",
                pathStrict = true,
                path = { "?.lua", "?/init.lua" },
              },
              workspace = {
                library = {
                  vim.env.VIMRUNTIME .. "/lua",
                  vim.fn.stdpath("config") .. "/lua",
                  "${3rd}/luv/library",
                  "${3rd}/busted/library",
                  "${3rd}/luassert/library",
                },
                checkThirdParty = "Disable",
              },
              hint = {
                enable = true,
              },
            },
          },
        },
      },
    },
  },
}
