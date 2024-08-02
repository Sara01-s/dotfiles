return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first

    config = function()
        vim.cmd("colorscheme onedark")

        local colors = {
            onedark = { bg = "#1D1D2D", fg = "#1D1D2D" },
        }

        vim.api.nvim_set_hl(0, "Normal", { bg = colors.onedark.bg })

        vim.api.nvim_set_hl(0, "LineNr", { fg = "#4A4A56", bg = colors.onedark.bg })
        vim.api.nvim_set_hl(0, "SignColumn", { fg = colors.onedark.fg, bg = colors.onedark.bg })
    end
}
