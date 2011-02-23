package Police::Dispatch::Console;

use warnings;
use strict;

use Data::Dumper;
use IO::Prompt;

use Police::Dispatch::Call;
use Police::Dispatch::Crew;
use Police::Dispatch::Officer;

=head1 NAME

Police::Dispatch::Console - Console based Police dispatch tracker.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Keep track of the movements and behavior of public safety officers.

=head1 Methods

=head2 run

  maybe this should be called main

=cut

sub run {
  my $self = shift;
  
  while( 1 ) {
    my $selection = call_menu();
    # I should give the option to see the car menu here. add info or officers.
    print "You said '$selection'\n";
    if ( 'n' eq $selection ) {
      make_new_call();
    } elsif ( Scalar::Util::looks_like_number( "$selection" ) ) {
      edit_call( callid => "$selection" );
    } else {
      warn "I don't know how to deal with $selection.";
    }
  }
  
}

# if we're called as a script, let's run the 'run' method.
run unless caller;

=head2 call_menu

=cut

sub call_menu {

  my @calls = Police::Dispatch::Call->active_calls();
  my %menu = map { sprintf( "%-20s at: %-20s", $_->type, $_->address ) => $_->callid } @calls;
  $menu{'new call'} = 'n';

  prompt( '-menu', \%menu );


}

=head2 make_new_call

=cut

sub make_new_call {
  
  my $call = Police::Dispatch::Call->insert( {} );

  prompt "location: ";
  $call->address( $_ );

  prompt "type: ";
  $call->type( $_ );

  $call->update() or die 'unable to update';
  $call->dbi_commit();


}

=head2 edit_call

=cut

sub edit_call {
  my %args = @_;

  return unless exists $args{'callid'};

  my $call = Police::Dispatch::Call->retrieve( $args{'callid'} );
  print $call->dump;
  
  my %editfields = map { sprintf( '%-20s %20s', $_, $call->$_ || '' ) => "$_" } 
    $call->columns();
  my $selection = prompt( '-menu', {                         
				    clear => 'clear',
				    edit  => \%editfields,
				   }
			);

  # print "You said '$selection'\n";
  if ( "$selection" eq 'clear' ) {
    $call->clear();
  } elsif ( "$selection" ne '' ) {
    my $newcolumnvalue = prompt( "edit $selection: " );
    $call->$selection( "$newcolumnvalue" );
    $call->update();
  }

  $call->dbi_commit();
  print $call->dump;

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
