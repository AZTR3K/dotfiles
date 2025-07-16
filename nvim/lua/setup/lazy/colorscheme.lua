return {
    {
        "Skardyy/makurai-nvim",
        config = function()
            -- you don't have to call setup
            require "makurai".setup({
                transparent = true, -- removes the bg color
                bordered = false    -- removes the bg color from floats/popups
            })

            vim.cmd.colorscheme("makurai_dark")
            -- Transparency and layout polish
            vim.opt.colorcolumn = ""
            vim.cmd [[ highlight VertSplit guibg=NONE ctermbg=NONE ]]
        end
    },
    {
        'folke/tokyonight.nvim',
        config = function()
            require('tokyonight').setup({
                style = 'storm',
                transparent = true,
                terminal_colors = true,
                styles = {
                    sidebar = 'dark',
                    float = 'dark',
                },
            })
        end
    },

    {
        'rose-pine/neovim',
        name = 'rose-pine',
    }
}
