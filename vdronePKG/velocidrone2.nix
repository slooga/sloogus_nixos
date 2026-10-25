{ pkgs, ... }: pkgs.stdenv.mkDerivation rec {
  name = "velocidrone";
  buildCommand = let
  	data = pkgs.runCommand "my-data" {
  		nativeBuildInputs = [ pkgs.unzip ];
  	} ''
  		mkdir -p "$out"
  		unzip -q ${./production-launcher-debian.zip} -d "$out"
  		chmod +x "$out/Launcher"
  		'';		
  	
    script = pkgs.writeShellApplication {
      name = name;
      runtimeInputs = with pkgs; [ curl coreutils ];
      text = ''
      	: "''${HOME:?HOME is not set}"
      	install_dir="$HOME/.local/share/velocidrone"
      	mkdir -p "$install_dir"
      	cp -R ${data}/. "$install_dir"/
      	chmod -R u+rwX "$install_dir"
      	ls -latr
	
      	cd "$install_dir"
      	#UNITY_DISABLE_PLUGINS=1 SDL_VIDEO_FULLSCREEN_HEAD=0 SDL_VIDEO_FULLSCREEN_DISPLAY=0  SDL_VIDEODRIVER=x11  QT_QPA_PLATFORM=xcb steam-run ./Launcher  -screen-width 1280 -screen-height 720
      	
      	
      	'';
    };
    desktopEntry = pkgs.makeDesktopItem {
      name = name;
      desktopName = name;
      exec = "${script}/bin/${name} %f";
      terminal = true;
    };
  in ''
  	
    mkdir -p $out/bin
    cp ${script}/bin/${name} $out/bin
    mkdir -p $out/share/applications
    cp ${desktopEntry}/share/applications/${name}.desktop $out/share/applications/${name}.desktop
  '';
  dontBuild = true;
}
