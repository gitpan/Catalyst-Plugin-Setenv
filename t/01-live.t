#!/usr/bin/perl
# 01-live.t 
# Copyright (c) 2006 Jonathan Rockway <jrockway@cpan.org>

use Test::More tests => 2;
use FindBin qw($Bin);
use lib "$Bin";
use Catalyst::Test qw(TestApp);

is($ENV{FOO}, 'foo');
is($ENV{BAR}, 'bar');


