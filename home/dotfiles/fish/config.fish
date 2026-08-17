set fish_greeting ""
fish_config theme choose Nord
if status is-interactive
# Commands to run in interactive sessions can go here
alias develop='nix develop /etc/nixos'
alias update-flake='nix flake update /etc/nixos'
alias rebuild-nix='sudo nixos-rebuild switch --flake /etc/nixos#NixOS'
end
fortune | cowsay -f sus
