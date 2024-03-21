# phd-dissertation

My PhD dissertation in Operations Research and Financial Engineering
at Princeton University

## Building with Nix

The necessary packages are detailed in `shell.nix` and can be installed using
the [Nix](https://nixos.org/) package manager.
To do this, install Nix and run `nix-shell`.
Alternatively, the dissertation PDF document can be built directly by running
`nix-shell --pure --run "just"`.
