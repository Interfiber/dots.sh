{pkgs, ...}:
with pkgs;
pass.withExtensions (exts: [ exts.pass-otp ]) {
  programs.pass.enable = true;
}
