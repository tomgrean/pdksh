#!/bin/sh

#
# Script to generate a sorted, complete list of signals, suitable
# for inclusion in trap.c as array initializer.
#

set -e

in=tmpi$$.c
out=tmpo$$.c
ecode=1
trapsigs='0 1 2 13 15'
trap 'rm -f $in $out siglist; trap 0; exit $ecode' $trapsigs

CC="${1-cc}"

# The trap here to make up for a bug in bash (1.14.3(1)) that calls the trap
(trap - $trapsigs;
 echo '	{ SIGNALS , "DUMMY" , "hook for number of signals" },';
 echo 
 sed -e '/^[	 ]*#/d' -e 's/^[	 ]*\([^ 	][^ 	]*\)[	 ][	 ]*\(.*[^ 	]\)[ 	]*$/#ifdef SIG\1\
	{ SIG\1 , "\1", "\2" },\
#endif/') > $in
$CC -DSIGNALIN="\"$in\"" siglist.c -o siglist
./siglist
ecode=0
