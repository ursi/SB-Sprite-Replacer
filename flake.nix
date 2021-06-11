{ inputs =
    { nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
      utils.url = "github:ursi/flake-utils/2";
    };

  outputs = { utils, ... }@inputs:
    with builtins;
    utils.default-systems
      ({ make-shell, pkgs, ... }:
         let p = pkgs; l = p.lib; in
         { packages.images =
             let
               images =
                 l.mapAttrs
                   (image: sha256:
                      fetchurl
                        { url =
                            "https://ee.wrya.net/sprites/prod/VR1574197275-1.14.6/sheets/"
                            + image;
                          inherit sha256;
                        }
                   )
                   (import ./images.nix);
             in
             p.runCommand "images" {}
               ''
               mkdir $out

               ${toString
                   ((l.mapAttrsToList
                       (name: image: "ln -s ${image} $out/${name};")
                    )
                    images
                   )
               }
               '';

           devShell =
             make-shell
               { packages =
                   with pkgs;
                   [ (python3.withPackages (pp: [ pp.pillow ]))
                   ];

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
      )
      inputs;
}
