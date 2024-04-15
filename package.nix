{
  writeShellApplication,
  gnome3,
  feh,
  imagemagick,
  scrot,
  liberation_ttf,
  xclip,
}:
writeShellApplication {
  name = "meme-generator";
  runtimeInputs = [
    gnome3.zenity
    feh
    imagemagick
    scrot
    xclip
  ];
  runtimeEnv = {
    font = "${liberation_ttf}/share/fonts/truetype/LiberationSans-Regular.ttf";
  };
  text = builtins.readFile ./meme-generator.sh;
}
