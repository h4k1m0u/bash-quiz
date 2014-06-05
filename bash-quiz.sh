#!/bin/bash

# constants
quiz_file=quiz.txt
score=0

# check if quiz file exists
if [ ! -f $quiz_file ]
then
    echo "Quiz file doesnt exist!"
    exit 1
fi

# game loop (loop over quiz file line/line)
while read -u9 line
do
    # parsing quiz file for current question
    question=`echo $line | cut -f1 -d' '`
    choice1=`echo $line | cut -f2 -d' '`
    choice2=`echo $line | cut -f3 -d' '`
    choice3=`echo $line | cut -f4 -d' '`
    solution=`echo $line | cut -f5 -d' '`

    # print question & choices
    echo "$question?"
    echo "- $choice1"
    echo "- $choice2"
    echo "- $choice3"

    # read player choice
    read -p "- Your response: " player_choice

    # compare player against solution & increment score
    if [ "$player_choice" == "$solution" ]
    then
        score=$(( ++score ))
        echo "correct answer"
    else
        echo "wrong answer. correct answer is $solution"
    fi

    echo
done 9< $quiz_file

# print score
echo "Your score is $score/`wc -l $quiz_file`"
