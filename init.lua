-- init.lua
_G.NVIM_LIGHT_MODE = vim.fn.getenv("NVIM_LIGHT_MODE") == "1"
require("core.options")
require("core.disable_builtins")
require("core.keymaps")
require("core.lazy")

