#!/bin/bash
#
# Run the picks for each player
# hmoats

MYHOME=/home/private/git/simple-10s-pool
INPUT=$MYHOME/input.csv

# Read in input.csv and then loop over each line and parse player's picks
grep -v "Player" $INPUT | sed 's/\t/_/g' | while read l
do
	Player=$(echo $l | awk -F'_' '{print $2}')
	MR16=$(echo $l | awk -F'_' '{print $3}' | sed 's/, /,/g')
	MR8=$(echo $l | awk -F'_' '{print $4}' | sed 's/, /,/g')
	MR4=$(echo $l | awk -F'_' '{print $5}' | sed 's/, /,/g')
	MR2=$(echo $l | awk -F'_' '{print $6}' | sed 's/, /,/g')
	WR16=$(echo $l | awk -F'_' '{print $7}' | sed 's/, /,/g')
	WR8=$(echo $l | awk -F'_' '{print $8}' | sed 's/, /,/g')
	WR4=$(echo $l | awk -F'_' '{print $9}' | sed 's/, /,/g')
	WR2=$(echo $l | awk -F'_' '{print $10}' | sed 's/, /,/g')

	SaveIFS=$IFS
	IFS=$','
	echo "================================================="
	echo "$Player"
	echo " "
	echo "[Men's Draw]"
	echo " - Men's round 16"
	for r in $MR16
	do
		printf "%-20s\n" "  - $r"
	done
	echo " - Men's Quarters"
	for r in $MR8
	do
		printf "%-20s\n" "  - $r"
	done
	echo " - Men's Semis"
	for r in $MR4
	do
		printf "%-20s\n" "  - $r"
	done
	echo " - Men's Finals"
	for r in $MR2
	do
		printf "%-20s\n" "  - $r"
	done
	echo "[Women's Draw]"
        echo " - Women's round 16"
        for r in $WR16
        do
                printf "%-20s\n" "  - $r"
        done
        echo " - Women's Quarters"
        for r in $WR8
        do
                printf "%-20s\n" "  - $r"
        done
        echo " - Women's Semis"
        for r in $WR4
        do
                printf "%-20s\n" "  - $r"
        done
        echo " - Women's Finals"
        for r in $WR2
        do
                printf "%-20s\n" "  - $r"
        done

	IFS=$SaveIFS
done
