-- 1. Functional Palette (Matches your main theme logic)
local functional_colors = {
    bg             = "NONE",    -- Keeping it transparent
    text_main      = "#F2F0F7", -- High contrast for blurred bg
    text_dim       = "#676B8D", 
    dark_inner     = "#120B1A", -- For text inside the colored "pills"
    
    -- Mode-based colors
    primary        = "#9575CD", -- Amethyst (Normal)
    accent         = "#80DEEA", -- Cyan/Frost (Insert)
    warning        = "#FFD180", -- Amber (Replace)
    danger         = "#FF5252", -- Red (Visual / HTML Tag match)
    command        = "#B388FF", -- Electric Purple (Command)
}

-- 2. Define the theme using functional keys
local amethyst_functional_theme = {
    normal = {
        a = { fg = functional_colors.dark_inner, bg = functional_colors.primary, gui = 'bold' },
        b = { fg = functional_colors.text_main,  bg = "#311B92" }, -- Deep purple contrast
        c = { fg = functional_colors.text_main,  bg = "NONE" }, 
    },
    insert  = { a = { fg = functional_colors.dark_inner, bg = functional_colors.accent, gui = 'bold' } },
    visual  = { a = { fg = functional_colors.dark_inner, bg = functional_colors.danger, gui = 'bold' } },
    replace = { a = { fg = functional_colors.dark_inner, bg = functional_colors.warning, gui = 'bold' } },
    command = { a = { fg = functional_colors.dark_inner, bg = functional_colors.command, gui = 'bold' } },
    inactive = {
        a = { fg = functional_colors.text_dim, bg = "NONE" },
        b = { fg = functional_colors.text_dim, bg = "NONE" },
        c = { fg = functional_colors.text_dim, bg = "NONE" },
    },
}

-- 3. The Lazy.nvim plugin specification
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require('lualine').setup({
            options = {
                theme = amethyst_functional_theme,
                component_separators = '',
                section_separators = '',
                globalstatus = true,
                disabled_filetypes = { statusline = { "alpha", "dashboard", "NvimTree" } },
            },
            sections = {
                lualine_a = {
                    { 'mode', separator = { left = '', right = '' }, right_padding = 2 },
                },
                lualine_b = {
                    { 'branch', icon = '', separator = { left = '', right = '' } },
                    { 'diff', separator = { right = '' } },
                },
                lualine_c = {
                    { 'filename', file_status = true, path = 1 },
                },
                lualine_x = {
                    { 'diagnostics', sources = { 'nvim_lsp' } },
                    'encoding',
                },
                lualine_y = {
                    { 'filetype', separator = { left = '' } },
                },
                lualine_z = {
                    { 'location', separator = { left = '', right = '' } },
                },
            },
        })
    end
}
