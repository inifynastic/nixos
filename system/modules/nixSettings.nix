{ inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    trusted-users = [
      "root"
      "inifynastic"
    ];
  };

  nixpkgs.overlays = [
    (final: prev: {
      niri =
        inputs.nixpkgs-unstable.legacyPackages.${prev.stdenv.hostPlatform.system}.niri;

      # qt6 =
      #   inputs.nixpkgs-unstable.legacyPackages.${prev.stdenv.hostPlatform.system}.qt6;
    })
  ];
}