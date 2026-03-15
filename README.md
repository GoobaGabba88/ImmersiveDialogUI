# Immersive Dialog UI

An enhanced conversation addon for World of Warcraft 3.3.5a with a focus on immersion and customization.

> This project is a modified and maintained fork of the original [DialogUI](https://github.com/Jslquintero/DialogUI) by **Jslquintero**.  
> All credit for the original design and implementation goes to the original author.  
> This version has been specifically ported to the 3.3.5a client (WotLK) and hardened for Ascension WoW custom features, fixing rendering errors and keybinding bugs.

## Features
- **Redesigned Layout**: Complete visual overhaul of conversation and gossip interfaces for enhanced immersion
- **Customizable Controls**: Remappable hotkeys for continue/decline actions
- **Flexible Positioning**: Fully adjustable UI placement and size via slider controls
- **Controller Support**: Gamepad button icons (can be reverted to keyboard icons by replacing included TGA files)

## Commands

- Open configuration panel: `/IDUI`



## Installation

1. Download Zip
2. Extract the folder to your `World of Warcraft/Interface/AddOns` directory
3. Ensure the folder name is exactly `ImmersiveDialogUI`
4. Enable the addon in-game

## Customization

To revert to keyboard icons:
1. Locate the `src\assets\art\keys` folder in the addon directory
2. Replace the gamepad icon files with the keyboard icon backups provided
3. Reload your UI with `/reload`
