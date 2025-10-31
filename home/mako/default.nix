{ ... }:
{

  services.mako = {
    enable = true;

    settings = {
      default-timeout = 5000;
      font = "RobotoMono Nerd Font Mono 14pt";
      background-color = "#0F111A";
      border-color = "#93A1A1";
      text-color = "#EBDBB2";
      progress-color = "over #31748f";

      "urgency=high" = {
        border-color = "#EB6F92";
      };
    };
  };

}
