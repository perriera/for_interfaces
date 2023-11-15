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

if [ $# -lt 1 ]; 
  then
    echo "No arguments supplied"
    echo Syntax: $0 existing_interface 
    exit
fi

PARENT="$(basename "$(dirname "$PWD/test")")"
echo $PARENT

#
# duplicate 'include/' folders 
#

BASE=include/${PARENT}
echo $BASE

TARGET=${BASE}/$1

echo removing ${TARGET}

if [ -d "${TARGET}" ] 
then
    rm -rf ${TARGET}
fi

# cp ${SOURCE}/interface.hpp ${TARGET}/interface.hpp

# sed -i -e "s/${1}/${2}/g" ${TARGET}/interface.hpp 
# sed -i -e "s/${1^}/${2^}/g" ${TARGET}/interface.hpp 
# sed -i -e "s/${1^^}/${2^^}/g" ${TARGET}/interface.hpp 

#
# duplicate 'interfaces/' folders 
#

TARGET=interfaces/$1

echo removing ${TARGET}

if [ -d "${TARGET}" ] 
then
    rm -rf ${TARGET}
fi

# cp ${SOURCE}/mold_interface.cpp ${TARGET}/mold_interface.cpp
# cp ${SOURCE}/test_interface.cpp ${TARGET}/test_interface.cpp

# sed -i -e "s/${1}/${2}/g" ${TARGET}/mold_interface.cpp
# sed -i -e "s/${1^}/${2^}/g" ${TARGET}/mold_interface.cpp
# sed -i -e "s/${1^^}/${2^^}/g" ${TARGET}/mold_interface.cpp

# sed -i -e "s/${1}/${2}/g" ${TARGET}/test_interface.cpp
# sed -i -e "s/${1^}/${2^}/g" ${TARGET}/test_interface.cpp
# sed -i -e "s/${1^^}/${2^^}/g" ${TARGET}/test_interface.cpp
