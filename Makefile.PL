use 5.006;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Email::Abstract',
    VERSION_FROM      => 'lib/Email/Abstract.pm', # finds $VERSION
    PREREQ_PM         => {
        Module::Pluggable => 0,
        Email::Simple => 0
    }, # e.g., Module::Name => 1.1
);
