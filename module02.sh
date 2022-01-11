#!/usr/bin/env bash

source './assert.sh'
source './config'

log_header "MODULE 02"
log_header "ex01"
echo "${RED} Test this exercise with his main.cpp ${NORMAL}"
log_header "ex02"
cp ${MOD2_DIR}ex02/Fixed.* .
c++ module02.cpp Fixed.* -o module02
chmod 777 module02
./module02
# rm Fixed*
rm module02
