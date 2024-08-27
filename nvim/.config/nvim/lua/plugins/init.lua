return {
    "folke/neodev.nvim",
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
        end,
    },

    { "nvim-treesitter/nvim-treesitter", run = "TSUpdate" },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
        end
    },

    "mbbill/undotree",

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

}
