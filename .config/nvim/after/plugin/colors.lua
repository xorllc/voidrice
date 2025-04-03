-- require("rose-pine").setup({
-- 	disable_italics = true,
-- 	disable_background = true,
-- 	highlight_groups = {
-- 		Comment = { italic = true }
-- 	},
-- })
-- 
-- function ColorMyPencils(color)
-- 	color = color or "rose-pine"
-- 	vim.cmd.colorscheme(color)
-- 
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end
-- 
-- ColorMyPencils()

-- local overrides = {
--    Comment = { fg = "#928374" },
--    Constant = { fg = "#d3869b" },
--    Delimiter = { fg = "#bdae93" },
--    EndOfBuffer = { fg = "#504945" },
--    FloatBorder = { fg = "#665c54" },
--    Identifier = { fg = "#83a598" },
--    IncSearch = { fg = "#000000", bg = "#fe8019" },
--    LineNr = { fg = "#7c6f64" },
--    MatchParen = { fg = "#000000", bg = "#000000" },
--    Normal = { fg = "#ebdbb2", bg ="#000000" },
--    NormalFloat = { bg ="#504945" },
--    Operator = { fg = "#ebdbb2" },
--    Pmenu = { bg = "#504945" },
--    PmenuSel = { bg ="#83a598" },
--    PreProc = { fg = "#8ec07c" },
--    Search = { fg = "#000000", bg = "#fabd2f" },
--    Special = { fg = "#fe8019" },
--    SpecialChar = { fg = "#fb4934" },
--    SpecialKey = { fg = "#a89984" },
--    StatusLine = { bg = "#504945" },
--    String = { fg = "#b8bb26" },
--    Structure = { fg = "#8ec07c" },
--    TSAttribute = { fg = "#8ec07c" },
--    TSPunctDelimiter = { fg = "#bdae93" },
--    TabLineFill = { fg = "#776b61", bg = "#3c3836" },
--    TabLineSel = { fg = "#b8bb26", bg = "#3c3836" },
--    Title = { fg = "#b8bb26" },
--    Type = { fg = "#fabd2f" },
--    Underlined = { fg = "#83a598" },
--    VertSplit  = { bg = "NONE" },
--    Visual = { bg = "#665c54" }
--}

-- Default options:
require('kanagawa').setup({
    overrides = overrides,
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = false },
    functionStyle = {},
    keywordStyle = { italic = false },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
    return {
	    MatchParen = { fg = "#000000", bg = "#665c54" },
	    Visual = { bg = "#363432" },
    }
    end,
    theme = "dragon",              -- Load "wave" theme
    background = {               -- map the value of 'background' option to a theme
        dark = "dragon",           -- try "dragon" !
        light = "lotus"
    },
})


-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
