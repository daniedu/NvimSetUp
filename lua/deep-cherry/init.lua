local M = {}

local functional_colors = {
	-- Base UI
	bg = "NONE",
	fg = "#F2F0F7", -- Bright, clean off-white
	dimmed = "#8B7FAF", -- For comments/line numbers (soft purple)

	-- Branding / Main Theme
	primary = "#9575CD", -- Amethyst
	primary_light = "#D1C4E9", -- Soft Lavender for functions/italics
	selection = "#4527A0", -- Deep Purple for visual selection

	-- Syntax Functions
	tag = "#FF5252", -- Vibrant Red for HTML tags (per request)
	keyword = "#B388FF", -- Electric Purple
	string = "#80DEEA", -- Cyan (pops beautifully against blur)
	number = "#FFD180", -- Soft Orange/Amber
	call = "#B39DDB", -- Lighter Amethyst for functions
	variable = "#F2F0F7", -- Match FG
	property = "#CE93D8", -- Pinkish Purple
	operator = "#82B1FF", -- Soft Blue

	-- UI Accents
	border = "#5E35B1",
	float_bg = "#120B1A", -- Darker base for legibility in popups
	git_add = "#B9F6CA", -- Mint Green
	git_change = "#80D8FF", -- Sky Blue
}

function M.colorScheme()
	vim.cmd("highlight clear")
	vim.cmd("syntax reset")
	vim.o.background = "dark"
	vim.g.colors_name = "functional-amethyst"

	local set = vim.api.nvim_set_hl

	-- 1. Core UI
	set(0, "Normal", { fg = functional_colors.fg, bg = "NONE" })
	set(0, "LineNr", { fg = functional_colors.dimmed })
	set(0, "CursorLine", { bg = "#251B33" })
	set(0, "Visual", { bg = functional_colors.selection })
	set(0, "Search", { fg = "#000000", bg = functional_colors.primary_light })

	-- 2. Standard Syntax (Vim)
	set(0, "Comment", { fg = functional_colors.dimmed, italic = true })
	set(0, "Keyword", { fg = functional_colors.keyword, bold = true })
	set(0, "Function", { fg = functional_colors.call })
	set(0, "String", { fg = functional_colors.string })
	set(0, "Number", { fg = functional_colors.number })
	set(0, "Statement", { fg = functional_colors.keyword })
	set(0, "Type", { fg = functional_colors.primary })

	-- 3. Treesitter (Modern)
	set(0, "@variable", { fg = functional_colors.variable })
	set(0, "@keyword", { fg = functional_colors.keyword, bold = true })
	set(0, "@function", { fg = functional_colors.call })
	set(0, "@function.builtin", { fg = functional_colors.call, italic = true })
	set(0, "@parameter", { fg = functional_colors.primary_light, italic = true })
	set(0, "@string", { fg = functional_colors.string })
	set(0, "@constant", { fg = functional_colors.number })
	set(0, "@property", { fg = functional_colors.property })
	set(0, "@field", { fg = functional_colors.property })
	set(0, "@tag", { fg = functional_colors.tag, bold = true }) -- HTML Tags
	set(0, "@tag.delimiter", { fg = functional_colors.dimmed })

	-- 4. Floating Windows & UI Elements
	set(0, "NormalFloat", { bg = functional_colors.float_bg })
	set(0, "FloatBorder", { fg = functional_colors.border, bg = functional_colors.float_bg })
	set(0, "StatusLine", { fg = functional_colors.fg, bg = "#1A1423" })
	set(0, "WinSeparator", { fg = functional_colors.border, bg = "NONE" })

	-- 5. Extra Details
	set(0, "GitSignsAdd", { fg = functional_colors.git_add })
	set(0, "GitSignsChange", { fg = functional_colors.git_change })
	set(0, "GitSignsDelete", { fg = functional_colors.tag })

	set(0, "@punctuation.bracket", { fg = functional_colors.primary_light })
	set(0, "@punctuation.delimiter", { fg = functional_colors.primary_light })
	set(0, "Operator", { fg = functional_colors.operator })
	set(0, "Directory", { fg = functional_colors.primary, bold = true })

	-- NvimTree
	set(0, "NvimTreeFolderIcon", { fg = functional_colors.primary })
	set(0, "NvimTreeFolderName", { fg = functional_colors.fg })
	set(0, "NvimTreeIndentMarker", { fg = functional_colors.border })

	-- Telescope Floating UI
	set(0, "TelescopeBorder", { fg = functional_colors.fg })
	set(0, "TelescopePromptBorder", { fg = functional_colors.fg })
	set(0, "TelescopePromptTitle", { fg = functional_colors.fg, bg = functional_colors.primary })
	set(0, "TelescopePreviewTitle", { fg = functional_colors.fg, bg = functional_colors.primary })

	-- Selection inside Telescope
	set(0, "TelescopeSelection", { bg = functional_colors.selection, fg = functional_colors.fg })
	set(0, "TelescopeMatching", { fg = functional_colors.primary_light, bold = true })
end

return M
