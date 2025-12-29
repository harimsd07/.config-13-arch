

# 🎨 My Arch Linux + i3 Dotfiles

A minimal, keyboard-driven setup for **Arch Linux** running on an **ASUS ROG** laptop. This configuration features the **Nord** color scheme, transparency effects, and custom hardware integration for battery and fan control.

> _Tip: Replace the link below with a screenshot of your actual desktop!_

## 🚀 Features

- **Window Manager:** i3-wm (configured with gaps & borderless windows).
    
- **Theme:** Nordic Color Palette (Polar Night / Snow Storm).
    
- **Status Bar:** Custom `i3status` with Nerd Font icons and emojis.
    
- **Compositor:** `picom` for transparency and fading windows.
    
- **Launcher:** `rofi` (modern replacement for dmenu).
    
- **Hardware Integration:** Full support for ASUS ROG fan curves & RGB via `asusctl`.
    
- **Notifications:** Custom bash script for battery alerts (triggering at 20%, 15%, 10%, 5%).
    

## 🎨 Color Palette (Nord)

|Component|Hex Code|Preview|
|---|---|---|
|**Background**|`#2E3440`||
|**Foreground**|`#D8DEE9`||
|**Selection/Accent**|`#81A1C1`||
|**Urgent/Error**|`#BF616A`||
|**Success/Good**|`#A3BE8C`||

## 🛠️ Dependencies

To replicate this setup, you need the following packages installed on Arch Linux:

```
# Core components
sudo pacman -S i3-wm i3status dmenu rofi picom feh libnotify dunst

# Fonts (Required for icons)
sudo pacman -S ttf-jetbrains-mono-nerd terminus-font

# ASUS ROG Tools (Optional, for ASUS laptops)
# Requires 'g14' custom repo or AUR
sudo pacman -S asusctl supergfxctl
```

## 📂 File Structure

```
.
├── i3/
│   └── config                # Main i3 configuration
├── i3status/
│   └── config                # Status bar configuration
└── scripts/
    └── battery_monitor.sh    # Low battery notification script
```

## ⚙️ Installation

1. **Clone the repository:**
    
    ```
    git clone [https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git](https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git) ~/dotfiles
    ```
    
2. **Install Configurations:** _Warning: This will overwrite your existing config files!_ Copy and paste the following block to set up everything at once:
    
    ```
    # Create necessary directories
    mkdir -p ~/.config/i3 ~/.config/i3status
    
    # Copy config files
    cp ~/dotfiles/i3/config ~/.config/i3/config
    cp ~/dotfiles/i3status/config ~/.config/i3status/config
    
    # Setup Battery Monitor script
    mkdir -p ~/.config/i3/scripts
    cp ~/dotfiles/scripts/battery_monitor.sh ~/.config/i3/battery_monitor.sh
    chmod +x ~/.config/i3/battery_monitor.sh
    
    echo "Done! Press Mod + Shift + R to reload i3."
    ```
    

## ⌨️ Keybindings Cheat Sheet

|Key Combination|Action|
|---|---|
|**Mod + Enter**|Open Terminal|
|**Mod + D**|Open App Launcher (Rofi)|
|**Mod + Shift + Q**|Close Window|
|**Mod + F**|Toggle Fullscreen|
|**Mod + Shift + Space**|Toggle Floating Mode|
|**Fn + F5**|Cycle Fan Profiles (Silent/Balanced/Perf)|
|**Fn + ROG Key**|Cycle Keyboard RGB Modes|

## 🔋 Custom Scripts

### Battery Monitor

Located at `~/.config/i3/battery_monitor.sh`.

- Runs in the background (autostart via i3 config).
    
- Checks battery level every 30 seconds.
    
- Sends critical notifications via `dunst` when battery drops below **20%, 15%, 10%, or 5%**.
    

## 🎨 Gallery

_(Add screenshots of your "Clean" desktop and "Busy" desktop here)_

### 📝 To-Do

- [ ] Add blurred background support in picom
    
- [ ] Configure Rofi theme to match Nord colors
    
- [ ] Add custom lock screen (i3lock-color)