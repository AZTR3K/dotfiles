# Neovim Configuration Guide

## 📁 Project Structure
```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lazy-lock.json           # Plugin versions lockfile
└── lua/
    └── setup/
        ├── init.lua         # Core setup initialization
        ├── lazy_init.lua    # Lazy.nvim plugin manager setup
        ├── remap.lua        # Key mappings
        ├── set.lua          # Basic settings
        └── lazy/            # Plugin configurations
            ├── basics.lua       # Essential plugins
            ├── colorscheme.lua  # Colorscheme setup
            ├── lsp.lua          # Language Server Protocol
            ├── treesitter.lua   # Syntax parsing
            ├── telescope.lua    # Fuzzy finder
            ├── harpoon.lua      # Quick file navigation
            ├── fugitive.lua     # Git integration
            ├── formatter.lua    # Code formatting
            ├── lualine.lua      # Status line
            ├── snippets.lua     # Code snippets
            ├── db.lua           # Database integration
            ├── cloak.lua        # Environment variable masking
            └── live-preview.lua # Markdown preview
```

## Quick Setup on New System

### 1. **Prerequisites**
```bash
# Install Neovim (>= 0.8 recommended)
sudo pacman -S neovim  # Arch Linux
# or
brew install neovim    # macOS
```

### 2. **Clone/Setup Configuration**
```bash
# If you have your config in git:
git clone <your-nvim-repo> ~/.config/nvim

# Or if starting fresh, create the structure:
mkdir -p ~/.config/nvim/lua/setup/lazy
```

### 3. **Install Plugins**
When you first open Neovim:
```bash
nvim  # This will auto-install Lazy.nvim and all plugins
```

**First-time setup process:**
- Lazy.nvim will auto-install
- Plugins will begin downloading
- Wait for installation to complete
- Restart Neovim if prompted

### 4. **Verify Installation**
Check if everything loaded correctly:
```bash
:Lazy health    # Check plugin status
:checkhealth    # System health check
:Lazy           # Open plugin manager
```

## 🔧 Plugin Configuration Overview

### **Core Essentials** (`basics.lua`)
- **Lazy.nvim** - Plugin manager
- **Which-key** - Keybinding hints
- **Telescope** - Fuzzy finder
- **Trouble** - Diagnostics viewer

### **Language Support** (`lsp.lua`, `treesitter.lua`)
- **LSP setup** - Language Server Protocol
- **Mason** - LSP/DAP/linter/formatter manager
- **Treesitter** - Enhanced syntax highlighting

### **UI & Appearance** (`colorscheme.lua`, `lualine.lua`)
- **Colorscheme** - Your preferred theme
- **Lualine** - Custom status line
- **UI enhancements** - Icons, animations, etc.

### **Productivity** (`harpoon.lua`, `fugitive.lua`)
- **Harpoon** - Quick file navigation
- **Git** - Fugitive for Git integration
- **Formatter** - Code formatting
- **Snippets** - Code snippet engine

### **Specialized** (`db.lua`, `cloak.lua`, `live-preview.lua`)
- **Database** - SQL database integration
- **Cloak** - Environment variable masking
- **Live Preview** - Markdown preview

## ⌨️ Key Mappings (`remap.lua`)

Common key mappings (check your `remap.lua` for exact bindings):

### **Navigation**
- `<leader>pf` - Telescope find files
- `<leader>ps` - Telescope grep search
- `<leader>e` - File explorer (likely)

### **LSP & Code Actions**
- `gd` - Go to definition
- `K` - Hover documentation
- `<leader>ca` - Code actions
- `gr` - References

### **Harpoon (Fast file switching)**
- `<leader>a` - Add file to harpoon
- `<C-e>` - Show harpoon menu
- Number keys - Quick switch to marked files

### **Git (Fugitive)**
- `<leader>gs` - Git status
- `<leader>gc` - Git commit

## ⚙️ Basic Settings (`set.lua`)

Your configuration likely includes:
- Line numbers (relative/absolute)
- Tab settings (spaces vs tabs)
- Search preferences (case sensitivity)
- Undo history persistence
- Mouse support
- Clipboard integration

## 🛠️ Troubleshooting

### **If plugins fail to install:**
```bash
# Clear and reinstall
rm -rf ~/.local/share/nvim/lazy
nvim  # Will reinstall everything
```

### **Check plugin status:**
```vim
:Lazy sync    # Force plugin sync
:Lazy log     # View installation logs
:TSUpdate     # Update treesitter parsers
:Mason        # Manage LSP servers
```

### **Common issues:**
```vim
" If LSP servers not installing:
:MasonInstall python-lsp-server typescript-language-server

" If treesitter highlighting broken:
:TSInstall python javascript typescript lua

" If formatting not working:
:NullLsInfo  # or check your formatter.lua
```

## 🔄 Maintenance Commands

### **Update Plugins**
```vim
:Lazy update    # Update all plugins
:Lazy clean     # Remove unused plugins
```

### **Health Checks**
```vim
:checkhealth    # System health
:Lazy health    # Plugin health
:TSHealth       # Treesitter health
```

### **Debugging**
```vim
:message        # View error messages
:verbose map <leader>  # Check key mappings
:Lazy debug     # Debug plugin issues
```

## 📋 First-Time Setup Checklist

1. [ ] Neovim installed (`nvim --version`)
2. [ ] Configuration files in place
3. [ ] Plugins auto-installed on first launch
4. [ ] LSP servers installed via Mason
5. [ ] Treesitter parsers installed
6. [ ] Key mappings working
7. [ ] Colorscheme applied correctly
8. [ ] Telescope file search working
9. [ ] LSP completions working
10. [ ] Git integration functional

## 🎯 Customization Tips

### **Add new plugins:**
1. Create new file in `lua/setup/lazy/` or add to existing
2. Follow the pattern from other plugin files
3. Run `:Lazy sync`

### **Modify key mappings:**
Edit `lua/setup/remap.lua` and reload with:
```vim
:source ~/.config/nvim/init.lua
```

### **Change colorscheme:**
Edit `lua/setup/lazy/colorscheme.lua` and restart Neovim.

## 🆘 Quick Help

### **Reset everything:**
```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
nvim  # Fresh start
```

### **Check current configuration:**
```vim
:scriptnames    # List all loaded scripts
:set all        # Show all settings
:map            # Show all key mappings
```
