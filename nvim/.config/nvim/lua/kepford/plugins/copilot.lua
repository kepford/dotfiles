return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot", -- lazy-load when you run :Copilot
	event = "InsertEnter", -- or load on Insert mode
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true, -- trigger suggestions as you type
				debounce = 75,
				keymap = {
					accept = "<M-l>", -- alt + l to accept
					next = "<M-]>", -- alt + ]
					prev = "<M-[>", -- alt + [
					dismiss = "<C-]>",
				},
			},
			panel = {
				enabled = true,
				auto_refresh = true,
				keymap = {
					open = "<M-p>", -- open Copilot panel
				},
			},
			filetypes = {
				markdown = true,
				help = false,
				gitcommit = true,
				["*"] = true,
			},
		})
	end,
}
