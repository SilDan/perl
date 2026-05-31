#!/usr/bin/env perl
use strict;
use warnings;

my $limit = 100;

# Loop over the first 100 integers
for my $i (1..$limit) {
    print "The value of 'i' is " . $i . "\n";
    print "it has remainder " . _dividedBy_hasRemainder($i,3) . " when divided by " . 3 . "\n"; 
}


sayHello();

# in perl, functions are called subroutines
sub sayHello {
    print "hello!\n";
}

# they can have parameters
sub sayHelloTo {
    my ($name) = @_;
    print "hello $name!\n";
}

sayHelloTo("Strawberry");

sub addNumbers{
    my ($a,$b) = @_;
    print $a . "+" . $b . " = " . ($a+$b) . "\n";
}

addNumbers(2,3);

sub _dividedBy_hasRemainder {
    my ($number, $divisor) = @_;
    return $number % $divisor;
}

sub _isDivisibleBy_ {
    my ($number, $divisor) = @_;
    _dividedBy_hasRemainder($number, $divisor) == 0;
}
