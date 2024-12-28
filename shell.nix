{}: (import ./default.nix {}).shell.overrideAttrs(_: {
  shellHook = ''
    echo 'run "cabal run site build" to update HTML'
  '';
})
