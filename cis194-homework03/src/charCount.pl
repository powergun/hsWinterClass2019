#!/usr/bin/env perl

use 5.012;
use warnings;

foreach(sort(my @filenames = qx/ls *.hs/)) {
    my $charCount = 0;
    chomp; say $_; open(my $fh, $_) or die; while(<$fh>) {
        next unless /\-\}/../^\s+$/; chomp; s/\s+//g;
        $charCount += length unless (/\-\}/ or /^$/);
    }
    say $charCount;
}
