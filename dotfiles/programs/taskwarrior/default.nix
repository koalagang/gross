# See A Dive into Taskwarrior Ecosystem with Tomas Babej (https://www.youtube.com/watch?v=tijnc65soEI)
# for a really great video on taskwarrior

{ config, pkgs, ... }:

{
  programs.taskwarrior = {
    enable = true;

    # will add my own dracula theme at some point
    # TODO: nix-colors
    colorTheme = "dark-256";

    config = {
      # Sunday is on the weekend, mate
      weekstart = "Monday";

      # running `task next` should never show me more than 20 tasks
      report.next.filter = "+PENDING -BLOCKING limit:20";

      alias = {
        a = "add";
        an = "annotate";
        c = "done";
        d = "delete";
        m = "mod";
        n = "next";
        s = "start";
      };

      # Set 'low priority' to reduce the urgency
      # (by default it increases it by 1.8)
      urgency.uda.priority.L.coefficient = -1.8;

      hooks.location = "$XDG_CONFIG_HOME/task/hooks";
    };
  };

  home = {
    shellAliases = {
      ta = "task"; # yes, I am that lazy

      # Credits to u/Andonome (OP) for this one
      # https://www.reddit.com/r/taskwarrior/comments/uvwqlz/share_your_aliases/
      tal = "task add dep:\"$(task +LATEST uuids)\"";
      # Every task created with tal is a dependency of the most recently created task.
      # Thus, you can chain a series of dependencies together.

      to = "taskopen"; # see below
    };

    packages = [ pkgs.taskopen ];
    file."${config.xdg.configHome}/task/taskopenrc".text = ''
      TASKBIN='task'
      # Directory has to be manually created
      NOTES_FOLDER="$HOME/Documents/neorg/tasknotes/" # the leading slash here is important
      NOTES_EXT=".norg" # Neorg
      PATH_EXT=${pkgs.taskopen}/share/taskopen/scripts
    '';
    sessionVariables.TASKOPENRC = "${config.xdg.configHome}/task/taskopenrc";
  };
}
