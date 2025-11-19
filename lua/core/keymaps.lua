vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

-- LSP
if not _G.NVIM_LIGHT_MODE then
    vim.keymap.set("n", "<leader>d", function() vim.lsp.buf.definition() end, vim.tbl_extend("force", opts, { desc = "LSP: Go to definition" }))
    vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.declaration() end, vim.tbl_extend("force", opts, { desc = "LSP: Go to declaration" }))
    vim.keymap.set("n", "<leader>i", function() vim.lsp.buf.implementation() end, vim.tbl_extend("force", opts, { desc = "LSP: Go to implementation" }))
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, vim.tbl_extend("force", opts, { desc = "LSP: Rename symbol" }))
    vim.keymap.set("n", "<leader>q", function() vim.lsp.buf.code_action() end, vim.tbl_extend("force", opts, { desc = "LSP: Code actions" }))
end

-- Buffer navigation & save
vim.keymap.set("n", "<Tab>", ":bnext<CR>", vim.tbl_extend("force", opts, { desc = "Switch to next buffer" }))
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", vim.tbl_extend("force", opts, { desc = "Switch to previous buffer" }))
vim.keymap.set("n", "<leader>s", ":w<CR>", vim.tbl_extend("force", opts, { desc = "Save current buffer" }))

-- Explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", vim.tbl_extend("force", opts, { desc = "Toggle file explorer" }))
vim.keymap.set("n", "<leader>p", ":Telescope projects<CR>", vim.tbl_extend("force", opts, { desc = "Change project" }))

-- General utils
vim.keymap.set("n", "<leader>h", ":LazyGit<CR>", vim.tbl_extend("force", opts, { desc = "Open Git interface" }))
vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>", vim.tbl_extend("force", opts, { desc = "Clear search highlight" }))

-- ToggleTerm
vim.keymap.set("n", "<A-t>", ":ToggleTerm<CR>", vim.tbl_extend("force", opts, { desc = "Toggle terminal" }))

-- Save and quit all tabs
vim.keymap.set({ "n", "i" }, "<S-Esc>", function()
    vim.cmd("wqa")
end, { noremap = true, silent = true, desc = "Save all buffers and quit" })

-- Split screen
vim.keymap.set("n", "<leader>j", ":split<CR>", vim.tbl_extend("force", opts, { desc = "Open horizontal split (bottom)" }))
vim.keymap.set("n", "<leader>l", ":vsplit<CR>", vim.tbl_extend("force", opts, { desc = "Open vertical split (right)" }))
vim.keymap.set("n", "<leader>k", ":close<CR>", vim.tbl_extend("force", opts, { desc = "Close window" }))

-- Move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Move to top window" })

-- Resize splits
vim.keymap.set("n", "<C-M-l>", ":vertical resize -2<CR>", { noremap = true, silent = true, desc = "Resize split left" })
vim.keymap.set("n", "<C-M-h>", ":vertical resize +2<CR>", { noremap = true, silent = true, desc = "Resize split right" })
vim.keymap.set("n", "<C-M-j>", ":resize -2<CR>", { noremap = true, silent = true, desc = "Resize split down" })
vim.keymap.set("n", "<C-M-k>", ":resize +2<CR>", { noremap = true, silent = true, desc = "Resize split up" })

-- Buffer close with prompt
vim.keymap.set("n", "<leader>x", function()
    local bufnr = vim.api.nvim_get_current_buf()
    if vim.bo.modified and vim.fn.bufname(bufnr) ~= "" then
        local choice = vim.fn.confirm("Save buffer?", "&Yes\n&No\n&Back", 1)
        if choice == 1 then
            vim.cmd("write")
            vim.cmd("bd")
        elseif choice == 2 then
            vim.cmd("bd!")
        end
    else
        vim.cmd("bd")
    end
end, vim.tbl_extend("force", opts, { desc = "Close buffer with options" }))


