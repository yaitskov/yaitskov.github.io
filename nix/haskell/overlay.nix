{ haskell, lib, sources }:

let
  inherit (haskell.lib) doJailbreak dontCheck doHaddock;

  # 'fakeSha256' is helpful when adding new packages
  #
  # Set 'sha256 = fakeSha256', then replace the SHA with the one reported by
  # Nix when the build fails with a SHA mismatch error.
  inherit (lib) fakeSha256 nameValuePair listToAttrs;

in hfinal: hprev:

(listToAttrs (map (a:
  nameValuePair a.name
  (dontCheck (hfinal.callCabal2nix a.name a.source { }))) [
    # { name = "relude"; source = sources.relude; }
  ])) // {
    streamly-core = hfinal.callHackageDirect {
      pkg = "streamly-core";
      ver = "0.1.0";
      sha256 = "sha256-hoSV6Q2+X5a7hFnJAArqNPjcMaCVyX9Vz4FcxeJ+jgI=";
    } { };
    streamly = hfinal.callHackageDirect {
      pkg = "streamly";
      ver = "0.9.0";
      sha256 = "sha256-eOxVb8qQjZDo1+S7CStqYSExOg2QHWkMY+zlOYqwZak=";
    } { };
  }
