return {
    {
        "rebelot/kanagawa.nvim",
        build = ":KanagawaCompile",
        lazy = false,
        priority = 1000,
        config = function()
            vim.opt.termguicolors = true

            local kanagawa = require("kanagawa")
            kanagawa.setup({
                transparent = true,
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none",
                            },
                        },
                    },
                },
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        LineNr = { fg = "grey" },
                        LspInlayHint = { fg = theme.ui.fg_dim, bg = theme.ui.bg },
                    }
                end,
            })
            kanagawa.load()
            vim.filetype.add({
                extension = {
                    tt = "tt2html",
                    t = "perl",
                },
                filename = {

                    ["tsconfig.json"] = "jsonc",
                },
                pattern = {
                    ["*/fluentd/*.conf"] = "fluentd",
                },
            })
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "kanagawa",
        },
    }
}
