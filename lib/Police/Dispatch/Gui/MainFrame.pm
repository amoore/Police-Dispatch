package Police::Dispatch::Gui::MainFrame;

use warnings;
use strict;

use base qw( Wx::Frame );
use Wx;

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

=cut

sub new {
    my $class = shift;

    if ( ref $class ) {
        die "please don't call this on objects. It's a class method";
    }

    my $self = $class->SUPER::new( undef,           # parent window
                                   -1,              # ID -1 means any
                                   @_, );
    $self->init;
    return $self;
    
}

sub init {
    my $self = shift;
    
    $self->add_menu_bar();

    my $unitpanel  = Police::Dispatch::Gui::UnitPanel->new( $self );
    my $callspanel = Police::Dispatch::Gui::CallPanel->new( $self );
}

sub add_menu_bar {
    my $self = shift;

    my $menubar = Wx::MenuBar->new();

    # add a menu to the bar
    my $somemenu = Wx::Menu->new();
    $somemenu->AppendSeparator();
    $menubar->Append ($somemenu, '&Foo');

    $self->SetMenuBar ($menubar);
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
