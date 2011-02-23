#!/usr/bin/env perl

use warnings;
use strict;

use lib qw( t/lib );

use Test::Police::Dispatch::Officer;

Test::Class->runtests;

