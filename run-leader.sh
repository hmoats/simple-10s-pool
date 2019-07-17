#!/bin/bash
#
# Run simple-10s-pool leader board
# hmoats

MYHOME=/home/private/git/simple-10s-pool
INPUT=$MYHOME/input.csv

# Read in input.csv and then loop through each player's picks and calculate 
# their totals. 
while read -r l
do
	M16Total=0
	M8Total=0
	M4Total=0
	M2Total=0
	W16Total=0
	W8Total=0
	W4Total=0
	W2Total=0

	Player=$(echo $l | awk -F'_' '{print $2}')
	MR16=$(echo $l | awk -F'_' '{print $3}' | sed 's/, /,/g')
	MR8=$(echo $l | awk -F'_' '{print $4}' | sed 's/, /,/g')
	MR4=$(echo $l | awk -F'_' '{print $5}' | sed 's/, /,/g')
	MR2=$(echo $l | awk -F'_' '{print $6}' | sed 's/, /,/g')
	WR16=$(echo $l | awk -F'_' '{print $7}' | sed 's/, /,/g')
	WR8=$(echo $l | awk -F'_' '{print $8}' | sed 's/, /,/g')
	WR4=$(echo $l | awk -F'_' '{print $9}' | sed 's/, /,/g')
	WR2=$(echo $l | awk -F'_' '{print $10}' | sed 's/, /,/g')


	echo "#################################################"
	echo "Player's Winners: $Player"
	echo " "
	echo "Men's round of 16 winners"
	while read -r w
	do
		if echo $MR16 | grep --quiet "$w"; then
			((++M16Total))
			echo " - $w +1"
		else
			#echo " - $w Exit"
			false 
		fi
	done < <(cat $MYHOME/results_men16)
	echo " - Round of 16 total: $M16Total"

	echo "Men's quarter finals winners"
        while read -r w
        do
                if echo $MR8 | grep --quiet "$w"; then
			M8Total=$(($M8Total + 2))
			echo " - $w +2"
                else
			#echo " - $w Exit"
			false
                fi
        done < <(cat $MYHOME/results_men8)
	echo " - Quarter finals total: $M8Total"

	echo "Men's semi finals winners"
        while read -r w
        do
                if echo $MR4 | grep --quiet "$w"; then
			M4Total=$(($M4Total + 4))
			echo " - $w +4"
                else
			#echo " - $w Exit"
			false
                fi
        done < <(cat $MYHOME/results_men4)
	echo " - Semi finals total: $M4Total"

	echo "Men's finals winner"
        while read -r w
        do
                if echo $MR2 | grep --quiet "$w"; then
			M2Total=$(($M2Total + 8))
			echo " - $w +8"
                else
			#echo " - $w Exit"
			false
                fi
        done < <(cat $MYHOME/results_men2)
	echo " - Final total: $M2Total"

	MTotal=$(( $M16Total + $M8Total + $M4Total + $M2Total))
	echo "[Grand total men's draw: $MTotal]"

	echo " "
	echo "Women's round of 16 winners"
	while read -r w
        do
                if echo $WR16 | grep --quiet "$w"; then
                        ((++W16Total))
			echo " - $w +1"
                else
			#echo " - $w Exit"
			false
                fi
        done < <(cat $MYHOME/results_women16)
	echo " - Round of 16 total: $W16Total"


	echo "Women's quarter finals winners"
        while read -r w
        do
                if echo $WR8 | grep --quiet "$w"; then
			W8Total=$(($W8Total + 2))
			echo " - $w +2"
                else
			#echo " - $w Exit"
			false
                fi
        done < <(cat $MYHOME/results_women8)
	echo " - Quarter finals total: $W8Total"

	echo "Women's semi finals winners"
        while read -r w
        do
                if echo $WR4 | grep --quiet "$w"; then
			W4Total=$(($W4Total + 4))
			echo " - $w +4"
                else
			#echo " - $w Exit"
			false
                fi
        done < <(cat $MYHOME/results_women4)
	echo " - Semi finals total: $W4Total"

	echo "Women's finals winner"
        while read -r w
        do
                if echo $WR2 | grep --quiet "$w"; then
			W2Total=$(($W2Total + 8))
			echo " - $w +8"
                else
			#echo " - $w Exit"
			false
                fi
        done < <(cat $MYHOME/results_women2)
	echo " - Final total: $W2Total"

        WTotal=$(( $W16Total + $W8Total + $W4Total + $W2Total))
	echo "[Grand total women's draw: $WTotal]"

	OUT+="*Player: $Player*
"
	OUT+=" > Men's total: $MTotal
"
	OUT+=" > Women's total: $WTotal
"

done < <(grep -v "Player" $INPUT | sed 's/\t/_/g')

echo " "
echo "Totals for $(date +%D)"
echo "_________________________________________________"
echo "$OUT"
