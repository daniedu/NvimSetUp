return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
	opts = {
		ensure_installed = {
			"stylua",
			"shfmt",
			"prettier",
			"prettierd",
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
		local mr = require("mason-registry")

		-- This handles the "Non-LSP" tools (Formatters/Linters)
		for _, tool in ipairs(opts.ensure_installed) do
			local p = mr.get_package(tool)
			if not p:is_installed() then
				p:install()
			end
		end
	end,
}
