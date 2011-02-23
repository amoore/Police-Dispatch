package Police::Dispatch::Gui::CallPanel;

use warnings;
use strict;

use base qw( Wx::Panel );

use Wx;
use Wx::Event qw(EVT_BUTTON);

use Data::Dumper;
use IO::Prompt;

use Police::Dispatch::Call;
use Police::Dispatch::Crew;
use Police::Dispatch::Officer;

=head1 NAME

Police::Dispatch::Gui -

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Keep track of the movements and behavior of public safety officers.

=head1 Methods

=head2 new

  parameters: the frame.

=cut

sub new {
    my $class = shift;

    if ( ref $class ) {
        # someone called ->new on an object, not a class name.
        die( q(don't call 'new' on an object) );
    }

    my $frame = shift;
    
    
    my $self = $class->SUPER::new( $frame,
                                   '-1',
                                   [ 100, 0   ],
                                   [ 300, 300 ],
                              );
    $self->add_static_box();
    # $self->add_button();
    $self->show_calls();
    
    return $self;
}

sub add_static_box {
    my $self = shift;

    my $box = Wx::StaticBox->new( $self,
                                  -1,
                                  'Current Calls',
                                  [ 5 ,   0   ],  
                                  [ 200 , 400 ],

                             );
    
}

sub add_button {
    my $self = shift;

    # create a button
    my $button = Wx::Button->new( $self,          # parent panel
                                  -1,             # ID
                                  'Calls',        # label
                                  [ 15,   15 ],  
                                  [ 50,   -1 ],
                             );    

    # EVT_BUTTON( $self, $button, \&OnClick );
}

sub OnClick {
    my ( $self, $event ) = @_;

    warn Data::Dumper->Dump( [ $self, $event ], [ qw( self event ) ] );
    
    # $self->SetTitle( 'Clicked' );
}

sub show_calls {
    my $self = shift;

    my $high = -10;
    
    my @calls = Police::Dispatch::Call->active_calls();
    foreach my $call ( @calls ) {
        
        my $text = Wx::TextCtrl->new( $self,
                                      -1,
                                      $call->type,
                                      [ 10,  $high + 30 ],
                                      [ 150, -1 ],
                                 );
    
        my $button = Wx::Button->new( $self,          # parent panel
                                      -1,             # ID
                                      '+',            # label
                                      [ 165,  $high += 30 ],  
                                      [ 20,   -1 ],
                                 );    

    }

    my $button = Wx::Button->new( $self,          # parent panel
                                  -1,             # ID
                                  'New Call',     # label
                                  [ 10,  $high += 30 ],  
                                  [ -1,   -1 ],
                             );    

    

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
