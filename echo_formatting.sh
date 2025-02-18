#! /bin/bash

#Define ANSI escape codes for formatting
bold=$(tput bold)
red=$(tput setaf 1)
reset=$(tput sgr0)

#Display formatted echo
echo -e "${bold}${red}This is a bold and red message.${reset}"
# -e option enables interpretaion of backslash escapes for ANSI escape codes