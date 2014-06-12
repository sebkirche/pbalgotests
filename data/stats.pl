
use strict;
use warnings;
use feature 'say';


open(IN, "<liste_mots.txt") or die $!;
open(OUT, ">freq.txt") or die $!;

while(<IN>){
	if(/^(\p{L}+)\s(.+)$/){
		print OUT "$1\t$2\n";
	}
}

close IN;
close OUT;
