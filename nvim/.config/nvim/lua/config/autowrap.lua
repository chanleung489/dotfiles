vim.api.nvim_create_autocmd(
    {
        "BufEnter",
    },
    {
        pattern = "*.txt,*.md",
        callback = function()
            vim.opt_local.wrap = true
            vim.opt_local.linebreak = true
        end
    }
)
