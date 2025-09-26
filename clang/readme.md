# Clang-Format Setup

This guide provides minimal instructions to set up `clang-format` on Arch Linux with a custom `.clang-format` configuration file.

## Prerequisites

- Administrative privileges for installing packages with `pacman`.

## Step 1: Install Clang

Install the `clang` package, which includes `clang-format`:

```bash
sudo pacman -S clang
```

## Step 2: Copy .clang-format File

Place your `.clang-format` file in your home directory (`~`):

1. **Copy the File**:
   Transfer your `.clang-format` file to `~/.clang-format`. For example, using `scp`:

   ```bash
   scp user@remote-host:~/.clang-format ~/
   ```

2. **Set Permissions**:
   Ensure the file is readable:

   ```bash
   chmod 644 ~/.clang-format
   ```

## Step 3: Verify Configuration

Test `clang-format` with your configuration:

```bash
clang-format --style=file -dump-config
```

This should display your settings (e.g., `BasedOnStyle: Microsoft`, `IndentWidth: 4`, etc.).

## Usage

Run `clang-format` on a file:

```bash
clang-format -i your_file.cpp
```

The `-i` flag applies formatting in-place, using your `~/.clang-format` settings.

## Notes

- Ensure your `.clang-format` file is in `~/` for automatic detection.
- If using an IDE, configure it to use `clang-format` with the file-based style.
