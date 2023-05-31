{pkgs, ...}:
with builtins; {
  programs.git = {
    enable = true;
    lfs.enable = true;
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
