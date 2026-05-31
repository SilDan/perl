#!/usr/bin/env perl
use strict;
use warnings;

my $size    = 12;
my $modulo  = 21;
my $levels  = 250;
my @indexes = (2);
my $currentLevel = 0;

my @groundZero = (0) x $size;

for my $index (@indexes) {
    $groundZero[$index] = 1;
}

sub calculateNextLevel {
    my (@row) = @_;

    $currentLevel++;

    my $currentModulo = $currentLevel + 1;

    my @extended = (0, @row, 0);
    my @next;

    for my $i (0 .. $#extended - 1) {
        push @next, ($extended[$i] + $extended[$i + 1]) % $currentModulo;
    }

    return @next;
}

sub color_for_value {
    my ($value) = @_;

    my @colors = (
        "transparent", # 0
        "#000d1a",     # 1
        "#001426",     # 2
        "#001a33",     # 3
        "#00264d",     # 4
        "#003366",     # 5
        "#003f80",     # 6
        "#004f99",     # 7
        "#005fb3",     # 8
        "#006fcc",     # 9
        "#007fe6",     # 10
        "#008fff",     # 11
        "#199bff",     # 12
        "#30a6ff",     # 13
        "#47b1ff",     # 14
        "#5ebcff",     # 15
        "#75c7ff",     # 16
        "#8cd2ff",     # 17
        "#a3ddff",     # 18
        "#bae8ff",     # 19
        "#d0f0ff",     # 20
        "#e6f7ff",     # 21
    );

    return $colors[$value];
}

my @row = @groundZero;

open(my $txt,  '>', 'output.txt')  or die "Cannot write output.txt: $!\n";
open(my $html, '>', 'output.html') or die "Cannot write output.html: $!\n";

print $html "<!DOCTYPE html>\n";
print $html "<html>\n<head>\n<style>\n";
print $html "body { background: white; font-family: monospace; }\n";
print $html ".dot { display: inline-block; width: 4px; height: 4px; border-radius: 50%; margin: 0px; }\n";
print $html ".row { height: 4px; line-height: 4px; }\n";
print $html "</style>\n</head>\n<body>\n";

for my $level (0 .. $levels - 1) {
    print $txt " " x ($levels - $level);
    print $html "<div class='row' style='margin-left: " . (($levels - $level) * 2) . "px;'>";

    my @values = @row;

    for my $value (@values) {
        my $textValue = $value == 0 ? " " : $value;
        print $txt $textValue . " ";

        my $color = color_for_value($value);
        print $html "<span class='dot' style='background-color: $color;'></span>";
    }

    print $txt "\n";
    print $html "</div>\n";

    @row = calculateNextLevel(@row);
}

print $html "</body>\n</html>\n";

close $txt;
close $html;