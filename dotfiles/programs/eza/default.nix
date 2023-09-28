{
  programs.eza = {
    enable = true;
    icons = true;
  };

  home.shellAliases = {
    ls = "eza --all --long --no-permissions --no-user --no-time --group-directories-first --sort=size --binary";
    # for when I typo
    sl = "eza --all --long --no-permissions --no-user --no-time --group-directories-first --sort=size --binary";
    ll = "eza --long";
    tree = "eza --tree";
  };
}
