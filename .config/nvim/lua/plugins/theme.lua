-- return {
--   "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--
--     transparent_background = true,
--     config = function()
--         vim.cmd.colorscheme "catppuccin-mocha"
--     end
--
-- }

--return{
--    "rebelot/kanagawa.nvim",
--
--    config = function()
--        vim.cmd("colorscheme kanagawa-dragon")
--    end
--}
--

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false, -- Ensures the colorscheme loads immediately on startup
    config = function()
        require("catppuccin").setup({
            flavour = "mocha", -- Explicitly sets your preferred mocha flavor
            transparent_background = true, -- Natively enables transparency for core UI & integrated statuslines
            integrations = {
                neotree = true,
            },
            -- Safe palette overrides for your custom NeoTree requirements
            custom_highlights = function(colors)
                return {
                    NeoTreeNormal       = { bg = "none" },
                    NeoTreeNormalNC     = { bg = "none" },
                    NeoTreeWinSeparator = { bg = "none" },
                }
            end,
        })

        vim.cmd.colorscheme "catppuccin-mocha"
    end
}
