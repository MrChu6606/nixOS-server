{ ... }: {
  # Enable flakes and nix shell
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Configure boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "America/New_York";

  # Set automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-generations +5";
  };

  # Setup automatic optimization for de duplication
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "weekly" ];

  # Configure hostname
  networking.hostName = "Sequoia";

  # Configure ssh
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
    };
  };

  # Setup Aahi to broadcast hostname
  services.avahi =   {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };

  # Set neovim as default editor
  environment.variables.EDITOR = "nvim";

  system.stateVersion = "25.11";
}
