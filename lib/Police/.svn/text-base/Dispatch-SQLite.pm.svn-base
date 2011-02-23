package Police::Dispatch;

use warnings;
use strict;

use base qw(Class::DBI::SQLite);

use Data::Dumper;

__PACKAGE__->set_db( 'Main', 'dbi:SQLite:dbname=PoliceDispatch', '', '' );

=head1 NAME

Police::Dispatch - Keep track of the movements and behavior of public safety officers.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Keep track of the movements and behavior of public safety officers.

=head1 Methods

=head2 new

=cut

sub new {
  my $class = shift;
  my $args  = @_;

}

=head2 _init {
  my $self = shift;


  __PACKAGE__->set_db( $self->_config->{_}->{'database'}, 'dbi:SQLite:dbname=dbfile', '', '' );

  # __PACKAGE__->set_up_table('Movies');



}

=head2 _config

=cut

sub _config {
  my $self = shift;
  my %args = @_;
  
  return Config::Tiny->read( 'policedispatchrc' );

}

=head2 dump

  return a string that describes the object.

  takes no arguments.

  Notes: Could take a name of the object that is being dumped.  

=cut

sub dump {
    my $self = shift;
    
    my %params = map{ $_ => $self->$_ || '<undef>' } $self->columns();
    return Data::Dumper->Dump( [ \%params ], [ ref( $self ) ] );

}



=head1 AUTHOR

Andrew Moore, C<< <amoore at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-police-dispatch at rt.cpan.org>, or through the web interface at
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

1; # End of Police::Dispatch
