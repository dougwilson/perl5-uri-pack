#!perl -T

use Test::More tests => 1;

use_ok 'URI::pack';

diag(sprintf 'Testing URI::pack %s, Perl %s, %s', $URI::pack::VERSION, $], $^X);
