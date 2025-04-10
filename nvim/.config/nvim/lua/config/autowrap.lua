vim.api.nvim_create_autocmd(
    {
        "BufEnter",
    },
    {
        pattern = "*.txt,*.md,*.json",
        callback = function()
            vim.opt_local.wrap = true
            vim.opt_local.linebreak = true
        end
    }
)
