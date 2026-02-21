return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	version = false, -- usa el master de treesitter
	build = ":TSUpdate",
	-- Usamos eventos nativos para evitar el error anterior
	event = { "BufReadPost", "BufNewFile", "VeryLazy" },
	config = function()
		local configs = require("nvim-treesitter.config")
		configs.setup({
			-- Ensure these are installed
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"javascript",
				"python",
				"typescript",
				"tsx",
				"html",
				"css",
				"scss",
				"php",
				"php_only",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"markdown_inline",
				"bash",
				"dockerfile",
				"regex",
				"sql",
			},
			highlight = { enable = true, additional_vim_regex_highlighting = false }, -- You MUST explicitly enable this now
			indent = { enable = true },
		})
	end,
}
