#!/usr/bin/env bash
input_path="/tmp/meme_in.png"
output_path="/tmp/meme_out.png"
scrot -s -F "$input_path"
input="$(zenity --forms --text="Create Meme" --add-entry="Top text" --add-entry="Bottom text" --separator=:)"
#shellcheck disable=2036 disable=3011 disable=2259
IFS=: read -r uppertext lowertext <<<  "$input"
echo "$uppertext"
echo "$lowertext"
echo "$font"
convert "$input_path" -font "$font" -fill yellow -pointsize 50 -gravity North -annotate +0+100 "$uppertext" -fill yellow -pointsize 50 -gravity South -annotate +0+100 "$lowertext" "$output_path"
echo "done"
feh -. "$output_path"
xclip -selection clipboard -t "image/png" -i "$output_path"
