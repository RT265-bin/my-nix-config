{ config, pkgs, ... }:
{ 
   home.username = "RT";
   home.homeDirectory = "/home/RT";
   
  

   home.packages = with pkgs;[

     texliveFull
     texstudio
     pkgs.viu
     pkgs.obs-studio
     mako
     mpvpaper
     #hyprpaper
     hyprlock
     pkgs.hyprshot
     pkgs.hyprlang
     pkgs.hyprgraphics
     pkgs.hyprland-protocols
     pkgs.hyprutils
     pkgs.xdg-desktop-portal-hyprland
     wlogout
     fuzzel
     waybar
     pkgs.bilibili
     qq
     zsh
     zsh-completions
     autojump
     zsh-autosuggestions
     zsh-syntax-highlighting
     zimfw
     listen1
     wechat
     hmcl
     wofi
     rofi
     #proton-ge-bin
     protontricks
     #wine
     xdg-user-dirs
     nnn
     wl-clipboard
     pkgs.cliphist
     libsForQt5.polkit-kde-agent
     pkgs.kdePackages.dolphin
     pkgs.source-han-sans-vf-ttf
     pkgs.fira-code-symbols
     pkgs.nerd-fonts.hack
     #pkgs.fcitx5-rime
     #pkgs.fcitx5
     pkgs.xorg.xev
     wineWowPackages.stable
     #wine
     #(wine.override { wineBuild = "wine64"; })
     #wine64
     #wineWowPackages.staging
     winetricks
     #pkgs.wineWowPackages.waylandFull
     pkgs.protonup-ng
     steam
     #jdk8
     #jdk11
     #jdk17
     #jdk21
     #jdk24
     pkgs.swww
   ];

    #steam
    #programs.steam ={
      #enable = true;
      #extest.enable = true;
      #protontricks.enable = true;

    #};




   #config of git
   programs.git = {
     enable = true;
     userName = "RT265-bin";
     userEmail = "t2976376589@outlook.com";
   };
 
  programs.alacritty = {
  enable = true;
  };


  #fcitx5
   i18n.inputMethod = {
       type = "fcitx5";
       enable = true;
       fcitx5.addons = with pkgs; [
         fcitx5-gtk             # alternatively, kdePackages.fcitx5-qt
         fcitx5-chinese-addons  # table input method support
         fcitx5-nord            # a color theme
         fcitx5-rime
         fcitx5-pinyin-moegirl
       ];
     };



#programs.zsh = {
  #enable = true;
  #enableCompletion = true;
  #autosuggestions.enable = true;
  #syntaxHighlighting.enable = true;

  #shellAliases = {
    #ll = "ls -l";
    #update = "sudo nixos-rebuild switch";
  #};
  #history.size = 10000;
  #history.ignoreAllDups = true;
  #history.path = "$HOME/.zsh_history";
  #history.ignorePatterns = ["rm *" "pkill *" "cp *"];
#zplug = {
    #enable = true;
    #plugins = [
      #{ name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
      #{ name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
      #];
   #};
  # With Oh-My-Zsh:
  #oh-my-zsh = {
    #enable = true;
    #plugins = [
      #"git"         # also requires `programs.git.enable = true;`
      #"thefuck"     # also requires `programs.thefuck.enable = true;` 
    #];
    #theme = "robbyrussell";
  #};

# With Antidote:
  #antidote = {
    #enable = true;
    #plugins = [''
      #zsh-users/zsh-autosuggestions
      #ohmyzsh/ohmyzsh path:lib/git.zsh
    #'']; # explanation of "path:..." and other options explained in Antidote README.
    #};
   
# Manual
  #plugins = [
    #{
      #name = "zsh-autocomplete";
      #src = pkgs.fetchFromGitHub {
        #owner = "marlonrichert";
        #repo = "zsh-autocomplete";
        #rev = "23.07.13";
        #sha256 = "sha256-/6V6IHwB5p0GT1u5SAiUa20LjFDSrMo731jFBq/bnpw=";
      #};
    #}
    #{
      #name = "powerlevel10k";
      #src = pkgs.zsh-powerlevel10k;
      #file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    #}
    #{
      #name = "powerlevel10k-config";
      #src = ./p10k-config;
      #file = "p10k.zsh";
    #}
    #{
      #name = "zsh-syntax-highlighting";
      #src = pkgs.fetchFromGitHub {
        #owner = "zsh-users";
        #repo = "zsh-syntax-highlighting";
        #rev = "0.8.0";
        #sha256 = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
      #};
    #}
  #]; 
#};

 #zimconfig
  #home.file.".zimrc" = {
      #source = ./.config/.zimrc;
      #executable = true;  
  #};
  #home.file.".zim" = {
      #source = ./.config/.zim;
      #recursive = true;
      #executable = true;  
  #};
  #home.file.".zshrc" = {
      #source = ./.config/.zshrc;
      #executable = true;  
  #};
  #home.file.".p10k.zsh" = {
      #source = ./.config/.p10k.zsh;
      #executable = true;  
  #};





  #programs.bash = {
  #enable = true;
  #enableCompletion = true;
  #bashrcExtra = ''
   #export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
  #'';
 # };




   #nix fetch
   home.file."nixlogo.png".source = ./fetchlogo/nixlogo.png;

   
   #rofi
   home.file.".config/rofi" = {
    source = ./rofi;
    recursive = true;
    executable = true;  
   #home.file."~/.local/share/rofi/themes/rounded-nord-dark.rasi".source = ./rofi/themes/rounded-nord-dark.rasi;
   #home.file."~/.local/share/rofi/themes/rounded-common.rasi".source = ./rofi/themes/rounded-common.rasi;
   };


   #waybar
   programs.waybar.enable = true;
   xdg.configFile."waybar/config.jsonc".source = ./waybar/config.jsonc;
   xdg.configFile."waybar/style.css".source = ./waybar/style.css;
  
  #hyprland
  programs.kitty.enable = true; # required for the default Hyprland config
  home.file.".config/hypr" = {
      source = ./hypr;
      recursive = true;
      executable = true;  
  };
  wayland.windowManager.hyprland.enable = true; # enable Hyprland



  # Optional, hint Electron apps to use Wayland:
  # home.sessionVariables.NIXOS_OZONE_WL = "1";












 home.stateVersion = "25.05";
}
