# 🧼 Money Wash System for FiveM

A simple and immersive money laundering system compatible with `ox_inventory` and `ox_lib`. Players can interact with one or more configurable zones on the map to convert dirty money into clean money, with progress bar, animation, and notifications.

---

## ✨ Features

* 💰 Direct interaction to start washing (no commands required)
* 📍 Supports multiple configurable map locations
* 📊 Progress bar with animation (`WORLD_HUMAN_AA_SMOKE`)
* 🔒 Controls are disabled during the process
* 🕒 Cooldown system to prevent abuse
* 🔔 Notifications via `ox_lib`
* 📦 Fully integrated with `ox_inventory`

---

## 💡 How It Works

1. The player approaches a money wash zone.
2. Pressing `E` opens a dialog to enter the amount of dirty money to launder.
3. If the player has enough `black_money`, the animation and progress bar begin.
4. When complete, clean money (minus the configured percentage) is added.
5. The player must wait before starting another wash.

---

## ⚙️ Configuration

All parameters can be customized in the `config.lua` file:

```lua
cfg.waitRewashing = 60000 -- Cooldown: player must wait 1 minute between washes
cfg.washDuration = 30000  -- Duration of the washing process (30 seconds)
cfg.percentage = 0.50     -- Percentage removed (e.g. 50%)
cfg.iconDialog = 'fa-solid fa-sack-dollar' -- Icon for the dialog UI
cfg.positionProgress = 'middle' -- Position of the progress bar
cfg.positionWashing = {
    {
        coords = vector3(637.0958, 2784.7517, 42.0103),
        active = true,
        sprite = 500,
        name = 'Money Wash' -- Blip name
    }
    -- You can add more locations here
}
```

---

## 🗺️ Gameplay

* 🧭 Approach a wash zone (blip shown on the map)
* ⌨️ Press `E` to open the dialog
* 🔢 Enter the amount of money to wash
* ⏳ Wait until the progress bar completes

---

## 📦 Installation

1. 📁 Place the script folder (`krs_moneywash`) inside your `resources/` directory.

2. 🧩 Add the resource to your `server.cfg`:

   ```cfg
   ensure krs_moneywash
   ```

3. ⚠️ Make sure `ox_lib` and `ox_inventory` are installed and started before this script.

4. 🚀 Restart your server and test the system in-game!

---

## ✅ Requirements

* [ox\_lib](https://github.com/overextended/ox_lib)
* [ox\_inventory](https://overextended.dev/ox_inventory)
