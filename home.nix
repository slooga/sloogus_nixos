{ config, pkgs, pkgs-unstable, inputs, ... }:
#	home.packages = with pkgs-unstable; [
#	  	caelestia-shell
#	  	caelestia-cli
#	  ];
#
	#programs.home-manager.enable = true;
{
	programs.home-manager.enable = true;
	home.stateVersion = "26.05";
	home.username = "sloogus";
    home.homeDirectory = "/home/sloogus";
	home.packages = with pkgs; [
		starship
	];

	programs.git = {
		enable = true;
		settings = {
			user.name = "slooga";
			user.email = "iamtheplum@gmail.com";
			init.defaultBranch = "main";
		};		
	};
	programs.fish = {
		enable = true;	
	};

    /*
	home.file.".config/caelestia" = {
	    source = ./config/caelestia;
	  	force = true;
	  	recursive = true;
	};
	home.file."/home/sloogus/Pictures/Wallpapers" = {
		 source = ./wallpapers;
		 force = true;
		 recursive = true;
    };

	home.file.".config/hypr" = {
		source = ./config/end4/hypr;
		force = true;
		recursive = true;
	};
	home.file.".config/fish" = {
		source = ./config/end4/fish;
		force = true;
		recursive = true;
	};
	home.file.".config/foot" = {
		source = ./config/end4/foot;
		force = true;
		recursive = true;
	};
    */

	home.file.".config" = {
		source = ./config/config_end4test;
		force = true;
		recursive = true;
	};
	imports = [
		#inputs.caelestia-shell.homeManagerModules.default
		./config/waybar.nix
	];
	   
	/*
	programs.caelestia = {
	      enable = false;
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
		*/
  	   
}

/*
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sloogus";
  home.homeDirectory = "/home/sloogus";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

 # imports = [
  #	inputs.caelestia-shell.homeManagerModules.default
  #];

  

  # The home.packages option allows you to install Nix packages into your
  # environment.

  
  
  	
  


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/sloogus/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  /*
  home.file.".config/hypr/" = {
    source = ./config/hypr;
  	force = true;
  	recursive = true;
  };
  home.file.".config/kitty/" = {
    source = ./config/kitty;
    force = true;
    recursive = true;
  };
  


  programs.caelestia = {
    enable = true;
    systemd = {
      enable = false; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [];
    };
    settings = {
      bar.statusIcons = [
        { id = "lockStatus"; enabled = true; }
        { id = "network"; enabled = true; }
        { id = "bluetooth"; enabled = true; }
        { id = "battery"; enabled = false; }
      ];
      paths.wallpaperDir = "~/Pictures/Wallpapers";
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = false;
      };
    };

	home.activation.cloneCaelestiaDots = config.lib.dag.entryAfter [ "writeBoundary" ] ''
	        if [ ! -d "$HOME/.local/share/caelestia-dots" ]; then
	           $DRY_RUN_CMD ${pkgs.git}/bin/git clone \
	             https://github.com/caelestia-dots/caelestia.git \
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
	      
       };
 
  

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
*/
