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

source it_ansi_colors.sh
source it_version.sh

echo -e "${ANSI_BLUE}$(basename $0)${ANSI_ENDCOLOR}"
echo -e "${ANSI_PURPLE}${INTERFACES_SCRIPTS_PROJECT}${ANSI_ENDCOLOR}"

if [ $# -gt 0 ]; 
  then
    echo -e "${ANSI_RED}No arguments required${ANSI_ENDCOLOR}"
    echo -e "${ANSI_RED}must be in root folder of injections-based project${ANSI_ENDCOLOR}"
    echo -e "${ANSI_BLUE}Syntax: $(basename $0) ${ANSI_ENDCOLOR}"
    exit
fi

echo -e "${ANSI_BLUE}$1 ${ANSI_CYAN}"

PARENT="$(basename "$(dirname "$PWD/test")")"
echo $PARENT
PROJECT_NAME=$PARENT

WHERE=/home/dev/dev/interfaces/docs/for_interfaces/bin
echo -e "${ANSI_CYAN}contents of: ${WHERE}${ANSI_BLUE}"
echo -e "${ANSI_RESET}"
ls "${WHERE}" -la
echo -e "${ANSI_RESET}"
echo -e "${ANSI_WHITE}disclaimer: interface bash scripts are PATH found inside ~/dev/interfaces/docs/${ANSI_BLUE}"
echo -e "${ANSI_WHITE}            however they are maintained inside ~/dev/for_interfaces/bin${ANSI_BLUE}"
echo -e "${ANSI_YELLOW}           (just remember to run bin/docs.sh (or docs.sh) to update your project)${ANSI_BLUE}"

echo -e "${ANSI_ENDCOLOR}"

exit

