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

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    brave
    # google-chrome
    git
    vscode
    protonvpn-gui
    spotify
    zoom-us

    gnomeExtensions.blur-my-shell
    gnomeExtensions.vitals
    gnomeExtensions.workspaces-indicator-by-open-apps
    gnome.dconf-editor
    gnome.gnome-tweaks
  ];

  # GNOME Settings
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme="prefer-dark";
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll=false;
      tap-to-click=true;
      click-method="areas";
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-left=["<Control><Super>Left"];
      switch-to-workspace-right=["<Control><Super>Right"];
    };
    "org/gnome/desktop/notifications" = {
      show-in-lock-screen = false;
    };
    "org/gnome/desktop/background" = {
      "color-shading-type"="solid";
      "picture-options"="zoom";
      "picture-uri"="file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
      "picture-uri-dark"="file:///run/current-system/sw/share/backgrounds/gnome/blobs-d.svg";
      "primary-color"="#241f31";
      "secondary-color"="#000000";
    };  
    "org/gnome/mutter" = {
      edge-tiling=true;
    };
    "ca/desrt/dconf-editor" = {
      show-warning=false;
    };
    "org/gnome/Console" = {
      custom-font="Source Code Pro 11";
      last-window-size="(652, 480)";
      theme="night";
      use-system-font=false;
    };
    "org/gnome/shell".favorite-apps = [
      "brave-browser.desktop"
      "org.gnome.Console.desktop"
      # "Alacritty.desktop"
      "code.desktop"
      "spotify.desktop"
    ];
    "org/gnome/shell".enabled-extensions = [
      "blur-my-shell@aunetx"
      "Vitals@CoreCoding.com"
      "workspaces-by-open-apps@favo02.github.com"
    ];
    "org/gnome/settings-daemon/plugins/media-keys" = {
      home=["<Super>e"];
      search=["<Super>q"];
    };
    "org/gnome/shell/keybindings" = {
      show-screenshot-ui=["<Super><Shift>S"];
    };
    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden=true;
    };
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
        unit=1;
    };
    "org/gnome/shell/extensions/workspaces-indicator-by-open-apps" = {
      "apps-all-desaturate" = false;
      "hide-activities-button"=true;
      "icons-group"="OFF";
      "indicator-round-borders"=false;
      "indicator-show-active-workspace"=true;
      "indicator-use-custom-names"=false;
      "position-in-panel"="LEFT";
      "position-index"=0;
      "scroll-inverse"=false;
      "scroll-wraparound"=true;
    };
  };

  # git config
  programs.git = {
    enable = true;
    userName = "cnlawrence";
    userEmail = "1872389+cnlawrence@users.noreply.github.com";
    extraConfig = {
      branch.autosetuprebase = "always";
      branch.master.rebase = true;
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through "home.file".
  home.file = {
    # # Building this configuration will create a copy of "dotfiles/screenrc" in
    # # the Nix store. Activating the configuration will then make "~/.screenrc" a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ""
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # "";
  };

  # Home Manager can also manage your environment variables through
  # "home.sessionVariables". If you don"t want to manage your shell through Home
  # Manager then you have to manually source "hm-session-vars.sh" located at
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
