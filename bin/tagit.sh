#!/bin/bash
#
# @brief The MIT License (MIT)
# @copyright © 2023 Perry Anderson, (perry@exparx.ca)
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

if [ $# -eq 0 ]
  then
    echo -e "${ANSI_RED}No arguments supplied${ANSI_ENDCOLOR}"
    echo -e "${ANSI_WHITE}Syntax: $(basename $0) tag comment1 comment2 ... comment9${ANSI_ENDCOLOR}"
    echo -e "${ANSI_WHITE}tag should be major.minor.patch ${ANSI_ENDCOLOR}"
    echo -e "${ANSI_WHITE}for example here's the last tag:${ANSI_CYAN}"
    git describe --tags --abbrev=0 
    exit
fi

echo -e "${ANSI_BLUE}$1${ANSI_CYAN}"
git add .; git commit -m "Added $1"; git push
git tag -a $1 -m "added $1 $2 $3 $4 $5 $6 $7 $8 $9 "
git push origin $1
echo -e "${ANSI_BLUE}When the git repository window appears press Create Release${ANSI_ENDCOLOR}"
echo -e "${ANSI_BLUE}Then press Ctrl-V to paste selected contents of changelog.md${ANSI_ENDCOLOR}"
echo -e "${ANSI_ENDCOLOR}"