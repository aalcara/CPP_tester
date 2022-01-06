#!/usr/bin/env bash

source './assert.sh'
source './config'

NUM_TESTS=10

function test1(){
	echo -n "TEST01 "
	filename=tester.txt
	filecontent="abcdabcd abcdabcd abcdabcd"
	s1=" "
	s2="ab"
	
	echo $filecontent > $filename

	result=$(${MOD1_DIR}ex04/replace $filename $s1 $s2)
	expected="Whrong number of arguments"

	assert_eq "$result" "$expected" "not equivalent!"
	if [ "$?" == 0 ]; then
		log_success "sucess"
	fi
}

function test2(){
	echo -n "TEST02 "
	filename=tester.txt
	filecontent="abcdabcd abcdabcd abcdabcd"
	s1="ab"
	s2=" "
	
	echo $filecontent > $filename

	result=$(${MOD1_DIR}ex04/replace $filename $s1 $s2)
	expected="Whrong number of arguments"

	assert_eq "$result" "$expected" "not equivalent!"
	if [ "$?" == 0 ]; then
		log_success "sucess"
	fi
}

function test3(){
	echo -n "TEST03 "
	filename=""
	filecontent="abcdabcd abcdabcd abcdabcd"
	s1="ab"
	s2="ab"
	
	# echo $filecontent > $filename

	result=$(${MOD1_DIR}ex04/replace $filename $s1 $s2)
	expected="Whrong number of arguments"

	assert_eq "$result" "$expected" "not equivalent!"
	if [ "$?" == 0 ]; then
		log_success "sucess"
	fi
}

function test4(){
	echo -n "TEST04 "
	filename=tester.txt
	filecontent="abcdabcd abcdabcd abcdabcd"
	s1="X"
	s2="X"
	
	echo $filecontent > $filename
	${MOD1_DIR}ex04/replace $filename $s1 $s2

	result=$(cat ${filename}.replace)
	expected="abcdabcd abcdabcd abcdabcd"

	assert_eq "$result" "$expected" "not equivalent!"
	if [ "$?" == 0 ]; then
		log_success "sucess"
	fi
}

function test5(){
	echo -n "TEST05 "
	filename=invalid_filename
	filecontent="abcdabcd abcdabcd abcdabcd"
	s1="ab"
	s2="ab"
	
	# echo $filecontent > $filename

	result=$(${MOD1_DIR}ex04/replace $filename $s1 $s2)
	expected="Error opening file"

	assert_eq "$result" "$expected" "not equivalent!"
	if [ "$?" == 0 ]; then
		log_success "sucess"
	fi
}

function test6(){
	echo -n "TEST06 "
	filename=tester.txt
	filecontent="abcdabcd abcdabcd abcdabcd"
	s1="a"
	s2="X"
	
	echo $filecontent > $filename
	${MOD1_DIR}ex04/replace $filename $s1 $s2

	result=$(cat ${filename}.replace)
	expected=${filecontent//"$s1"/"$s2"}

	assert_eq "$result" "$expected" "not equivalent!"
	if [ "$?" == 0 ]; then
		log_success "sucess"
	fi
}

function test7(){
	echo -n "TEST07 "
	filename=tester.txt
	filecontent="abcdabcd abcdabcd abcdabcd    abcdabcd abcdabcd abcdabcd"
	s1='d a'
	s2='XXX'
	
	echo "$filecontent" > $filename
	${MOD1_DIR}ex04/replace "$filename" "$s1" "$s2"

	result=$(cat ${filename}.replace)
	expected=${filecontent//"$s1"/"$s2"}

	assert_eq "$result" "$expected" "not equivalent!"
	if [ "$?" == 0 ]; then
		log_success "sucess"
	fi
}

function test8(){
	echo -n "TEST08 "
	filename=tester.txt
	filecontent="abcdabcddbcabcbdacbadbcabdcbadbcbadcbabdcbadbcbadcbabcd"
	s1="babcd"
	s2="!   !"
	
	echo "$filecontent" > $filename
	${MOD1_DIR}ex04/replace "$filename" "$s1" "$s2"

	result=$(cat ${filename}.replace)
	expected=${filecontent//"$s1"/"$s2"}

	assert_eq "$result" "$expected" "not equivalent!"
	if [ "$?" == 0 ]; then
		log_success "sucess"
	fi
}

function test9(){
	echo -n "TEST09 "
	filename=tester.txt
	filecontent="abcdabcddbcabcbdacbadbcabdcbadbcbadcbabdcbadbcbadcbabcd"
	s1="babcd"
	s2="!       "
	
	echo "$filecontent" > $filename
	${MOD1_DIR}ex04/replace "$filename" "$s1" "$s2"

	result=$(cat ${filename}.replace)
	expected=${filecontent//"$s1"/"$s2"}

	assert_eq "$result" "$expected" "not equivalent!"
	if [ "$?" == 0 ]; then
		log_success "sucess"
	fi
}

function test10(){
	echo -n "TEST10 "
	filename=tester.txt
	filecontent="abcdabcddbcabcbdacbadbcabdcbadbcbadcbabdcbadbcbadcbabcd"
	s1="abcda"
	s2="     "
	
	echo "$filecontent" > $filename
	${MOD1_DIR}ex04/replace "$filename" "$s1" "$s2"

	result=$(cat ${filename}.replace)
	expected=${filecontent//"$s1"/"$s2"}

	assert_eq "$result" "$expected" "not equivalent!"
	if [ "$?" == 0 ]; then
		log_success "sucess"
	fi
	rm "$filename"
	rm "$filename.replace"
}

log_header "MODULE 01"
log_header "ex04"
make re -C ${MOD1_DIR}ex04 --no-print-directory
if [ $1 ]
then
	if [ $1 -le $NUM_TESTS ]
	then
		test_name="test$1"
		$test_name
	fi
else
	start=1
	while [ $start -le $NUM_TESTS ]
	do
		test_name="test$start"
		$test_name
		((start++))
	done
fi

make fclean -C ${MOD1_DIR}ex04 --no-print-directory

