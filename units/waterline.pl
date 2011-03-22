#!/usr/bin/perl

while(<>) {
  s/waterlines*=s*(d+)s*;/"waterline=".($1+10).";"/e;
  print $_;
}

