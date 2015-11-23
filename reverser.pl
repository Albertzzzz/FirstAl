#!/usr/bin/perl -w

# author, date, revision, etc.



# This program will process user input with two functions.

# Command-line arguments will be treated as input file sources.

# No flags are allowed.



# modules used: none

# pragmas used: strict

use strict;



# function A: return a parameter with the letters reversed

# accepts only one scalar argument by prototype

sub A($)

{

  my $word = shift @_; # get the parameter



    # split the word into a list of letters with the split function, then

    # reverse the list with the reverse function, then

    # join the list letters into a scalar word, and return that word

    return join '', reverse split //, $word;

}



# function B: return true if a word is in the /etc/hosts file

# accepts only one scalar argument by prototype

sub B($)

{

  my $word = shift @_; # get the parameter

    my $hosts;

    # open the /etc/hosts file, or fail with message

    open HOSTS, '/etc/hosts' or die "Couldn't open /etc/hosts";

  # read the entire contents of the file into the $hosts variable

  read HOSTS, $hosts, -s HOSTS;  

    close HOSTS;

  # return whether the $hosts variable contains the parameter word anywhere

  # note that this will accept words like "om" for yahoo.com - word bounds

  # are not used

  return ($hosts =~ m/$word/);

}



# main loop: go through input lines, passing each word to B

# and, if B returns false, to A



my $word;# will hold each word found



while (<>)

{

  chomp;# eliminate trailing newlines

    foreach $word (split)# split the line into words

  {

      if (B($word))# if the word satisfies B

      {

        print "=B= word found: $word\n";# print out the plain word

    }

      else# the word is not ok for B

      {

        # print out the word, followed by its A() interpretation

        print "=A= word found: A($word) = ", A($word), "\n";

    }

    }

}



__END__

=head1 NAME



=head1 SYNOPSIS



=head1 DESCRIPTION



=head1 Author



=head1 Last Revision



=cut

