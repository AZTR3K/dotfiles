# Zsh Shell Setup on Arch Linux

This guide explains how to replicate a Zsh shell environment on Arch Linux, including installing necessary packages and applying custom configuration files (`.zshrc` and `.pk10.zsh`).

## Prerequisites

Ensure you have administrative privileges to install packages using `pacman`.

## Step 1: Install Required Packages

Zsh and related tools are required to set up the shell environment. Install the following packages using `pacman`:

1. **zsh**: The Z shell, a powerful alternative to Bash.
2. **git**: Required to clone plugins or tools (e.g., Oh My Zsh, if used).
3. **curl**: Useful for downloading scripts or plugins.
4. **zsh-completions**: Enhances Zsh's autocompletion features.
5. **zsh-syntax-highlighting**: Provides syntax highlighting for commands.
6. **zsh-autosuggestions**: Suggests commands as you type based on history.

Run the following command to install these packages:

```bash
sudo pacman -S zsh git curl zsh-completions zsh-syntax-highlighting zsh-autosuggestions
```

## Step 2: Set Zsh as the Default Shell

Change your default shell to Zsh for your user account:

```bash
chsh -s /bin/zsh
```

Log out and back in, or start a new terminal session for the change to take effect.

## Step 3: Copy Configuration Files

To replicate your current shell setup, copy your `.zshrc` and `.pk10.zsh` files to the new system.

1. **Backup Existing Files** (if any):
   Before copying, back up any existing Zsh configuration files to avoid overwriting them:

   ```bash
   mv ~/.zshrc ~/.zshrc.bak
   mv ~/.pk10.zsh ~/.pk10.zsh.bak
   ```

2. **Copy Your Configuration Files**:
   Transfer your `.zshrc` and `.pk10.zsh` files to the home directory (`~`) of the new system. You can use `scp`, a USB drive, or any file transfer method. For example, if using `scp`:

   ```bash
   scp user@remote-host:~/{.zshrc,.pk10.zsh} ~/
   ```

3. **Set Correct Permissions**:
   Ensure the files have appropriate permissions:

   ```bash
   chmod 644 ~/.zshrc ~/.pk10.zsh
   ```

## Step 4: Install Oh My Zsh (Optional)

If your `.zshrc` or `.pk10.zsh` relies on Oh My Zsh, install it:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

This will create a `~/.oh-my-zsh` directory and may overwrite your `.zshrc`. If this happens, restore your custom `.zshrc` from the backup or re-copy it.

## Step 5: Verify Plugin Dependencies

Your `.zshrc` or `.pk10.zsh` may reference plugins like `zsh-syntax-highlighting` or `zsh-autosuggestions`. These were installed in Step 1, but ensure they are correctly sourced in your `.zshrc`. Common lines to check or add:

```zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
```

If your configuration uses additional plugins (e.g., Oh My Zsh plugins or custom ones), clone them to the appropriate directory (e.g., `~/.oh-my-zsh/custom/plugins/` for Oh My Zsh plugins).

## Step 6: Test the Shell

Open a new terminal or source your `.zshrc` to apply the configuration:

```bash
source ~/.zshrc
```

Check for errors or missing plugins. If the `.pk10.zsh` file is sourced in your `.zshrc` (e.g., via `source ~/.pk10.zsh`), ensure it loads correctly.

## Troubleshooting

- **Command Not Found**: If commands fail, verify that required tools or plugins are installed and sourced correctly.
- **Permission Issues**: Ensure `~/.zshrc` and `~/.pk10.zsh` are readable (`chmod 644`).
- **Missing Plugins**: Install any additional plugins referenced in your configuration files.
- **Oh My Zsh Issues**: If using Oh My Zsh, ensure the `ZSH` variable in `.zshrc` points to `~/.oh-my-zsh`.
