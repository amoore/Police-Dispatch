package Police::Dispatch::Call;

use warnings;
use strict;

# use Police::Dispatch::CrewCall;
use base qw( Police::Dispatch );

__PACKAGE__->set_up_table( 'call' );
__PACKAGE__->has_many( crews => ['Police::Dispatch::CrewCall' => 'crew'] );

=head1 NAME

Police::Dispatch::Call - Maintain information about a call that
Police::Dispatch::Officers are called to.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

=head1 METHODS

=head2 active_calls

  This is a class method. Does that matter?

=cut

sub active_calls {
  my $class = shift;

  my @activecalls = $class->search( cleared => undef, { order_by => 'created' } );
  return @activecalls;
}

=head2 clear

  clear a call.

=cut

sub clear {
  my $self = shift;

  # I should clear the associated officers.

  $self->cleared( 'now' ) or die 'unable to clear';
  $self->update()         or die 'unable to update';

}


=head1 AUTHOR

Andrew Moore, C<< <amoore at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-police-dispatch-call at rt.cpan.org>, or through the web interface at
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

1; # End of Police::Dispatch::Call
