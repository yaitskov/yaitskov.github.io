{ system ? builtins.currentSystem or "x86_64-linux", ghc ? "ghc927",
  withProfiling ? false }:

let
  nix = import ./nix;

  pkgs = nix.pkgSetForSystem system {
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };

  inherit (pkgs) lib;

  inherit (pkgs.haskell.lib)
    enableSharedExecutables
    dontCheck
    disableLibraryProfiling disableExecutableProfiling
    enableLibraryProfiling enableExecutableProfiling ;

  controlProfiling = drv:
    if withProfiling then
      builtins.trace "profiling is ON"
        (enableLibraryProfiling (enableExecutableProfiling drv))
    else
      disableLibraryProfiling (disableExecutableProfiling drv);

  haskellPkgSetOverlay = pkgs.callPackage ./nix/haskell/overlay.nix {
    inherit (nix) sources;
  };

  sourceRegexes = [
    "^css.*$"
    "^images.*$"
    "^posts.*$"
    "^site.hs"
    "^templates.*$"
    "^package.yaml"
    "^.*\\.cabal$"
    #"^.*\\.html"
    #"^.*\\.hs"
    #"^.*\\.markdown"
  ];

  base = haskellPkgs.callCabal2nix "yaitskov-github-io" (lib.sourceByRegex ./. sourceRegexes) {};
  overlay = _hfinal: _hprev: { yaitskov-github-io = base; };
  baseHaskellPkgs = pkgs.haskell.packages.${ghc};
  haskellOverlays = [ haskellPkgSetOverlay overlay ];
  haskellPkgs = baseHaskellPkgs.override (old: {
    overrides =
      builtins.foldl' pkgs.lib.composeExtensions (old.overrides or (_: _: { }))
      haskellOverlays;
  });

  haskellLanguageServer =
    pkgs.haskell.lib.overrideCabal haskellPkgs.haskell-language-server
    (_: { enableSharedExecutables = true; });

  shell = haskellPkgs.shellFor {
    packages = p: [ p.yaitskov-github-io ];

    nativeBuildInputs = [ haskellLanguageServer ] ++ (with pkgs; [
      cabal-install
      ghcid
      hlint
      niv
      llvm
      hpack
    ]);
  };

  yaitskov-github-io = haskellPkgs.yaitskov-github-io;
in {
  inherit haskellPkgs;
  inherit ghc;
  inherit pkgs;
  inherit shell;
  inherit yaitskov-github-io;
  inherit haskellOverlays;
  inherit haskellLanguageServer;
}
