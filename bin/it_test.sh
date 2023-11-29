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

source ansi_colors.sh
source version.sh

echo -e "${ANSI_BLUE}$(basename $0)${ANSI_ENDCOLOR}"
echo -e "${ANSI_PURPLE}${INTERFACES_SCRIPTS_PROJECT}${ANSI_ENDCOLOR}"

if [ $# -gt 0 ]; 
  then
    echo -e "${ANSI_RED}No arguments required${ANSI_ENDCOLOR}"
    echo -e "${ANSI_RED}must be in root folder of injections-based project${ANSI_ENDCOLOR}"
    echo -e "${ANSI_BLUE}Syntax: $(basename $0) ${ANSI_ENDCOLOR}"
    echo -e "${ANSI_BLUE}failed: $(basename $0) | grep FAILED ${ANSI_ENDCOLOR}"
    exit
fi

echo -e "${ANSI_BLUE}$1 ${ANSI_CYAN}"

PARENT="$(basename "$(dirname "$PWD/test")")"
echo $PARENT
PROJECT_NAME=$PARENT

cd ~/dev/${PROJECT_NAME}
rm build/lib*
rm build/run-unittests-${PROJECT_NAME}
cd build; cmake ..; make; cd ..

FILE=build/run-unittests-${PROJECT_NAME}
if [ -f "$FILE" ]; then
  $FILE
fi
if [ ! -f "$FILE" ]; then
  echo "$FILE does not exist, (build failed?)"
fi

echo -e "${ANSI_GREEN}"
ls build
echo -e "${ANSI_ENDCOLOR}"
it_tag.sh

exit

