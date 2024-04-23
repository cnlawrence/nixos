{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "clawrence";
  home.homeDirectory = "/home/clawrence";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # GNOME Settings
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme="prefer-dark";
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll=false;
      tap-to-click=true;
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-left=["<Control><Super>Left"];
      switch-to-workspace-right=["<Control><Super>Right"];
    };
    "org/gnome/mutter" = {
      edge-tiling=true;
    };
    "org/gnome/shell".favorite-apps = [
      "brave-browser.desktop"
      "org.gnome.Console.desktop"
      "code.desktop"
    ];
    "org/gnome/shell".enabled-extensions = [
      "blur-my-shell@aunetx"
      "Vitals@CoreCoding.com"
    ];
    "org/gnome/shell/extensions/blur-my-shell" = {
        "noise-amount" = 0.080000000000000002;
    };
    "org/gnome/shell/extensions/vitals" = {
        "hot-sensors" = [
          "_processor_usage_"
          "_memory_usage_"
          "__network-rx_max__"
          "_storage_free_"
          "__temperature_avg__"
        ];
    };
  };

  # Git config
  programs.git = {
    enable = true;
    userName = "cnlawrence";
    userEmail = "1872389+cnlawrence@users.noreply.github.com";
    extraConfig = {
      branch.autosetuprebase = "always";
      branch.master.rebase = true;
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    brave
    google-chrome
    git
    vscode
    protonvpn-gui
    # youtube-music
    spotify

    gnomeExtensions.blur-my-shell
    gnomeExtensions.vitals
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/clawrence/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
