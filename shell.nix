let
pkgs = import <nixpkgs> { };

dotfiles = builtins.fetchGit {
    url = "https://github.com/WGUNDERWOOD/dotfiles";
    rev = "293530054ada04afe2783253ade9e36c68f545b1";
};

programs = "${dotfiles}/programs/";
compress-pdf = pkgs.callPackage "${programs}/compress-pdf/compress-pdf.nix" {};
long-lines = pkgs.callPackage "${programs}/long-lines/long-lines.nix" {};
spell-check = pkgs.callPackage "${programs}/spell-check/spell-check.nix" {};
tex-build = pkgs.callPackage "${programs}/tex-build/tex-build.nix" {};
tex-check = pkgs.callPackage "${programs}/tex-check/tex-check.nix" {};
tex-clean = pkgs.callPackage "${programs}/tex-clean/tex-clean.nix" {};
tex-fmt = pkgs.callPackage "${programs}/tex-fmt/tex-fmt.nix" {};
todo-finder = pkgs.callPackage "${programs}/todo-finder/todo-finder.nix" {};

in pkgs.mkShell {
    buildInputs = [
        pkgs.just
        compress-pdf
        long-lines
        spell-check
        tex-build
        tex-check
        tex-clean
        tex-fmt
        todo-finder
    ];
}
