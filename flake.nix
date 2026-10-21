{
	description = "my first flake";
	
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-26.05";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager/release-26.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		caelestia-shell = {
		      url = "github:caelestia-dots/shell";
		      inputs.nixpkgs.follows = "nixpkgs";
		    };
	    caelestia-cli = {
	    	url = "github:caelestia-dots/cli";
	    	inputs.nixpkgs.follows = "nixpkgs";
	    };
	};
	
	

	# goober blah
	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, caelestia-shell, caelestia-cli, ... }@inputs: 
	let 
		
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		timezone = "Pacific/Auckland";
		locale = "en_US.UTF-8";
		hostname = "nixos";
		pkgs = nixpkgs.legacyPackages.${system};
		pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	
	in {
		nixosConfigurations = {
			${hostname} = lib.nixosSystem {
				inherit system;
				modules = [
				 ./configuration.nix 
				 {
				 	nixpkgs.overlays = [
				 		(final: prev: {
				 			caelestia-shell = caelestia-shell.packages.${system}.caelestia-shell;
				 			caelestia-cli = caelestia-shell.inputs.caelestia-cli.packages.${system}.caelestia-cli;
				 		})
				 	];
				 }
				];
				
				specialArgs = {
					inherit pkgs-unstable;
					inherit inputs;
				};
			};
		};
		homeConfigurations = {
			sloogus = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ ./home.nix ];
				extraSpecialArgs = {
					inherit pkgs-unstable;
					inherit inputs;
				};
			};
			
		};
	};
	
}
