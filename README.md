# phd-dissertation

My PhD dissertation in Operations Research and Financial Engineering
at Princeton University, titled
"Estimation and Inference in Modern Nonparametric Statistics."

## Building with Nix

Instructions for building the dissertation are detailed in `flake.nix`
and can be run using the [Nix](https://nixos.org/) package manager.
To do this, [install Nix](https://nixos.org/download/),
clone this repository and run `nix build`.
The resulting PDF will be made available at `result/dissertation.pdf`.
Alternatively, run `nix build 'github:wgunderwood/phd-dissertation'`
to build without cloning.
