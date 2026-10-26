{ config, pkgs, pkgs-unstable, inputs ... }:
{
	home.file.".config/caelestia" = {
	    source = ./config/caelestia;
	  	force = true;
	  	recursive = true;
	};
	programs.caelestia = {
	      enable = true;
	      systemd = {
	         enable = true;
	         target = "graphical-session.target";
	      };
	      cli.enable = true;
	      settings = {
	         paths.wallpaperDir = "~/Pictures/Wallpapers";
	        };
	      };
	      
	      home.activation.cloneCaelestiaDots = config.lib.dag.entryAfter [ "writeBoundary" ] ''
	        if [ ! -d "$HOME/.local/share/caelestia-dots" ]; then
	           $DRY_RUN_CMD ${pkgs.git}/bin/git clone \
	             https://github.com/slooga/caelestia.git \
	             "$HOME/.local/share/caelestia-dots"
	        fi
	      '';
	   
	   
	   xdg.configFile = {
	      "hypr".source           = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.local/share/caelestia-dots/hypr";
	      "fish".source           = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.local/share/caelestia-dots/fish";
	      "foot".source           = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.local/share/caelestia-dots/foot";
	      "fastfetch".source      = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.local/share/caelestia-dots/fastfetch";
	      "btop".source           = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.local/share/caelestia-dots/btop";
	      "micro".source          = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.local/share/caelestia-dots/micro";
	      "Thunar".source         = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.local/share/caelestia-dots/thunar";
	      "starship.toml".source  = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.local/share/caelestia-dots/starship.toml";
	      "hypr".force = true;
	      "fish".force = true;          
	      "foot".force = true;        
	      "fastfetch".force = true;    
	      "btop".force = true;        
	      "micro".force = true;         
	      "Thunar".force = true;        
	      "starship.toml".force = true; 
	   };
}
