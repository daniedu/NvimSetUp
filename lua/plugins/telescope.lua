return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8', -- or,
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup {
      defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          -- Mappings for insert mode (when you're typing in the prompt)
          i = {
            ["<C-n>"] = "move_selection_next",     -- Move to next item
            ["<C-p>"] = "move_selection_previous", -- Move to previous item
            ["<C-j>"] = "move_selection_next",     -- Same as <C-n>
            ["<C-k>"] = "move_selection_previous", -- Same as <C-p>

            ["<C-q>"] = "send_to_qflist",          -- Send multiple selections to quickfix list
            ["<C-h>"] = "which_key",               -- Your existing mapping
            ["<C-c>"] = "close",                   -- Close the picker without selecting anything
          },

          -- Mappings for normal mode (after you hit <C-n> or <C-p> to navigate)
          n = {
            ["<C-q>"] = "send_to_qflist",    -- Send multiple selections to quickfix list
            ["<C-s>"] = "select_horizontal", -- Open selection in horizontal split
            ["<C-v>"] = "select_vertical",   -- Open selection in vertical split
            ["<C-t>"] = "select_tab",        -- Open selection in a new tab
          },
        }
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
      }
    }
  end
}
