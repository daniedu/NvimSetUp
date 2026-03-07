return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- 1. Setup default capabilities for nvim-cmp
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- 2. Configure servers via the NEW native vim.lsp.config API
		-- This defines the "how", but doesn't start them yet.

		-- TypeScript / React config
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			settings = {
				typescript = { suggest = { autoImports = true } },
				javascript = { suggest = { autoImports = true } },
			},
		})

		-- Lua config
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = { checkThirdParty = false },
				},
			},
		})

		-- Emmet config
		vim.lsp.config("emmet_ls", {
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "php" },
		})

		-- 3. Setup Mason
		require("mason").setup()

		-- 4. Setup Mason-LSPConfig (v2.0.0+ way)
		-- This is the "automatic_enable" that replaces the old handlers logic.
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"html",
				"cssls",
			},
			-- This is the magic line that replaces setup_handlers()
			automatic_enable = true,
		})

		-- 5. LSP Keymaps on attach
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local opts = { buffer = args.buf }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			end,
		})
	end,
}
