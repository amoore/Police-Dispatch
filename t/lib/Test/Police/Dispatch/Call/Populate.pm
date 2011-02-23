package Test::Police::Dispatch::Call::Populate;

use base qw(Test::Police::Dispatch::Call);
use Test::More;

sub populate_call : Test( 10 ) {
  my $self = shift;

  my $call = $self->{'call'};

  foreach my $count ( 1..2 ) {
    my $crew = Police::Dispatch::Crew->insert( { radio_number => $count } );
    isa_ok( $crew, 'Police::Dispatch::Crew');
    # $crew->call( $call );
    $crew->add_to_calls( { call => $call } );
    ok( $crew->update );
  }

  foreach ( $call->crews ) {
    isa_ok( $_, 'Police::Dispatch::Crew' );
    ok( $_->crewid, 'this crew has a crewid: ' . $_->crewid );
    ok( $_->radio_number, 'this crew has a radio_number ' . $_->radio_number );
  }

}


1;

