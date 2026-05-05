
{
  description = "terminal-rain-lightning Nix Flake";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: 
    let 
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems; 
    
    in {
      packages = forAllSystems (system:
        let 
          pkgs = nixpkgs.legacyPackages.${system};
        in {
          terminal-rain-lightning = pkgs.python3Packages.buildPythonApplication {
            pname = "terminal-rain-lightning";
            version = "0.1.0";
            format = "pyproject";

            src = pkgs.fetchFromGitHub {
              owner = "rmaake1";
              repo = "terminal-rain-lightning";
              rev = "master";
              sha256 = "1irrdyni9gxrnlj048vd8d1cnw9rx8k00gb65c8mxwivzagcd6qq";
            };

            nativeBuildInputs = with pkgs.python3Packages; [
              setuptools
              wheel
            ];

            pythonImportsCheck = [
              "terminal_rain_lightning"
            ];

            meta = {
              description = "Terminal-based ASCII rain and lightning animation";
              homepage = "https://github.com/rmaake1/terminal-rain-lightning";
              license = pkgs.lib.licenses.mit;
              mainProgram = "terminal-rain";
            };
          };
          default = self.packages.${system}.terminal-rain-lightning;
        }
      );
    };
}
