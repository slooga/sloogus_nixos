{ pkgs, ... }: pkgs.writeShellApplication {
let
	name = "velocidrone";
	script = pkgs.writeShellApplication {
		name = name;
		runtimeInputs = with pkgs; [ curl coreutils ];
		text = built
	};
in
pkgs.stdenv.mkDerivation {
	name = name;
	buildCommand = ''
		mkdir -p $out/bin
		cp ${script}/bin/${name} $out/bin
		mkdir -p $out/share/applications
		cat <<INI > $out/share/applications/${name}.desktop
		[Desktop Entry]
		Name=${name}
		Exec=$out/bin/${name} %f
		Type=Application
		Terminal=false
		INI
	'';
	dontBuild = true;	
}


















} 
