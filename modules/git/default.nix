{ ... }:
{
  programs.git = {
    enable = true;

    userName = "Joaquin Lopez";
    userEmail = "159632612+elgatohumilde@users.noreply.github.com";

    ignores = [
      "Session.vim"
      ".direnv/"
    ];

    extraConfig = {
      credential.helper = "store";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
