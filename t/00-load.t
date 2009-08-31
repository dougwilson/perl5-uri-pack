#!perl -T

use 5.008;
use strict;
use warnings 'all';

##############################################################################
# TEST MODULES
use Test::More;;

##############################################################################
# TEST PLAN
plan tests => 1;

##############################################################################
# USE TESTS
use_ok 'URI::pack';

##############################################################################
# PRINT BASIC MESSAGE
diag(sprintf 'Testing URI::pack %s, Perl %s, %s', $URI::pack::VERSION, $], $^X);

exit 0;
