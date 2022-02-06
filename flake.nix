{ inputs =
    { make-shell.url = "github:ursi/nix-make-shell/1";
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
      utils.url = "github:ursi/flake-utils/8";
    };

  outputs = { utils, ... }@inputs:
    with builtins;
    utils.apply-systems { inherit inputs; }
      ({ make-shell, pkgs, ... }:
         let l = p.lib; p = pkgs; in
         { packages.images =
             let
               images =
                 l.mapAttrs
                   (image: sha256:
                      fetchurl
                        { inherit sha256;

                          url =
                            "https://ee.wrya.net/sprites/prod/VR1574197275-1.14.6/sheets/"
                            + image;
                        }
                   )
                   (import ./images.nix);
             in
             p.runCommand "images" {}
               ''
               mkdir $out; cd $out

               ${toString
                   (l.mapAttrsToList
                      (name: image: "ln -s ${image} ${name};")
                      images
                   )
               }
               '';

           devShell =
             make-shell
               { packages = [ (p.python3.withPackages (pp: [ pp.pillow ])) ];
                 aliases.build-sheets = "python sprite_replacer.py";

                 setup =
                   ''
                   mkdir -p sprite-packs sprite-sheets/custom
                   nix build .#images -o sprite-sheets/default
                   touch texture.txt

                   echo "
                   run 'build-sheets' to build your sprite sheets
                   "
                   '';
               };

         }
      );
}
