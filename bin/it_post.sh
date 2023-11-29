#!/bin/bash
#
# @brief The MIT License (MIT)
# @copyright © 2023 Perry Anderson, (perry@exparx.ca)
# @ref https://github.com/perriera
#
# Permission  is  hereby  granted, free  of  charge, to  any person  obtaining
# a copy of this software and associated documentation files (the “Software”),
# to deal in the Software  without restriction,  including  without limitation
# the rights to  use,  copy,  modify,  merge, publish, distribute, sublicense,
# and/or sell  copies of the  Software,  and  to  permit  persons  to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice  and this permission  notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS  PROVIDED “AS IS”,  WITHOUT WARRANTY  OF ANY  KIND,  EXPRESS
# OR IMPLIED,  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR  PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR  COPYRIGHT HOLDERS BE  LIABLE FOR ANY  CLAIM,  DAMAGES  OR  OTHER
# LIABILITY,  WHETHER IN  AN ACTION  OF CONTRACT,  TORT OR  OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.
#

clear
source it_ansi_colors.sh
source it_version.sh

echo -e "${ANSI_WHITE}${ANSI_BRIGHT}$(basename $0)${ANSI_ENDCOLOR}"
echo -e "${ANSI_PURPLE}${INTERFACES_SCRIPTS_PROJECT}${ANSI_ENDCOLOR}"

tagit.sh

if [ $# -lt 2 ]; 
  then
    echo -e "${ANSI_RED}Arguments required${ANSI_ENDCOLOR}"
    echo -e "${ANSI_RED}vMAJOR.MINOR.PATCH "some form of relavent documentation"${ANSI_ENDCOLOR}"
    git status
    echo -e "${ANSI_MAGENTA}Example: ${ANSI_WHITE}$(basename $0) v0.7.8 \"Molding system::Interface::bash()\"${ANSI_ENDCOLOR}"
    exit
fi

echo -e "${ANSI_BLUE}$1 ${ANSI_CYAN}"

PARENT="$(basename "$(dirname "$PWD/test")")"
echo $PARENT
PROJECT_NAME=$PARENT

cd ~/dev/${PROJECT_NAME}
POST_COMMAND="tagit.sh $1 \"$2 $3 $4 $5 $6 $7 $8 $9\""

    A="${POST_COMMAND}"
    B="firefox https://github.com/${INTERFACES_SCRIPTS_VENDOR}/${PROJECT_NAME}/tags"
    C="cat changelog.md | grep "*:" >/tmp/file1.txt"
    D="xclip -selection c /tmp/file1.txt"
echo -e "${ANSI_RESET}${ANSI_CYAN}"
    echo ${A}
    echo ${B}
    echo ${C}
    echo ${D}
echo -e "${ANSI_YELLOW}${ANSI_BRIGHT}"

read -p "${POST_COMMAND}: (y/N)? " name

if [ "$name" = "Y" ];
then
    ${A}
    ${B}
    ${C}
    ${D}
fi
if [ "$name" = "n" ];
then
    echo -e "${ANSI_RED}No changes made to repository${ANSI_ENDCOLOR}"
    tagit.sh
fi

exit

