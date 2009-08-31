package URI::pack;

use 5.008001;
use strict;
use warnings 'all';

###############################################################################
# METADATA
our $AUTHORITY = 'cpan:DOUGDUDE';
our $VERSION   = '0.001';

###############################################################################
# MODULES
use URI;
use URI::Escape qw(uri_escape uri_unescape);

###############################################################################
# INHERIT FROM PARENT CLASS
use base qw(URI::_generic);

###############################################################################
# ALL IMPORTS BEFORE THIS WILL BE ERASED
use namespace::clean;

###############################################################################
# METHODS
sub package_uri {
	my ($self, $new_package) = @_;

	# Get the package according to ECMA-376, Part 2, section B.2
	# Call the normal authority and get the result
	my $authority = $self->authority;

	# Replace all commas with forward slashes
	$authority =~ s{,}{/}gmsx;

	# Unescape the authority
	$authority = uri_unescape($authority);

	if (defined $new_package) {
		# Set a new authority according to ECMA-376, Part 2, section B.3
		# Make sure the new package is a URI
		$new_package = URI->new($new_package);

		# Remove the fragment
		$new_package->fragment(q{});

		# Escape all %, ?, @, :, and , characters
		## no critic (ValuesAndExpressions::RequireInterpolationOfMetachars)
		$new_package = uri_escape($new_package, '%?@:,');

		# Replace all forward slashes with commas
		$new_package =~ s{/}{,}gmsx;

		# Set the resulting string as the authority
		$self->authority($new_package);
	}

	# Return the authority as an URI object
	return URI->new($authority);
}

###############################################################################
# PRIVATE METHODS
sub _no_scheme_ok { return 0; }

1;

__END__

=head1 NAME

URI::pack - Support of the pack scheme in URI.

=head1 VERSION

This documnetation refers to L<URI::pack> version 0.001

=head1 SYNOPSIS

  use URI;

  # New absolute pack URI
  my $pack_uri = URI->new('pack://application,,,/ResourceFile.xaml');

  # New relative pack URI
  my $rel_pack_uri = URI->new('/images/logo.png', 'pack');

=head1 DESCRIPTION

Currently the main module, L<URI::pack> has not been completed and there is
no documentation.

=head1 ATTRIBUTES

This object provides multiple attributes. Calling the attribute as a method
with no arguments will return the value of the attribute. Calling the attribute
with one argument will set the value of the attribute to be that value and
returns the old value.

  # Get the value of an attribute
  my $package = $uri->package_uri;

  # Set the value of an attribute
  my $old_package = $uri->package_uri($package);

=head2 package_uri

This is the L<URI> of the package.

=head1 METHODS

=head1 DEPENDENCIES

=over

=item * L<URI>

=item * L<URI::Escape>

=item * L<namespace::clean>

=back

=head1 AUTHOR

Douglas Christopher Wilson, C<< <doug at somethingdoug.com> >>

=head1 BUGS AND LIMITATIONS

Please report any bugs or feature requests to C<bug-uri-pack at rt.cpan.org>,
or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=URI-pack>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

I highly encourage the submission of bugs and enhancements to my modules.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

  perldoc URI::pack

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=URI-pack>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/URI-pack>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/URI-pack>

=item * Search CPAN

L<http://search.cpan.org/dist/URI-pack/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2009 Douglas Christopher Wilson.

This program is free software; you can redistribute it and/or
modify it under the terms of either:

=over 4

=item * the GNU General Public License as published by the Free
Software Foundation; either version 1, or (at your option) any
later version, or

=item * the Artistic License version 2.0.

=back
