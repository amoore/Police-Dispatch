#!/usr/bin/env perl

use warnings;
use strict;

package Test::Police::Dispatch::Crew::FindOrCreate;
use base qw(Test::Police::Dispatch::Crew);
use Test::More;

=head2

  I should be able to make one call to P::D::Crew to fetch a crew from
  the database if they exist, otherwise insert them.

=cut

sub find_existing_crew : Test( 3 ) {
  my $self = shift;

  # find_or_create the same crew in $self
  ok( $self->{'crew'}->radio_number, 'we have a radio number to work with' );
  my $crew = Police::Dispatch::Crew->find_or_create( { radio_number => $self->{'crew'}->radio_number } );
  isa_ok( $crew, 'Police::Dispatch::Crew' );
  is( $crew->crewid, $self->{'crew'}->crewid, 'we fetched the same crew as we were looking for' );

}

sub create_new_crew : Test( 6 ) {
  my $self = shift;

  # delete the crew in $self, then find_or_crate it and make sure we have a new one.

  my $oldcrewid = $self->{'crew'}->crewid;
  ok( $oldcrewid, 'we have a crewid to work with' );
  my $oldradionumber = $self->{'crew'}->radio_number;
  ok( $oldradionumber, 'we have a radio number to work with' );
  $self->{'crew'}->delete;


  my $crew = Police::Dispatch::Crew->find_or_create( { radio_number => $oldradionumber } );
  isa_ok( $crew, 'Police::Dispatch::Crew' );
  isnt( $crew->crewid, $oldcrewid, 'the crew that we found has a new crewid' );
  is( $crew->radio_number, $oldradionumber, '  ... but the same radio_number' );

  # we need to delete this new crew to not fool other test cases
  ok( $crew->delete(), 'deleted my temporary test crew' );

}


1;
