return {
  "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,

    config = function()
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
