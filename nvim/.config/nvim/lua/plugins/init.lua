return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    -- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim

    "folke/which-key.nvim",
    {
        "folke/neoconf.nvim",
        cmd = "Neoconf"
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
            })
            vim.cmd.colorscheme("catppuccin")
            local mocha = require("catppuccin.palettes").get_palette("mocha")
            vim.api.nvim_set_hl(0, "LineNr", { fg = mocha["overlay2"] })
            vim.api.nvim_set_hl(0, "LineNrAbove", { fg = mocha["surface2"] })
            vim.api.nvim_set_hl(0, "LineNrBelow", { fg = mocha["surface2"] })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            -- You dont need to set any of these options. These are the default ones. Only
            -- the loading is important
            require('telescope').setup {
                extensions = {
                    fzf = {}
                }
            }
            -- To get fzf loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require('telescope').load_extension('fzf')

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
            vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>ph", builtin.help_tags, {})
            vim.keymap.set("n", "<leader>pr", builtin.resume, {})
        end
    },

    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", function()
                vim.g.undotree_SetFocusWhenToggle = 1
                vim.cmd.UndotreeToggle()
            end
            )
        end
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end
    },

}
