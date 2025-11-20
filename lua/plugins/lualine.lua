-- plugins/lualine.lua
return {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function()
        local diff = function()
            local git_status = vim.b.gitsigns_status_dict
            if git_status == nil then
                return
            end

            local modify_num = git_status.changed
            local remove_num = git_status.removed
            local add_num = git_status.added

            local info = { added = add_num, modified = modify_num, removed = remove_num }
            return info
        end

        local ok, lualine = pcall(require, "lualine")
        if not ok or not lualine then
            return
        end

        lualine.setup {
            options = {
                icons_enabled = true,
                theme = "auto",
                section_separators = "",
                disabled_filetypes = {},
                always_divide_middle = true,
                refresh = {
                    statusline = 1000,
                },
                globalstatus = true,
            },
            sections = {
                lualine_a = {
                    {
                        "filename",
                        symbols = {
                            readonly = "[🔒]",
                        },
                    },
                },
                lualine_b = {
                    {
                        "branch",
                        fmt = function(name, _)
                            return string.sub(name, 1, 20)
                        end,
                        color = { gui = "italic,bold" },
                    },
                    {
                        "diff",
                        source = diff,
                    },
                },
                lualine_c = {
                    {
                        "%S",
                        color = { gui = "bold", fg = "cyan" },
                    },
                },
                lualine_x = {
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        symbols = { error = "🆇 ", warn = "⚠️ ", info = "ℹ️ ", hint = " " },
                    },
                },
                lualine_y = {
                    "filetype",
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { "quickfix", "fugitive", "nvim-tree" },
        }
    end,
}

