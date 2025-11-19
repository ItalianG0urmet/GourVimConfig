# Neovim Configuration

Minimal, modular, and designed for fast startup and predictable behavior.
The configuration focuses on C, C++, Java, Rust, Python and general-purpose development.
Plugin management is handled through `lazy.nvim`, with optional reduced mode via the `NVIM_LIGHT_MODE` environment flag.

![Screenshot](./screenshot.png)

---

## Features

### Core Behavior

* Clean UI with minimal noise (rounded borders, persistent undo, smart relative numbers).
* Fast editing defaults: no backups, no swapfiles, clipboard integration, smart search.
* Optional light mode (`NVIM_LIGHT_MODE=1`) disables LSP and heavy plugins.

### Language Support

* LSP stack driven by `mason.nvim` and `nvim-lspconfig`.
* Servers preconfigured: `clangd`, `jdtls`, `rust_analyzer`, `pyright`, `lua_ls`, `bashls`, `jsonls`, `yamlls`, `cmake`, `kotlin_language_server`.
* Completion via `nvim-cmp`, Treesitter for syntax and folding.

### Tools and Utilities

* Telescope for fuzzy searching and project switching.
* NvimTree as file explorer.
* LazyGit integration.
* ToggleTerm for embedded shells.
* Modular plugin files for easier maintenance.

---

## Keybindings

Leader key: **Space**

### Normal Mode

#### LSP

* `<Space>d` — Go to definition
* `<Space>D` — Go to declaration
* `<Space>i` — Go to implementation
* `<Space>r` — Rename symbol
* `<Space>q` — Code actions

#### Buffers and Files

* `<Tab>` — Next buffer
* `<S-Tab>` — Previous buffer
* `<Space>s` — Save buffer
* `<Space>x` — Close buffer with confirmation

#### Navigation and Tools

* `<Space>e` — Toggle file explorer
* `<Space>p` — Switch project (Telescope)
* `<Space>h` — Open LazyGit
* `<Space>/` — Clear search highlighting

#### Splits and Windows

* `<leader>j` — Horizontal split
* `<leader>l` — Vertical split
* `<leader>k` — Close window
* `<C-h/l/j/k>` — Move between windows
* `<C-M-h/l/j/k>` — Resize splits

#### Terminal

* `<A-t>` — Toggle terminal window

---

## Light Mode

Setting the environment variable `NVIM_LIGHT_MODE=1` before launching Neovim disables LSP and related heavier plugins.
Useful for quick editing sessions, low-resource environments, or running inside remote hosts where no toolchain is installed.

```
NVIM_LIGHT_MODE=1 nvim
```

---
 vuoi, posso anche generare una versione più minimalista, più “acid” alla TempleOS/Terry Davis, oppure una più formale stile documentazione Linux Kernel.
