-- ~/.config/nvim/lua/plugins/noice.lua
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		presets = {
			command_palette = true,
		},
		messages = {
			enabled = false,
		},
		notify = {
			enabled = false,
		},
		popupmenu = {
			enabled = false,
		},
		lsp = {
			progress = {
				enabled = false,
			},
		},
	},
}
