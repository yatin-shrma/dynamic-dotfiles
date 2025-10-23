return {
    "m4xshen/autoclose.nvim",
    config = function()
        local configs = require("autoclose")
        configs.setup({
            keys = {
                --["<"] = { escape = false, close = true, pair = "<>", disabled_filetypes = {} },
                ["{"] = { escape = false, close = true, pair = "{}", disabled_filetypes = {} },
                ["["] = { escape = false, close = true, pair = "[]", disabled_filetypes = {} },
                ["("] = { escape = false, close = true, pair = "()", disabled_filetypes = {} },
                ["'"] = { escape = false, close = true, pair = "''", disabled_filetypes = {} },
                ['"'] = { escape = false, close = true, pair = '""', disabled_filetypes = {} },
            },
        })
    end
}
