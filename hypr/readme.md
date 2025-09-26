# Installing Hyprland via Omarchy ISO

---

## Prerequisites

- A USB drive (at least 8GB) for creating a bootable installer.
- A computer with internet access to download the ISO.
- A tool to create a bootable USB (e.g., Rufus for Windows or `dd`/Balena Etcher for Linux).

---

## Installation Steps

1. **Download the Omarchy ISO**
   - Visit the official Omarchy website: [https://omarchy.org](https://omarchy.org).
   - Download the latest Omarchy ISO, which includes Hyprland preconfigured.

2. **Create a Bootable USB**
   - **On Windows**: Use [Rufus](https://rufus.ie/) to flash the ISO onto your USB drive.
   - **On Linux**: Use `dd` or a tool like [Balena Etcher](https://etcher.balena.io/).

   **Example (Linux with `dd`)**:
   ```bash
   sudo dd if=omarchy.iso of=/dev/sdX bs=4M status=progress && sync
   ```
   - Replace `/dev/sdX` with your USB device (e.g., `/dev/sdb`). Verify the device name with `lsblk` to avoid data loss.
   - Ensure the USB is unmounted before running the command.

3. **Boot from the USB**
   - Insert the USB drive and restart your computer.
   - Enter the BIOS/UEFI (usually by pressing `F2`, `Del`, or `F12`) and set the USB as the primary boot device.
   - Save changes and boot into the Omarchy live environment.

4. **Install the System**
   - Follow the Omarchy installer’s guided steps to install the system.
   - Select your preferred disk, partition scheme, and user settings.
   - Once installation is complete, reboot into your new system.

5. **Log in to Hyprland**
   - After rebooting, Hyprland will be ready to use.
   - Configuration files are located in `~/.config/hypr/`. Common configuration files include:
     ```
     autostart.conf   bindings.conf   envs.conf
     hypridle.conf    hyprland.conf   hyprlock.conf
     hyprsunset.conf  input.conf      looknfeel.conf
     monitors.conf
     ```

---

## 🎨 Customizing Hyprland

Personalize your Hyprland environment by editing configuration files in `~/.config/hypr/`:
- **`bindings.conf`**: Customize keybindings for shortcuts.
- **`monitors.conf`**: Configure display settings (e.g., resolution, refresh rate, multi-monitor setup).
- **`looknfeel.conf`**: Adjust themes, fonts, and aesthetics.
- **`autostart.conf`**: Set applications or services to launch automatically with Hyprland.

Refer to the [Hyprland documentation](https://wiki.hyprland.org/) for detailed configuration options.

---

## ✅ Done!

You now have Hyprland installed via the Omarchy ISO, ready to use out of the box. From here, you can:
- Tweak configurations to suit your workflow.
- Install additional software.
- Explore Hyprland’s dynamic tiling window manager features.

---
