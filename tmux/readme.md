# TMUX Setup Guide for New System

## 📋 Prerequisites
- tmux installed on your system
- Git installed

## Quick Setup Steps

### 1. **Install TPM (Tmux Plugin Manager)**
```bash
# Clone TPM to the correct directory
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 2. **Install Plugins**
After pasting your `.tmux.conf` file, you need to install the plugins:

#### **Method A: Inside tmux (Recommended)**
1. Start tmux: `tmux`
2. Reload config: Press `Ctrl-s + r`
3. Install plugins: Press `Ctrl-s + I` (capital i, i.e., Shift+i)

#### **Method B: Command Line**
```bash
# Run the install script
~/.tmux/plugins/tpm/bin/install_plugins
```

### 3. **Verify Installation**
Check if plugins were installed correctly:
```bash
ls ~/.tmux/plugins/
# Should show: tpm/  tmux-resurrect/
```

## Key Bindings Cheat Sheet

### **Basic Navigation**
- `Ctrl-s` - Leader key (instead of default Ctrl-b)
- `Ctrl-s + r` - Reload tmux configuration
- `Ctrl-s + h/j/k/l` - Navigate panes (vim-style)
- `Ctrl-s + I` - Install plugins (Shift+i)

### **Pane Management**
- `Ctrl-s + %` - Split pane vertically
- `Ctrl-s + "` - Split pane horizontally
- `Ctrl-s + x` - Close current pane
- `Ctrl-s + z` - Zoom pane (toggle)

### **Window Management**
- `Ctrl-s + c` - Create new window
- `Ctrl-s + n/p` - Next/previous window
- `Ctrl-s + 0-9` - Switch to window by number

## 🔄 Tmux Resurrect Usage

### **Manual Save/Restore**
- `Ctrl-s + Ctrl-s` - Save session manually
- `Ctrl-s + Ctrl-r` - Restore session manually

### **Auto-Save Feature**
- Sessions auto-save every 5 minutes
- Sessions restore automatically when tmux starts

### **Check Saved Sessions**
```bash
ls ~/.tmux/resurrect/
```

## 🛠️ Troubleshooting

### **If plugins don't install:**
```bash
# Manual plugin installation
cd ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tmux-resurrect.git
```

### **If key bindings don't work:**
1. Check if tmux is running: `tmux list-sessions`
2. Reload config: `tmux source-file ~/.tmux.conf`
3. Restart tmux: `tmux kill-server && tmux`

### **If Ctrl+L doesn't clear screen:**
- Make sure the fix is in your `.tmux.conf`:
```bash
unbind C-l
bind C-l send-keys C-l
```

## 📁 File Locations
- **Config file**: `~/.tmux.conf`
- **TPM directory**: `~/.tmux/plugins/tpm/`
- **Resurrect saves**: `~/.tmux/resurrect/`

## 🔧 Customization Options

### **Change auto-save interval:**
```bash
# In your .tmux.conf, change this line:
set -g @resurrect-save-interval 10  # Save every 10 minutes instead of 5
```

### **Add more plugins:**
```bash
# Add to your .tmux.conf before the last line:
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-pain-control'
```

## ✅ Verification Checklist

After setup, verify everything works:

- [ ] `Ctrl-s + r` reloads configuration
- [ ] `Ctrl-s + h/j/k/l` navigates panes
- [ ] `Ctrl-L` clears screen inside tmux
- [ ] `Ctrl-s + I` installed plugins
- [ ] `Ctrl-s + Ctrl-s` saves session
- [ ] Status bar shows session info and time

## 🆘 Need Help?

### **Test basic functionality:**
```bash
# Start fresh tmux session
tmux new-session -t test

# Test key bindings
# Test pane navigation
# Test plugin functionality
```

### **Check tmux version:**
```bash
tmux -V  # Should be 1.9 or higher for best compatibility
```
