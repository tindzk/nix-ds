# Largely inspired from http://datakurre.pandala.org/2015/10/nix-for-python-developers.html
with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "env";

  # Mandatory boilerplate for buildable env
  env = buildEnv { name = name; paths = buildInputs; };
  builder = builtins.toFile "builder.sh" ''
    source $stdenv/setup; ln -s $env $out
  '';

  # Customizable development requirements
  buildInputs = [
    # Add packages from nix-env -qaP | grep -i needle queries

    # With Python configuration requiring a special wrapper
    (python35.buildEnv.override {
      ignoreCollisions = true;
      extraLibs = with python35Packages; [
        numpy
        scipy
        pandas
        matplotlib
        scikitlearn
        tqdm
        jupyter
      ];
    })
  ];

  # Customizable development shell setup with at last SSL certs set
  shellHook = ''
    export SSL_CERT_FILE=${cacert}/etc/ssl/certs/ca-bundle.crt
  '';
}
