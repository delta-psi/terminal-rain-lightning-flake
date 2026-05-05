# Terminal Rain Nix Flake
- Nix flake that makes the terminal-rain-lightning by rmaake1 available declaratively for Nix systems. 

# Installation
- Add as an input to your flake: 
```
inputs = {
    terminal-rain.url = "github:delta-psi/terminal-rain-lightning-flake";
};
```
- Add to outputs: 
```
outputs = inputs@{ nixpkgs, terminal-rain, ... }:
```
- Add the package to your `configuration.nix`: 
```
environment.systemPackages = with pkgs; [
    inputs.terminal-rain.packages.${stdenv.hostPlatform.system}.terminal-rain-lightning
];
```
- Then rebuild your system, and use normally!
