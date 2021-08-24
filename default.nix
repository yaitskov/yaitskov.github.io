with import <nixpkgs> { };

let jekyll_env = bundlerEnv rec {
    name = "jekyll_env";
    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in
  stdenv.mkDerivation rec {
    pname = "napkin-wiki";
    version = "0.1.0";
    buildInputs = [ jekyll_env bundler ruby ];
    src = ./.;

    configurePhase = ''
      echo Configure Napkin Wiki...
      # readlink result
      # result is a dangling symlink
      # [ -L result ] && [ ! -d $(readlink result) ] &&  mkdir -p $(readlink result)
    '';

    buildPhase = ''
      ${jekyll_env}/bin/jekyll build
    '';

    installPhase = ''
      mkdir -p $out/share
      echo "before cp -r _site $out/share/doc"
      cp -r _site $out/share/doc
      echo "after cp -r _site $out/share/doc"
    '';
  }
