require("catppuccin").setup({
    transparent_background = true,
    term_colors = true,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
    },
    color_overrides = {},
    custom_highlights = {},
})

vim.api.nvim_command("colorscheme catppuccin-mocha")

vim.cmd([[
hi TelescopePromptBorder guifg=#f38ba8 guibg=#1e1e2e
hi TelescopePromptNormal  guifg=#f38ba8 guibg=#1e1e2e
hi TelescopePromptTitle  guifg=#f38ba8 guibg=#1e1e2e
hi TelescopePromptPrefix  guifg=#f38ba8 guibg=#1e1e2e
hi TelescopePromptCounter  guifg=#f38ba8 guibg=#1e1e2e
hi TelescopePreviewTitle  guifg=#a6e3a1 guibg=#1e1e2e
hi TelescopePreviewBorder guifg=#a6e3a1 guibg=#1e1e2e
hi TelescopeResultsTitle  guifg=#a6e3a1 guibg=#1e1e2e
hi TelescopeResultsBorder guifg=#a6e3a1 guibg=#1e1e2e
hi TelescopeMatching guifg=#f9e2af guibg=#1e1e2e
hi TelescopeSelection guifg=#ffffff guibg=#181825
]])
-- Term
vim.cmd([[
hi FloatBorder guifg=#f38ba8 guibg=#1e1e2e
hi NormalFloat guibg=#1e1e2e
]])

vim.opt.laststatus = 3
vim.opt.fillchars:append({
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┨',
    vertright = '┣',
    verthoriz = '╋',
})

require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true},
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = true,       -- adjust window separators highlight for laststatus=3
    terminalColors = true,      -- define vim.g.terminal_color_{0,17}
    colors = {},
    overrides = {},
    theme = "default"           -- Load "default" theme or the experimental "light" theme
})

vim.api.nvim_command("colorscheme kanagawa")
