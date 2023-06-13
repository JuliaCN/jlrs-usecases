{
  description = "Rust development environment";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";

    crane.url = "github:nmattia/naersk";
    crane.inputs.nixpkgs.follows = "nixpkgs";

    julia2nix.url = "github:juliaCN/julia2nix.jl";

    call-flake.url = "github:divnix/call-flake";
  };

  outputs =
    inputs@{
      self,
      flake-utils,
      ...
    }:
    (flake-utils.lib.eachDefaultSystem (
      system:
      let
        nixpkgs = inputs.nixpkgs.legacyPackages.${system}.appendOverlays [
          self.overlays.default
          inputs.rust-overlay.overlays.default
          inputs.julia2nix.overlays.default
        ];
      in
      rec {
        inherit nixpkgs;
        packages = { };
        devShells.default =
          (inputs.call-flake ./nix).devShells.${system}.default;
      }
    )) // {
      overlays = import ./nix/overlays.nix { inherit inputs; };
    }
    ;
}
