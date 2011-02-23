package Test::Police::Dispatch;

use base qw(Test::Class);
use Test::More;

use Police::Dispatch::Officer;
use Police::Dispatch::CrewCall;
use Police::Dispatch::Crew;
use Police::Dispatch::Call;

# setup methods are run before every test method.
sub create_officer : Test( setup => 2 ) {
  my $self = shift;

  my $id;

  my $officer = Police::Dispatch::Officer->insert( { name => 'doug' } );
  isa_ok( $officer, 'Police::Dispatch::Officer' );
  ok( $officer->officerid, 'my new officer has an id: ' . $officer->officerid );

  # diag $officer->dump;

  $self->{'officer'} = $officer;
};

sub create_crew : Test( setup => 2 ) {
  my $self = shift;

  my $crew = Police::Dispatch::Crew->insert( { radio_number => '280' } );

  isa_ok( $crew, 'Police::Dispatch::Crew' );
  ok( $crew->crewid, 'my new crew has an ID' );

  # diag $crew->dump;

  $self->{'crew'} = $crew;

}

sub create_call : Test( setup => 1 ) {
  my $self = shift;

  my $call = Police::Dispatch::Call->insert( {} );

  isa_ok( $call, 'Police::Dispatch::Call' );
  # diag $call->dump;

  $self->{'call'} = $call;

}



# teardown methods are run after every test method.
sub teardown : Test( teardown => 3 ) {
  my $self = shift;
  
  foreach my $object ( qw( officer crew call ) ) {
    if ( $self->{ $object }->can( 'delete' ) ) {
      ok( $self->{ $object }->delete(), "deleted $object" );
    } else {
      pass( "$object already deleted" );
    }
  }
};

1;
