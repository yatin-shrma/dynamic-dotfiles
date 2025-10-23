return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.codespell,
                null_ls.builtins.diagnostics.codespell,
                null_ls.builtins.diagnostics.cppcheck,
                --- @null_ls.builtins.diagnostics.emmet_language_server,
                null_ls.builtins.hover.dictionary,
            },
            debug = false,
        })
        vim.keymap.set("n", "<leader>s", vim.lsp.buf.format, {})
    end,
}
