#! /bin/bash
# Jellybeans color scheme
# Colors taken out from the :hi screen on vim and looking at cterm{bg,fg} values
# Hex codes taken from URL:
# http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
# NOTE: Color values in here have more precedence than those in ~/.Xresources

# Normal 233 188
COLOR_BG=#151515
COLOR_FG=#e8e8d3
# black, darkgray - Visual 237 Conceal 242
COLOR_0=#3a3a3a
COLOR_8=#6c6c6c
# red, lightred - Custom 203 Constant 167
COLOR_1=#ff5f5f
COLOR_9=#d75f5f
# green, lightgreen - Custom 113 Special 107
COLOR_2=#87d75f
COLOR_10=#87af5f
# yellow, lightyellow - Function 222 Directory 186
COLOR_3=#ffd787
COLOR_11=#d7d787
# blue, lightblue - Custom 111 PreProc 110
COLOR_4=#87afff
COLOR_12=#87afd7
# magenta, lightmagenta - Identifier 183 Custom 181
COLOR_5=#d7afff
COLOR_13=#d7afaf
# cyan, lightcyan - Underlined 81 Custom 80
COLOR_6=#5fd7ff
COLOR_14=#5fd7d7
# gray, white - TabLine 145 PmenuSel 254
COLOR_7=#afafaf
COLOR_15=#e4e4e4

COLOR_BLACK=$COLOR_0
COLOR_DARKGRAY=$COLOR_8
COLOR_RED=$COLOR_1
COLOR_LRED=$COLOR_9
COLOR_GREEN=$COLOR_2
COLOR_LGREEN=$COLOR_10
COLOR_YELLOW=$COLOR_3
COLOR_LYELLOW=$COLOR_11
COLOR_BLUE=$COLOR_4
COLOR_LBLUE=$COLOR_12
COLOR_MAGENTA=$COLOR_5
COLOR_LMAGENTA=$COLOR_13
COLOR_CYAN=$COLOR_6
COLOR_LCYAN=$COLOR_14
COLOR_GRAY=$COLOR_7
COLOR_WHITE=$COLOR_15

export COLOR_BG COLOR_FG COLOR_0 COLOR_1 COLOR_2 COLOR_3 COLOR_4 COLOR_5 COLOR_6 COLOR_7 COLOR_8 COLOR_9 COLOR_10 COLOR_11 COLOR_12 COLOR_13 COLOR_14 COLOR_15
export COLOR_BLACK COLOR_DARKGRAY COLOR_RED COLOR_LRED COLOR_GREEN COLOR_LGREEN COLOR_YELLOW COLOR_LYELLOW COLOR_BLUE COLOR_LBLUE COLOR_MAGENTA COLOR_LMAGENTA COLOR_CYAN COLOR_LCYAN COLOR_GRAY COLOR_WHITE
