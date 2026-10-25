{ pkgs, ... }: pkgs.stdenv.mkDerivation rec {
  name = "velocidrone";
  buildCommand = let
  	data = pkgs.runCommand "my-data" {
  		nativeBuildInputs = [ pkgs.unzip ];
  	} ''
  		mkdir -p "$out"
  		unzip -q ${./production-launcher-debian.zip} -d "$out"
  		'';		
  	
    script = pkgs.writeShellApplication {
      name = name;
      runtimeInputs = with pkgs; [ curl coreutils ];
      text = ''
      	export MY_DATA_DIR="${data}"
      	${builtins.readFile ./run-vdrone-launcher.sh}
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
