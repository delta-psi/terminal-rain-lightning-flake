# Terminal Rain Nix Flake
- Nix flake that makes the [terminal-rain-lightning by rmaake1](https://github.com/rmaake1/terminal-rain-lightning) available declaratively for Nix systems. 

# Installation
- Add as an input to your flake: 
```nix
inputs = {
    terminal-rain.url = "github:delta-psi/terminal-rain-lightning-flake";
};
```
- Add to outputs: 
```nix
outputs = inputs@{ nixpkgs, terminal-rain, ... }:
```
- Add the package to your `configuration.nix`: 
```nix
environment.systemPackages = with pkgs; [
    inputs.terminal-rain.packages.${stdenv.hostPlatform.system}.terminal-rain-lightning
];
```
- Then rebuild your system, and use normally!
