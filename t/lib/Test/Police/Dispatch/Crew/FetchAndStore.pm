package Test::Police::Dispatch::Crew::FetchAndStore;

use base qw(Test::Police::Dispatch::Crew);
use Test::More;

sub check_number : Test( 2 ) {
  my $self = shift;
  
  isa_ok( $self->{'crew'}, 'Police::Dispatch::Crew' );
  ok( $self->{'crew'}->radio_number, 'found a radio_number' );
  
}

sub populate_crew : Test( 10 ) {
  my $self = shift;
  
  my $crew = $self->{'crew'};
  
  foreach my $count ( 1..2 ) {
    my $officer = Police::Dispatch::Officer->insert( { serial_number => $count } );
    isa_ok( $officer, 'Police::Dispatch::Officer');
    $officer->crew( $crew );
    ok( $officer->update );
  }
  
  foreach ( $crew->officers ) {
    isa_ok( $_, 'Police::Dispatch::Officer' );
    ok( $_->officerid, 'this officer has an officerid: ' . $_->officerid );
    ok( $_->serial_number, 'this officer has a serial_number ' . $_->serial_number );
  }
  
}

1;
