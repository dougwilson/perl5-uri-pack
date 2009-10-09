#!perl -T

use 5.008;
use strict;
use warnings 'all';

##############################################################################
# TEST MODULES
use Test::Most;

##############################################################################
# MODULES
use URI;

##############################################################################
# TEST PLAN
plan tests => 12;

{
	# Make a new URI object
	my $uri = new_ok('URI', ['pack://http:,,www.mysite.com,my.package/a/b/foo.xml'], 'URI::pack');

	ok($uri->has_package_uri, '... and it has a package');
	is($uri->package_uri, 'http://www.mysite.com/my.package', '... and package URI is correct');
	ok($uri->has_part_name, '... and it has a part name');
	is($uri->part_name, '/a/b/foo.xml', '... and part name is correct');
	is_deeply([$uri->part_name_segments], [qw(a b foo.xml)], '... and part name has three segments');

	# Making changes to part_name
	lives_ok {$uri->part_name('/apples/inv.xml')} '... and setting new part name works';
	is($uri->part_name, '/apples/inv.xml', '... and new part name is there');
	is_deeply([$uri->part_name_segments], [qw(apples inv.xml)], '... and new part name is in segments');

	# Makeing changes to part_name_segments
	lives_ok {$uri->part_name_segments(qw(trees have apples.txt))} '... and setting new part name segments works';
	is($uri->part_name, '/trees/have/apples.txt', '... and new part name is there');
	is_deeply([$uri->part_name_segments], [qw(trees have apples.txt)], '... and new part name is in segments');
}

exit 0;
