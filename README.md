# Inifynastic's NixOS Configuration

My personal NixOS configuration managed using **Nix Flakes** and **Home Manager**.

The goal of this repository is to keep my entire system reproducible, declarative, and easy to rebuild.

## Features

* NixOS configuration using flakes
* Home Manager integration
* Modular system configuration
* Declarative package management
* Managed dotfiles
* Managed Niri window manager configuration
* Reproducible development environments
* NVIDIA GPU configuration
* Custom desktop setup

## Repository Structure

```text
.
├── flake.nix
├── flake.lock
│
├── system/
│   ├── configuration.nix
│   └── modules/
│       ├── audio.nix
│       ├── bluetooth.nix
│       ├── boot.nix
│       ├── desktop.nix
│       ├── networking.nix
│       ├── nvidia.nix
│       ├── security.nix
│       ├── services.nix
│       └── users.nix
│
└── home/
    ├── default.nix
    ├── modules/
    │   ├── dotfiles.nix
    │   ├── homePackages.nix
    │   ├── misc.nix
    │   └── session.nix
    │
    ├── dotfiles/
    │   ├── niri/
    │   ├── waybar/
    │   ├── alacritty/
    │   ├── fuzzel/
    │   └── others...
    │
    └── resources/
        └── wallpapers/
```

## Rebuilding

After changing the configuration:

```bash
sudo nixos-rebuild switch --flake .#NixOS
```

To test a configuration without switching:

```bash
sudo nixos-rebuild test --flake .#NixOS
```

## Home Manager

User-level configuration is handled through Home Manager.

Managed items include:

* Applications
* Environment variables
* Desktop configuration
* Dotfiles
* User resources

Changes to Home Manager are applied automatically when rebuilding the system.

## Desktop Environment

Current desktop stack:

* Window Manager: Niri
* Status Bar: Waybar
* Launcher: Fuzzel
* Terminal: Alacritty
* Wallpaper: Swaybg
* Lock Screen: Swaylock
* Notifications: Mako

## Philosophy

This configuration follows a few principles:

* Keep the system declarative
* Avoid manual configuration drift
* Separate system configuration from user configuration
* Keep important files tracked in Git
* Prefer reproducibility over convenience

## Development Environments

Development environments are handled separately using Nix flakes.

Projects can provide their own:

```bash
nix develop
```

environment instead of globally installing every dependency.

Future improvements may include:

* direnv integration
* reusable flake templates
* better development environment automation

## Current Focus

This configuration is continuously evolving.

Current goals:

* Improve Emacs environment
* Expand Home Manager coverage
* Remove remaining unmanaged dotfiles
* Improve development workflows
* Keep the system clean and reproducible

---

Built with NixOS ❤️


Also if you found out that READ ME is AI generated then you are correct. I am too lazy to make a proper README.md
