#!/usr/bin/env perl

use 5.012;
use warnings;
use File::Basename;

my $dirp = dirname(__FILE__);
foreach(sort(my @filenames = qx|ls ${dirp}/*.hs|)) {
    my $charCount = 0;
    chomp; say $_; open(my $fh, $_) or die; while(<$fh>) {
        next unless /\-\}/../^\s+$/; chomp; s/\s+//g;
        next if (/\-\}/ or /^$/);
        next if (/::/);
        next if (/=\s*$/);
        $charCount += length $_;
    }
    say $charCount;
}
