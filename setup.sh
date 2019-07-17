#!/bin/sh
#
# Create results files. Remove them if they exist.
# hmoats

MYHOME=/home/private/git/simple-10s-pool

for f in results_men2 results_men4 results_men8 results_men16 results_women2 results_women4 results_women8 results_women16
do
	rm -f $MYHOME/$f
	echo "Creating results file $f"
	touch $MYHOME/$f
done
