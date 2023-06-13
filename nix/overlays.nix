{
  inputs,
}: {
  default =
    prev: final: {
      rustEnv = prev.rust-bin.fromRustupToolchainFile ../rust-toolchain.toml;
      julia-wrapped = inputs.julia2nix.lib.${prev.system}.julia-wrapped {
        package = inputs.julia2nix.packages.${prev.system}.julia_19-bin;
        enable = {
          python = prev.python3.buildEnv.override {
            extraLibs = with prev.python3Packages; [
              matplotlib
              pyqt5
            ];
          };
        };
      };
    }
    ;
}
