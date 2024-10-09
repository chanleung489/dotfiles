vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center movement motion
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")

-- paste replace selection
vim.keymap.set("x", "<leader>rp", [["_dP]])

-- clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>pp", [["+p]])

-- delete into void
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quick fix action list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace all instance in buffer
vim.keymap.set("n", "<leader>aps", function()
    vim.ui.input(
        { prompt = "Prefix: " },
        function(user_input)
            local cword = vim.fn.expand("<cword>")
            vim.cmd([[%s/\<]] .. cword .. [[\>/]] .. user_input .. cword .. [[/gI]])
        end
    )
end) -- add prefix (prompt) to all instance in buffer
vim.keymap.set("n", "<leader>as", [[:%s/\<<C-r><C-w>\>/prefix.<C-r><C-w>/gI<CR>]]) -- add prefix (prompt) to all instance in buffer

-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- turn bash into executable

-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/user/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- tabs
-- vim.keymap.set("n", "<leader><Tab>n", "<cmd>tabnew<CR>")
-- vim.keymap.set("n", "<leader><Tab>c", "<cmd>tabclose<CR>")
-- vim.keymap.set("n", "<leader><Tab><Tab>", "<cmd>tabnext<CR>")
-- vim.keymap.set("n", "<leader><Tab>`", "<cmd>tabprev<CR>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>##", "I")
vim.keymap.set("n", "<leader>#<BS>", "^dw<Esc>")
vim.keymap.set("v", "<leader>##", "^<C-v>o^I")
vim.keymap.set("v", "<leader>#<BS>", "^<C-v>o^f x<Esc>")

-- vim.keymap.set("n", "<leader>kmp", "<cmd>e ~/.config/nvim/lua/user/remap.lua<CR>");
-- vim.keymap.set("n", "<leader>vcf", "<cmd>tcd ~/.config/nvim<CR>");
