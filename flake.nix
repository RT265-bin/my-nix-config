{
    description = "A simple NixOS flake";
    


    inputs = {
        #source
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        daeuniverse.url = "github:daeuniverse/flake.nix";
          hyprland.url = "github:hyprwm/Hyprland";
       #plugin_name = {
        #url = "github:/Alexays/Waybar/";
        #inputs.hyprland.follows = "hyprland"; # IMPORTANT
        #};
         home-manager = {
          url = "github:nix-community/home-manager/release-25.05";
          inputs.nixpkgs.follows = "nixpkgs";

         };
        };
   
    outputs = { self, nixpkgs, home-manager , ...}@inputs: {

              nixosConfigurations ={
                RT265 = nixpkgs.lib.nixosSystem {
                modules = [
                    ./configuration.nix
                   inputs.daeuniverse.nixosModules.daed
                    home-manager.nixosModules.home-manager
                    {
                      home-manager.useGlobalPkgs = true;
                      home-manager.useUserPackages = true;
                      home-manager.users.RT = import ./home.nix;
                      home-manager.extraSpecialArgs = inputs;
                    }
                ];
              };
            };
         };













}
