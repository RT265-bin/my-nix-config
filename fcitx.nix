{ config, pkgs, ... }:
{ 
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

   #fcitx5 config
   home.file.".local/share/fcitx5" = {
   source = ./.config/fcitx5;
   recursive = true;
   executable = true;  
   };

}