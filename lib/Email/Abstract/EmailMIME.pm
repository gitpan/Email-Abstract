package Email::Abstract::EmailMIME;
use strict;
use base 'Email::Abstract::EmailSimple';

sub construct {
    require Email::MIME;
    my ($class, $rfc822) = @_;
    Email::MIME->new($rfc822);
}

1;

=head1 NAME

Email::Abstract::EmailMIME - Email::Abstract wrapper for Email::MIME

=head1 DESCRIPTION

This module wraps the Email::MIME mail handling library with an
abstract interface, to be used with L<Email::Abstract>

=head1 SEE ALSO

L<Email::Abstract>, L<Email::MIME>.

=cut

