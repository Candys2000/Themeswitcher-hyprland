source "$HOME/.cache/wpg/formats/colors.sh"

cat <<EOF > "$HOME/.cache/wpg/formats/waybar.css"
@define-color background $color1;
@define-color foreground $foreground;
@define-color primary $color0;
@define-color secondary $color1;
@define-color bg      $color2;
@define-color fg      $color3;
@define-color active  $color4;
@define-color urgent  $color5;
@define-color inactive $color6;
@define-color urgent $color7;
EOF
