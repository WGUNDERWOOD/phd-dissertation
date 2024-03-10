let
pkgs = import <nixpkgs> { };
dotfiles = builtins.fetchGit {
    url = "https://github.com/WGUNDERWOOD/dotfiles";
    rev = "2b1457479d611d6615dcba37803a85cbd35e8dad";
};
programs = "${dotfiles}/programs/";
latexindent-fast = pkgs.callPackage "${programs}/latexindent-fast.nix" {};
long-lines = pkgs.callPackage "${programs}/long-lines/long-lines.nix" {};
spell-check = pkgs.callPackage "${programs}/spell-check/spell-check.nix" {};
tex-check = pkgs.callPackage "${programs}/tex-check/tex-check.nix" {};
tex-clean = pkgs.callPackage "${programs}/tex-clean.nix" {};
todo-finder = pkgs.callPackage "${programs}/todo-finder/todo-finder.nix" {};
in pkgs.mkShell {
    buildInputs = [
        pkgs.just
        pkgs.texlive.combined.scheme-full
        latexindent-fast
        long-lines
        spell-check
        tex-check
        tex-clean
        todo-finder
    ];
}