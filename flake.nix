{
  description = "PhD dissertation";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-23.11;
    flake-utils.url = github:numtide/flake-utils;
    dotfiles.url = git+https://github.com/wgunderwood/dotfiles?rev=293530054ada04afe2783253ade9e36c68f545b1;
    tex-fmt-repo.url = git+https://github.com/wgunderwood/tex-fmt?rev=716754e3dd69e64c1990f186b4a91442be19869e;
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    dotfiles,
    tex-fmt-repo,
  }:
    with flake-utils.lib; eachSystem allSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      programs = "${dotfiles}/programs/";
      compress-pdf = pkgs.callPackage "${programs}/compress-pdf/compress-pdf.nix" {};
      spell-check = pkgs.callPackage "${programs}/spell-check/spell-check.nix" {};
      tex-build = pkgs.callPackage "${programs}/tex-build/tex-build.nix" {};
      tex-clean = pkgs.callPackage "${programs}/tex-clean/tex-clean.nix" {};
      tex-fmt = pkgs.callPackage "${tex-fmt-repo}/default.nix" {};
      aspell = pkgs.aspellWithDicts (d: [d.en]);
    in rec {
      packages = {
        output = pkgs.stdenvNoCC.mkDerivation rec {
          name = "phd-dissertation";
          src = self;
          buildInputs = [
            pkgs.coreutils
            pkgs.just
            pkgs.bash
            pkgs.gnugrep
            aspell
            compress-pdf
            spell-check
            tex-build
            tex-clean
            tex-fmt
          ];
          phases = ["unpackPhase" "buildPhase" "installPhase"];
          buildPhase = ''
            export PATH="${pkgs.lib.makeBinPath buildInputs}";
            mkdir -p .cache/texmf-var
            env TEXMFHOME=.cache TEXMFVAR=.cache/texmf-var \
                SOURCE_DATE_EPOCH=${toString self.lastModified} \
                just
          '';
          installPhase = ''
            mkdir -p $out
            cp dissertation/phd_dissertation.pdf $out/
            cp presentation/phd_presentation.pdf $out/
          '';
        };
      };
      defaultPackage = packages.output;
    });
}
