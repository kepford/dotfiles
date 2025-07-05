return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	setup = {
		-- Mimic org-indent-mode behavior by indenting everything under a heading based on the
		-- level of the heading. Indenting starts from level 2 headings onward.
		indent = {
			-- Turn on / off org-indent-mode
			enabled = false,
			-- Amount of additional padding added for each heading level
			per_level = 2,
			-- Heading levels <= this value will not be indented
			-- Use 0 to begin indenting from the very first level
			skip_level = 1,
			-- Do not indent heading titles, only the body
			skip_heading = false,
		},
	},
}
