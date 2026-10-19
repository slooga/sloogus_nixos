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
	};
	
	

	# goober blah
	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, caelestia-shell, ... }: 
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
				modules = [ ./configuration.nix ];
				specialArgs = {
					inherit pkgs-unstable;
				};
			};
		};
		homeConfigurations = {
			sloogus = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ ./home.nix ];
				extraSpecialArgs = {
					inherit pkgs-unstable;
				};
			};
			
		};
	};
	
}
