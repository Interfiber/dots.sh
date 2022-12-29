{pkgs, ...}:
with builtins; {
  home.packages = with pkgs; [
    (pkgs.pass.withExtensions (ext: [ext.pass-otp]))
    # todo ein script machen was hier tut
    # zbarimg -q --raw 2018-12-18-114509.png   | pass otp insert mindcurv/cloudamqp/otp
    pkgs.zbar
    pkgs.wl-clipboard
    pkgs.yad
    pkgs.ydotool
  ];
}
