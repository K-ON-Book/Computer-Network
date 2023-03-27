{
  description = "My journey of learning computer network";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" ];
      perSystem = { config, pkgs, ... }: {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            mdbook
          ];
          shellHook = ''
            cd tutorial/
            export PS1="\e[0;32m(computer_network)\$ \e[m" 
          '';
        };
      };
    };
}
