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

if [ $# -lt 2 ]; 
  then
    echo -e "${ANSI_RED}No arguments supplied${ANSI_ENDCOLOR}"
    echo -e "${ANSI_BLUE}Syntax: $(basename $0) existing_interface new_interface${ANSI_ENDCOLOR}"
    exit
fi

if [[ "$1" == "$2" ]]
  then
    echo -e "${ANSI_RED}Cannot copy a folder onto itself${ANSI_ENDCOLOR}"
    echo -e "${ANSI_BLUE}Syntax: $(basename $0) existing_interface new_interface${ANSI_ENDCOLOR}"
    exit
fi

echo -e "${ANSI_BLUE}$1 $2${ANSI_CYAN}"

PARENT="$(basename "$(dirname "$PWD/test")")"
echo $PARENT

#
# duplicate 'include/' folders 
#

BASE=include/${PARENT}
echo $BASE

SOURCE=${BASE}/$1
TARGET=${BASE}/$2

echo $SOURCE
echo $TARGET

if [ ! -d "${TARGET}" ] 
then
    mkdir ${TARGET}
fi

cp ${SOURCE}/interface.hpp ${TARGET}/interface.hpp

sed -i -e "s/${1}/${2}/g" ${TARGET}/interface.hpp 
sed -i -e "s/${1^}/${2^}/g" ${TARGET}/interface.hpp 
sed -i -e "s/${1^^}/${2^^}/g" ${TARGET}/interface.hpp 

#
# duplicate 'interfaces/' folders 
#

SOURCE=interfaces/$1
TARGET=interfaces/$2
echo $SOURCE
echo $TARGET

if [ ! -d "${TARGET}" ] 
then
    mkdir ${TARGET}
fi

cp ${SOURCE}/mold_interface.cpp ${TARGET}/mold_interface.cpp
cp ${SOURCE}/test_interface.cpp ${TARGET}/test_interface.cpp

sed -i -e "s/${1}/${2}/g" ${TARGET}/mold_interface.cpp
sed -i -e "s/${1^}/${2^}/g" ${TARGET}/mold_interface.cpp
sed -i -e "s/${1^^}/${2^^}/g" ${TARGET}/mold_interface.cpp

sed -i -e "s/${1}/${2}/g" ${TARGET}/test_interface.cpp
sed -i -e "s/${1^}/${2^}/g" ${TARGET}/test_interface.cpp
sed -i -e "s/${1^^}/${2^^}/g" ${TARGET}/test_interface.cpp

echo -e "${ANSI_ENDCOLOR}"
