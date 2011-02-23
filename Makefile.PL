use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Police::Dispatch',
    AUTHOR              => 'Andrew Moore <amoore@cpan.org>',
    VERSION_FROM        => 'lib/Police/Dispatch.pm',
    ABSTRACT_FROM       => 'lib/Police/Dispatch.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Police-Dispatch-*' },
);
