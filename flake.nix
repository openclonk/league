{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    (flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          packages.default = pkgs.callPackage ./. { };
          devShells.default = pkgs.mkShell {
            inputsFrom = [
              self.packages.${system}.default
            ];
          };
        })
    ) // {
      overlays.default = final: prev: {
        league = self.packages.${prev.system}.default;
      };
      nixosModules.default = import ./module.nix;
      # Container for testing
      nixosConfigurations.container = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          self.nixosModules.default
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ self.overlays.default ];
            boot.isContainer = true;
            networking.firewall.allowedTCPPorts = [ 80 ];

            services.league = {
              enable = true;
              hostname = ":80";
              enableMysql = true;
              headerFile = pkgs.writeText "header.html" "";
              footerFile = pkgs.writeText "footer.html" "";
            };

          })
        ];
      };
    };
}
