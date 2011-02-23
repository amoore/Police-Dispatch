package Test::Police::Dispatch::Call::Clear;

use base qw(Test::Police::Dispatch::Call);
use Test::More;

sub clear_a_call : Test( 4 ) {
  my $self = shift;

  my $call = $self->{'call'};

  ok( ! defined $call->cleared, 'this call has not yet cleared' );
  ok( ! $call->cleared,         'this call has not yet cleared' );
  $call->clear();
  ok( defined $call->cleared, 'this call has been cleared' );
  ok( $call->cleared,         'this call has been cleared' );

}


1;

