{pkgs, ...}:
with builtins; {
  home.packages = with pkgs; [
    git-lfs
  ];

  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userName = "Interfiber";
    userEmail = "webmaster@interfiber.dev";

    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      user.signingKey = "2645A15C715ABDCC";

      tag.gpgSign = true;
    };
  };
}
