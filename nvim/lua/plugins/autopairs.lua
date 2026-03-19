-- ~/.config/nvim/lua/plugins/autopairs.lua
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- Only load this when you actually start typing
    config = true,         -- Automatically run the default setup function
}
