package Test::Police::Dispatch::Call::GetActive;

use base qw(Test::Police::Dispatch::Call);
use Test::More;

sub get_active_calls : Test( 3 ) {
  my $self = shift;
  
  my $call = $self->{'call'};
  
  {
    my @calls = Police::Dispatch::Call->active_calls();

    my $maybehere = List::Util::first { "$call" eq "$_" } @calls; 
    ok( $maybehere, 'found my call in the list of active calls' );
  }
    
  ok( $call->clear(), 'cleared this call' );

  {
    my @calls = Police::Dispatch::Call->active_calls();
    
    my $maybehere = List::Util::first { "$call" eq "$_" } @calls; 
    ok( ! $maybehere, 'my call is not in in the list of actives.' );
  }
    
}


1;

