# jlrs :: usecases & templates & experimental & thinking

This repo hopes to be a best practice playground for combining julia with Rust, providing some potential use cases, scenes, attempts, and ideas. An audacious attempt from academia to industry takes Julia to actual production.

# CI/CD

- primarily Nix based
  - [example](https://github.com/JuliaCN/Julia2Nix.jl/tree/main/templates/jlrs)
  ```sh
  nix flake init --template github:JuliaCN/Julia2Nix.jl#templates.jlrs
  ```

# core library

- [Julia bindings for Rust](https://github.com/Taaitaaiger/jlrs)
- [APIs examples](https://github.com/Taaitaaiger/jlrs/examples)
- [JlrsCore](https://github.com/Taaitaaiger/JlrsCore.jl)

# Special thanks

- @[Taaitaaiger](https://github.com/Taaitaaiger) jlrs's author
