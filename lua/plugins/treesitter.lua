-- plugins/treesitter.lua
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup {
            highlight = { enable = true },
            indent    = { enable = true },
            ensure_installed = {
                "c", "cpp", "java", "python", "lua", "asm"
            },
            auto_install = false,
            disable = function(_, buf)
                return vim.api.nvim_buf_line_count(buf) > 20000
            end,
            ignore_install = {},
        }
    end,
}
