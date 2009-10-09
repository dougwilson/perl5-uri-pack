use inc::Module::Install;

name     'URI-pack';
all_from 'lib/URI/pack.pm';
author   'Douglas Christopher Wilson <doug@somethingdoug.com>';
license  'perl';

# Resources
resources homepage   => 'http://github.com/dougwilson/perl5-pack-uri/';
resources repository => 'git://github.com/dougwilson/perl5-pack-uri.git';

# Modules that are required
requires
	'URI'              => 0,
	'base'             => 0,
	'namespace::clean' => 0;

# Modules that are required for tests
test_requires
	'Test::More' => 0,
	'Test::Most' => 0;

# Modules that are required for author tests
author_requires
	'File::Spec'                      => 0,
	'Module::Install'                 => '0.91',
	'Module::Install::AuthorRequires' => '0.02',
	'Module::Install::AuthorTests'    => '0.002',
	'Pod::Coverage'                   => '0.18',
	'Test::CleanNamespaces'           => 0,
	'Test::ConsistentVersion'         => 0,
	'Test::DistManifest'              => 0,
	'Test::MinimumVersion'            => '0.009',
	'Test::Perl::Critic'              => 0,
	'Test::Pod'                       => '1.22',
	'Test::Pod::Content'              => 0,
	'Test::Pod::Coverage'             => '1.08',
	'Test::Requires'                  => '0.02';

# Enable tests to be in multi-level directories
tests_recursive;

# Author tests in xt/
recursive_author_tests('xt');

WriteAll;
