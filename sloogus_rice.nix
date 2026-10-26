{ config, pkgs, pkgs-unstable, inputs, ... }:
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
	    
	
	home.file.".config" = {
		source = ./config/config_end4test;
		force = true;
		recursive = true;
	};
	
}
