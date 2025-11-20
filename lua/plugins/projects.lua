return {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
        require("project_nvim").setup {
            manual_mode = false,
            detection_methods = { "pattern" },
            patterns = { ".git", "package.json", "Makefile" },
        }

        -- Estensione di telescope caricata solo al comando
        vim.api.nvim_create_autocmd("User", {
            pattern = "TelescopePre",
            callback = function()
                local ok, telescope = pcall(require, "telescope")
                if ok then
                    pcall(telescope.load_extension, "projects")
                end
            end,
        })
    end,
}

