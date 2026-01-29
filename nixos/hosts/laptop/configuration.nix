
{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-5c5770fc-e41e-4f50-a1ec-29832b9d5050".device = "/dev/disk/by-uuid/5c5770fc-e41e-4f50-a1ec-29832b9d5050";
  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.tuned.enable = true; 
  services.upower.enable = true;
  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  services.xserver.enable = true;

  programs.niri.enable = true;
#  services.mullvad-vpn.package = pkgs.mullvad-vpn;
#  services.mullvad-vpn.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    
  };

  
  
  users.users.lain = {
    isNormalUser = true;
    description = "lain";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
     
    ];
  };
  
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "lain" = import ./home.nix;
  };
};

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    
    nmap
    alacritty
    fuzzel
    git
  ];

  networking.nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ]; 

  
#  services.resolved = {
#    enable = true;
#    dnssec = "true";
#    domains = [ "~." ];
#    fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
#    dnsovertls = "true";
#};
  system.stateVersion = "25.11"; 

}
