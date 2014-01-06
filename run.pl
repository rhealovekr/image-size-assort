#!/usr/bin/perl
use strict;
use warnings;
use Image::Size 'attr_imgsize';
use File::Copy qw(copy);

if (@ARGV != 2) {
  print "Enter the 2 parameters (width height)\n";
  exit();
}

my $over_width = $ARGV[0];
my $over_height = $ARGV[1];

#my $filepath = "3556133294_aedb7bb8_IMG_3295.jpg";


opendir DH, "." or die "Can't open the current directory: $!";

while ($_ = readdir(DH)) {
  next if $_ eq "." or $_ eq "..";
  if (-f) {
    my @attrs = attr_imgsize($_);
    if ($#attrs > 0) {
      my $width = $attrs[1];
      my $height = $attrs[3];

      if ($over_width < $width ||
          $over_height < $height) {
        # copy file
        mkdir "out", 0755 || die "Can't create directory";
        copy $_, "out\\$_";
      }
    }
  }
}
