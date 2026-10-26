{ config, pkgs, pkgs-unstable, inputs, stylix, ... }:
	

	
{
	programs.home-manager.enable = true;
	home.stateVersion = "26.05";
	home.username = "sloogus";
    home.homeDirectory = "/home/sloogus";
	home.packages =
	(with pkgs; [
		starship
		matuwall
	])

	++

	(with pkgs-unstable; [
		#caelestia-cli
		#caelestia-shell
	]);



	programs.git = {
		enable = true;
		settings = {
			user.name = "slooga";
			user.email = "iamtheplum@gmail.com";
			init.defaultBranch = "main";
		};		
	};
	programs.foot.enable = true;
	programs.alacritty.enable = true;
	
	programs.fish = {
		enable = true;	
	};
	#programs.caelestia.enable = true;
	
	home.file."/home/sloogus/Pictures/Wallpapers" = {
		 source = ./wallpapers;
		 force = true;
		 recursive = true;
    };
	imports = [
		#inputs.caelestia-shell.homeManagerModules.default
		./config/waybar.nix
		./sloogus_rice.nix
		#./caelestia.nix
	];
  	   
}

