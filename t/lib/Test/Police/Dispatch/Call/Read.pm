package Test::Police::Dispatch::Call::Read;

use base qw(Test::Police::Dispatch::Call);
use Test::More;

sub read_call_id : Test( 2 ) {
  my $self = shift;
  
  isa_ok( $self->{'call'}, 'Police::Dispatch::Call' );
  ok( $self->{'call'}->callid, 'found a callid' );

}


1;

