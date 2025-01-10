local function which_python()
    local f = io.popen('env which python', 'r') or error("Fail to execute 'env which python'")
    local s = f:read('*a') or error("Fail to read from io.popen result")
    f:close()
    return string.gsub(s, '%s+$', '')
end

return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
            { 'saadparwaiz1/cmp_luasnip' },
        },
        config = function()
            local cmp = require('cmp')
            local cmp_select = { behaviour = 'select' }
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'luasnip' },
                    { name = 'path' },
                }, {
                    { name = 'buffer' },
                }),
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-m>'] = cmp.mapping.confirm({ select = true }),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    -- ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    -- ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- vim.snippet.expand(args.body)
                    end,
                },
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local lspconfig_defaults = require('lspconfig').util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            local handlers = {
                -- this first function is the "default handler"
                -- it applies to every language server without a "custom handler"
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
                lua_ls = function()
                    require('lspconfig').lua_ls.setup({
                        settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
                    })
                end,
            }
            local python = which_python()
            if python ~= "" then
                handlers["pylsp"] = {
                    function()
                        require('lspconfig').pylsp.setup({
                            settings = {
                                pylsp = {
                                    plugins = {
                                        jedi = { environment = python },
                                    }
                                }
                            }
                        })
                    end
                }
            end
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                },
                handlers = handlers
            })

            vim.diagnostic.config({
                virtual_text = {
                    prefix = '>', -- Could be '●', '▎', 'x'
                }
            })
        end
    }
}
