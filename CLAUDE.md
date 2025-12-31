# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on kickstart.nvim. It uses a single-file approach with the main configuration in `init.lua`, supplemented by modular plugin configs in `lua/custom/plugins/`.

## Code Style

- Lua files are formatted with stylua (2 spaces, no parentheses on calls, Unix line endings)
- Format on save is enabled via conform.nvim
- Leader key is `<space>`

## Architecture

### Plugin Management
- Uses lazy.nvim for plugin management
- Core plugins configured in `init.lua`
- Custom plugins in `lua/custom/plugins/*.lua` are auto-loaded via lazy's import
- Kickstart plugins in `lua/kickstart/plugins/` are opt-in via require statements

### Key Plugin Stack
- **LSP**: nvim-lspconfig + mason.nvim for server installation
- **Completion**: blink.cmp with LuaSnip snippets
- **Picker/UI**: Snacks.nvim (replaces telescope) for fuzzy finding, file explorer, notifications, terminal
- **Git**: gitsigns.nvim + lazygit integration via Snacks
- **Formatting**: conform.nvim (stylua, black, isort, shfmt)
- **Theme**: catppuccin (mocha)

### LSP Configuration
LSP servers are defined in the `servers` table in `init.lua:532-561`. Currently configured:
- lua_ls (Lua)
- pyright (Python)
- bashls (Bash)

Mason auto-installs servers and tools listed in `ensure_installed`.

### Keybinding Groups
- `<leader>c` - Code actions
- `<leader>d` - Document operations
- `<leader>f` - Find/Files (Snacks picker)
- `<leader>g` - Git operations
- `<leader>h` - Git hunks
- `<leader>s` - Search operations
- `<leader>t` - Toggles
- `<leader>w` - Workspace
- `gr*` - LSP operations (references, rename, etc.)
- `gd/gD/gI/gy` - LSP navigation

### Special Behaviors
- `jk` or `kj` exits insert/visual/terminal mode (via mini.keymap)
- `H` triggers smart quit when opened from Ranger (`RANGER_LEVEL` env var)
- Neovide has custom Cmd-key mappings for macOS
