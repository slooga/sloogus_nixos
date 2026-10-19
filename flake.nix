{
	description = "my first flake";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
		home-manager.url = "github:nix-community/home-manager/release-26.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	# goober blah
	outputs = { self, nixpkgs, home-manager, ... }: 
	let 
		
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		timezone = "Pacific/Auckland";
		locale = "en_US.UTF-8";
		hostname = "nixos";
		pkgs = nixpkgs.legacyPackages.${system};
	
	in {
		nixosConfigurations = {
			${hostname} = lib.nixosSystem {
				inherit system;
				modules = [ ./configuration.nix ];
			};
		};
		homeConfigurations = {
			sloogus = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ ./home.nix ];
			};
			
		};
	};
	
}
