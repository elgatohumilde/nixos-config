{ ... }:
{

  programs.git = {
    enable = true;

    ignores = [
      "Session.vim"
      ".direnv/"
    ];

    settings = {
      user.name = "Joaquin Lopez";
      user.email = "159632612+elgatohumilde@users.noreply.github.com";

      credential.helper = "store";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

}
