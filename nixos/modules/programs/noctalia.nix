{ pkgs, inputs, ... }:
{
#  home-manager.users.lain = {
    # import the home manager module
 #   imports = [
#      inputs.noctalia.homeModules.default
#    ];
 #   programs.noctalia-shell.systemd.enable = true;
    # configure options
   programs.noctalia-shell = {
   #   enable = true;
      settings = {
        # configure noctalia here
        bar = {
          density = "compact";
          position = "top";
          showCapsule = false;
          widgets = {
            left = [
              {
                id = "ControlCenter";
                useDistroLogo = true;
              }
              {
                id = "Network";
              }
              {
                id = "Bluetooth";
              }
            ];
            center = [
              {
                hideUnoccupied = false;
                id = "Workspace";
                labelMode = "none";
              }
            ];
            right = [
              {
                alwaysShowPercentage = true;
                id = "Battery";
                warningThreshold = 30;
              }
              {
                formatHorizontal = "HH:mm";
                formatVertical = "HH mm";
                id = "Clock";
                useMonospacedFont = true;
                usePrimaryColor = true;
              }
            ];
          };
        };
        colorSchemes.predefinedScheme = "Monochrome";
        general = {
#          avatarImage = "/home/drfoobar/.face";
          radiusRatio = 0.2;
        };
        location = {
          monthBeforeDay = false;
          name = "Albemarle, America";
        };
      };
      # this may also be a string or a path to a JSON file.
    };
  }

