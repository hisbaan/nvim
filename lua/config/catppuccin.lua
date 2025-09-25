return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            float = {
                transparent = false, -- enable transparent floating windows
                solid = false, -- use solid styling for floating windows, see |winborder|
            },
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = {
                -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false,
            show_end_of_buffer = false, -- show the '~' characters after the end of buffers
            term_colors = false,
            dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.15,
            },
            no_italic = false, -- Force no italic
            no_bold = false,   -- Force no bold
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
            color_overrides = {
                mocha = {
                    -- rosewater = "#F5E0DC",
                    -- flamingo = "#F2CDCD",
                    -- mauve = "#DDB6F2",
                    -- pink = "#F5C2E7",
                    -- red = "#F28FAD",
                    -- maroon = "#E8A2AF",
                    -- peach = "#F8BD96",
                    -- yellow = "#FAE3B0",
                    -- green = "#ABE9B3",
                    -- blue = "#96CDFB",
                    -- sky = "#89DCEB",
                    -- teal = "#B5E8E0",
                    -- lavender = "#C9CBFF",

                    -- warmer surface
                    text = "#D9E0EE",
                    subtext1 = "#BAC2DE",
                    subtext0 = "#A6ADC8",
                    overlay2 = "#C3BAC6",
                    overlay = "#988BA2",
                    overlay0 = "#6E6C7E",
                    surface2 = "#6E6C7E",
                    surface1 = "#575268",
                    surface0 = "#302D41",
                    mantle = "#1F1D2E",
                    crust = "#161320", -- darker base
                    base = "#191724",
                    subbase = "#12111B",
                    subsubbase = "#0D0C13",
                },
            },
            highlight_overrides = {
                mocha = function(cp)
                    return {
                        Comment = { fg = cp.overlay0 },
                        ["@comment"] = { fg = cp.overlay0 },
                        -- Float
                        FloatBorder = { fg = cp.overlay0 },
                        NormalFloat = { bg = cp.base },
                        -- Toggle term
                        ToggleTerm1FloatBorder = { fg = cp.overlay0 },
                        -- Telescope
                        TelescopeBorder = { fg = cp.overlay0 },
                        TelescopeSelection = { bg = cp.surface0 },
                        TelescopeMatching = { fg = cp.flamingo },
                        TelescopeSelectionCaret = { bg = cp.surface0 },
                        -- Folds
                        UfoFoldedBg = { bg = cp.mantle },
                        UfoFoldedEllipsis = { fg = cp.surface2, bg = cp.mantle },
                        Folded = { bg = cp.mantle },
                        Visual = { bg = cp.surface0 },
                        -- org-bullets
                        OrgBulletsDash = { fg = cp.flamingo, link = nil },
                        OrgBulletsPlus = { fg = cp.flamingo, link = nil },
                        OrgBulletsStar = { fg = cp.flamingo, link = nil },
                        -- barbar.nvim
                        BufferCurrent = { bg = cp.base, fg = cp.text },
                        BufferCurrentIndex = { bg = cp.base, fg = cp.blue },
                        BufferCurrentMod = { bg = cp.base, fg = cp.green },
                        BufferCurrentSign = { bg = cp.base, fg = cp.lavender },
                        BufferCurrentTarget = { bg = cp.base, fg = cp.red },
                        -- snacks.nvim
                        SnacksIndentScope = { fg = cp.mauve },
                        SnacksIndent = { fg = cp.surface0 },
                        SnacksBackdrop = { bg = cp.base },
                        SnacksBackdrop_000000 = { bg = cp.base },
                        -- inlay hints
                        LspInlayHint = { bg = "NONE", fg = cp.overlay0 },
                        --
                        ---@diagnostic disable: undefined-field
                        BufferInactive = { bg = cp.subbase, fg = cp.surface1 },
                        BufferInactiveIndex = { bg = cp.subbase, fg = cp.blue },
                        BufferInactiveMod = { bg = cp.subbase, fg = cp.green },
                        BufferInactiveSign = { bg = cp.subbase, fg = cp.subbase },
                        BufferInactiveTarget = { bg = cp.subbase, fg = cp.red },
                        --
                        BufferVisible = { bg = cp.subbase, fg = cp.text },
                        BufferVisibleIndex = { bg = cp.subbase, fg = cp.blue },
                        BufferVisibleMod = { bg = cp.subbase, fg = cp.green },
                        BufferVisibleSign = { bg = cp.subbase, fg = cp.subbase },
                        BufferVisibleTarget = { bg = cp.subbase, fg = cp.red },
                        --
                        BufferTabpageFill = { bg = cp.subsubbase },
                        ---@diagnostic enable: undefined-field
                    }
                end,
            },
            custom_highlights = function(C)
                local O = require("catppuccin").options
                return {
                    ["@variable.member"] = { fg = C.lavender },                                         -- For fields.
                    ["@module"] = { fg = C.lavender, style = O.styles.miscs or { "italic" } },          -- For identifiers referring to modules and namespaces.
                    ["@string.special.url"] = { fg = C.rosewater, style = { "italic", "underline" } },  -- urls, links and emails
                    ["@type.builtin"] = { fg = C.yellow, style = O.styles.properties or { "italic" } }, -- For builtin types.
                    ["@property"] = { fg = C.lavender, style = O.styles.properties or {} },             -- Same as TSField.
                    ["@constructor"] = { fg = C.sapphire },                                             -- For constructor calls and definitions: = { } in Lua, and Java constructors.
                    ["@keyword.operator"] = { link = "Operator" },                                      -- For new keyword operator
                    ["@keyword.export"] = { fg = C.sky, style = O.styles.keywords },
                    ["@markup.strong"] = { fg = C.maroon, style = { "bold" } },                         -- bold
                    ["@markup.italic"] = { fg = C.maroon, style = { "italic" } },                       -- italic
                    ["@markup.heading"] = { fg = C.blue, style = { "bold" } },                          -- titles like: # Example
                    ["@markup.quote"] = { fg = C.maroon, style = { "bold" } },                          -- block quotes
                    ["@markup.link"] = { link = "Tag" },                                                -- text references, footnotes, citations, etc.
                    ["@markup.link.label"] = { link = "Label" },                                        -- link, reference descriptions
                    ["@markup.link.url"] = { fg = C.rosewater, style = { "italic", "underline" } },     -- urls, links and emails
                    ["@markup.raw"] = { fg = C.teal },                                                  -- used for inline code in markdown and for doc in python (""")
                    ["@markup.list"] = { link = "Special" },
                    ["@tag"] = { fg = C.mauve },                                                        -- Tags like html tag names.
                    ["@tag.attribute"] = { fg = C.teal, style = O.styles.miscs or { "italic" } },       -- Tags like html tag names.
                    ["@tag.delimiter"] = { fg = C.sky },                                                -- Tag delimiter like < > /
                    ["@property.css"] = { fg = C.lavender },
                    ["@property.id.css"] = { fg = C.blue },
                    ["@type.tag.css"] = { fg = C.mauve },
                    ["@string.plain.css"] = { fg = C.peach },
                    ["@constructor.lua"] = { fg = C.flamingo }, -- For constructor calls and definitions: = { } in Lua.
                    -- typescript
                    ["@property.typescript"] = { fg = C.lavender, style = O.styles.properties or {} },
                    ["@constructor.typescript"] = { fg = C.lavender },
                    ["@attribute.typescript"] = { fg = C.blue, style = { "italic" } },
                    -- TSX (Typescript React)
                    ["@constructor.tsx"] = { fg = C.lavender },
                    ["@tag.attribute.tsx"] = { fg = C.teal, style = O.styles.miscs or { "italic" } },
                    ["@tag.builtin"] = { fg = C.mauve },
                    ["@type.builtin.c"] = { fg = C.yellow, style = {} },
                    ["@type.builtin.cpp"] = { fg = C.yellow, style = {} },
                }
            end,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                telescope = true,
                notify = false,
                mini = false,
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        })

        -- setup must be called before loading
        vim.cmd.colorscheme "catppuccin"
    end
}
