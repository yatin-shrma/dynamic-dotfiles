return {
  "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    config = function()
        local function transparent()
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
            --vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { bg = "none" }) -- Optional: makes the sidebar border line transparent too
        end


        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = transparent,
        })


        vim.cmd.colorscheme "catppuccin-mocha"
    end

}

--return{
--    "rebelot/kanagawa.nvim",
--
--    config = function()
--        vim.cmd("colorscheme kanagawa-dragon")
--    end
--}
