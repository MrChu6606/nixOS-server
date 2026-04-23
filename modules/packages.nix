{ pkgs, ... }: let
  stable = with pkgs; [
    wget
    git
    fastfetch
    curl
    neovim
    yazi
    wl-copy
  ];
in {
  environment.systemPackages = stable;
}
