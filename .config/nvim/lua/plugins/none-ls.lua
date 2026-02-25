return {
    "nvimtools/none-ls.nvim",
    lazy = true,

    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.codespell,
                null_ls.builtins.diagnostics.codespell,
                null_ls.builtins.hover.dictionary,
            },
            debug = false,
        })
    end,
}
