return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  dependencies = {
    "mason-org/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- LSP keymaps on attach
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
        end

        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gr", vim.lsp.buf.references, "Go to references")
        map("gI", vim.lsp.buf.implementation, "Go to implementation")
        map("gy", vim.lsp.buf.type_definition, "Go to type definition")
        map("gD", vim.lsp.buf.declaration, "Go to declaration")
        map("K", vim.lsp.buf.hover, "Hover documentation")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("<leader>ds", vim.lsp.buf.document_symbol, "Document symbols")
        map("<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace symbols")
      end,
    })

    -- Server-specific settings
    vim.lsp.config("emmet_ls", {
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "php" },
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    -- Set capabilities for all servers
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",
        "intelephense",
        "tailwindcss",
        "html",
        "cssls",
        "emmet_ls",
        "jsonls",
        "lua_ls",
      },
      automatic_enable = true,
    })

  end,
}
