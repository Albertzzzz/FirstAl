#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

my ($file_name) = @ARGV;
open FILE, "< $file_name";

while(<FILE>){
	chomp;
	next if ($_ =~ /^#|^;/);
	if ($_ =~ /\d\d\d?\.actions=(.*)/){
#if ($_ =~ /\d\d\d?\.title = (.*)/){
		print "$1\n";
	}
}
