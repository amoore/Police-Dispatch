package Police::Dispatch::CrewCall;

use warnings;
use strict;

use base qw( Police::Dispatch );

__PACKAGE__->set_up_table( 'crewcall' );
__PACKAGE__->has_a( crew => 'Police::Dispatch::Crew' );
__PACKAGE__->has_a( call => 'Police::Dispatch::Call' );

=head1 NAME

Police::Dispatch::CrewCall - tracking object for relationship between
Crews and Calls.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

=head1 METHODS

=head1 AUTHOR

Andrew Moore, C<< <amoore at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-police-dispatch-crew at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Police-Dispatch>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Police::Dispatch

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Police-Dispatch>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Police-Dispatch>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Police-Dispatch>

=item * Search CPAN

L<http://search.cpan.org/dist/Police-Dispatch>

=back

=head1 ACKNOWLEDGEMENTS

=head1 COPYRIGHT & LICENSE

Copyright 2007 Andrew Moore, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Police::Dispatch::CrewCall
