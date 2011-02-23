package Test::Police::Dispatch::Call;

use base qw(Test::Police::Dispatch);
use Test::More;

sub check_name : Test( 1 ) {
    my $self = shift;

    isa_ok( $self->{'call'}, 'Police::Dispatch::Call' );
    # diag $self->{'officer'}->dump;

}


1;
