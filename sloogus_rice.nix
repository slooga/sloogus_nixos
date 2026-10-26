{ config, pkgs, pkgs-unstable, inputs, stylix, ... }:
{
    
	
	programs.rofi = {
		enable = true;
		theme = "sidebar";
		font = "sans-serif";
		package = pkgs.rofi;
		modes = [
			"drun"
			"run"
			"window"
			"ssh"	
		];
		extraConfig = {
			show-icons = true;
		};
	};
	stylix = {
		enable = true;
		base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-hard.yaml";
		autoEnable = false;
		image = "~/Pictures/Wallpapers/1338277.png";
	};
	
	#home.file.".config" = {
	#	source = ./config/config_end4test;
	#	force = true;
	#	recursive = true;
	#};
	
}
