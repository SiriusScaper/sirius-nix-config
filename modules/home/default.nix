{inputs, username, host, ...}: {
  imports = [
   ./security/1password.nix
   ./security/protonvpn.nix
  # [(import ./aseprite/aseprite.nix)]         # pixel art editor
  # [(import ./audacious/audacious.nix)]       # music player
   ./shell/bat.nix
   ./shell/btop.nix
  # [(import ./cava.nix)]
  # ./chat/discord.nix                           # discord
   ./floorp/floorp.nix                          # firefox based browser
   ./dev/git.nix
  # [(import ./gtk.nix)]
  # [(import ./hyprland)]
  # [(import ./kitty.nix)]
  # [(import ./mako.nix)]                      # notification deamon
   ./editors/micro.nix			       # nano replacement
   ./editors/nvim.nix
   ./gaming/heroic-launcher.nix
   ./obs-studio/obs-studio.nix
   ./packages/packages.nix
   ./qbittorrent/qbittorrent.nix
  # [(import ./scripts/scripts.nix)]           # personal scripts
   ./shell/starship.nix
  # [(import ./vscodium.nix)]
    ./terminals/warp.nix
  # [(import ./waybar)]
  # [(import ./wofi/wofi.nix)]
   ./youtube-music/yt-music.nix
   ./shell/zsh.nix
  ];
}
