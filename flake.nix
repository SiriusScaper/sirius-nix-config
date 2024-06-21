# {
#   description = "Nixos config flake";
#
#   inputs = {
#     nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
#     #nur.url = "github:nix-community/NUR";
#
#       home-manager = {
#         url = "github:nix-community/home-manager";
#         inputs.nixpkgs.follows = "nixpkgs";
#       };
#   };
#
#   outputs = { self, nixpkgs, ... }@inputs:
#     let
#       system = "x86_64-linux";
#       pkgs = nixpkgs.legacyPackages.${system};
#     in
#     {
#      nixosConfigurations.FarScape-One = nixpkgs.lib.nixosSystem {
#       specialArgs = {inherit inputs;};
#       modules = [
#         ./hosts/homedesktop/configuration.nix
#         inputs.home-manager.nixosModules.default
#       ];
#     };
#   };
# }

{
  description = "SiriusScaper's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    nix-gaming.url = "github:fufexan/nix-gaming";
    
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { nixpkgs, self, nixos-cosmic, ...} @ inputs:
  let
#     selfPkgs = import ./pkgs;
    username = "sirius";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in
  {
#     overlays.default = selfPkgs.overlay;
   

#  inputs = {
 #   nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  #  nixos-cosmic = {
   #   url = "github:lilyinstarlight/nixos-cosmic";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  #};

  #outputs = { self, nixpkgs, nixos-cosmic }: {
    nixosConfigurations = {
      # NOTE: change "host" to your system's hostname
      tardis = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          {
            nix.settings = {
              substituters = [ "https://cosmic.cachix.org/" ];
              trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            };
          }
          (import ./hosts/laptop)
          nixos-cosmic.nixosModules.default
          #./configuration.nix
        ];
        specialArgs = { host="tardis"; inherit self inputs username; };
      };
    };
  };
}
   #nixosConfigurations = {
    #   tardis = nixpkgs.lib.nixosSystem {
     #   inherit system;
      #  modules = [ (import ./hosts/desktop) ];
       # specialArgs = { host="FarScape-One"; inherit self inputs username ; };
     # };
     # FarScape-One = nixpkgs.lib.nixosSystem {
      #  inherit system;
       # modules = [ (import ./hosts/laptop) ];
        #specialArgs = { host="tardis"; inherit self inputs username ; };
     # };
   # };
 # };
#};
