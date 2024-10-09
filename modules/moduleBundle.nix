{ lib, ... }:

{
  imports = [
    ./zsh/zsh.nix
    ./alacritty/alacritty.nix
    ./neovim/neovim.nix
    ./git/git.nix
  ];
}
