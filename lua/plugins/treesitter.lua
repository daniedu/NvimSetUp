-- lua/plugins/treesitter.lua
return {
  -- The plugin specification
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  -- The config function for setting up the plugin
  config = function()
    require('nvim-treesitter.config').setup({
      -- A list of languages to install.
      -- You can add or remove languages you work with here.
      ensure_installed = {
        "c",
        -- "c_sharp",
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "markdown",
        "jsdoc",
        "javascript",
        "typescript",
        "json",
        "yaml",
        "jsx",
        "tsx",
        "html",
        "css",
      },

      -- Install languages synchronously (only applied when `ensure_installed` is changed)
      sync_install = false,

      -- Automatically install missing parsers when you open a file of that type
      auto_install = true,

      -- Enable syntax highlighting
      highlight = {
        enable = true,
      },

      -- Enable indentation
      indent = {
        enable = true,
      },

      -- You can also enable incremental selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<leader>si',
          node_incremental = '<leader>sn',
          scope_incremental = '<leader>ss',
          node_decremental = '<leader>sd',
        },
      },
    })
  end,
}
