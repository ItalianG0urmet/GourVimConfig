-- plugins/bufferline.lua
return {
    "akinsho/bufferline.nvim",
    event = "BufReadPost",
    config = function()
        local ok, bufferline = pcall(require, "bufferline")
        if not ok or not bufferline then
            return
        end

        bufferline.setup {
            options = {
                numbers = "none",
                close_command = "bdelete! %d",
                right_mouse_command = nil,
                left_mouse_command = "buffer %d",
                middle_mouse_command = nil,
                indicator = {
                    icon = "▎",
                    style = "icon",
                },
                modified_icon = "●",
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 18,
                max_prefix_length = 15,
                tab_size = 10,
                diagnostics = false,
                custom_filter = function(bufnr)
                    local exclude_ft = { "qf", "fugitive", "git" }
                    local cur_ft = vim.bo[bufnr].filetype
                    if vim.tbl_contains(exclude_ft, cur_ft) then
                        return false
                    end
                    return true
                end,
                show_buffer_icons = true,
                show_buffer_close_icons = false,
                show_close_icon = false,
                show_tab_indicators = false,
                persist_buffer_sort = false,
                separator_style = "bar",
                enforce_regular_tabs = false,
                always_show_bufferline = false,
                sort_by = "id",
            },
        }
    end,
}

