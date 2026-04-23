{ pkgs, ... }: {
  programs.zsh = {
    enable = true;

    interactiveShellInit = ''
      source $HOME/nixOS-server/shell/aliases.sh
    '';

    promptInit = ''
      autoload -U promptinit; promptinit
      prompt pure
    '';
  };

  environment.systemPackages = with pkgs; [
    pure-prompt
  ];
}
