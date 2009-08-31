#!perl -T

use 5.008;
use strict;
use warnings 'all';

##############################################################################
# TEST MODULES
use Test::More;

##############################################################################
# MODULES
use URI;

##############################################################################
# TEST PLAN
plan tests => 1;

isa_ok(URI->new('pack://http:,,www.mysite.com,my.package/a/b/foo.xml'),
	'URI::pack');

exit 0;
