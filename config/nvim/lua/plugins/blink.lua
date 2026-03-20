-- ~/.config/nvim/lua/plugins/blink.lua
return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    version = "*", -- Always use the latest stable release

    opts = {
        -- 'default' maps <C-space> to trigger, <C-n>/<C-p> to navigate, and <CR> to accept.
        -- You can change this to 'super-tab' if you prefer using Tab for everything.
        keymap = { preset = "super-tab" },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        -- Strictly local and deterministic sources. No Copilot, no Codeium.
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        -- Automatically show function parameter documentation as you type
        signature = { enabled = true },
    },
}
