package Email::Abstract::MIMEEntity;
use strict;
use base 'Email::Abstract::MailInternet';
sub target { "MIME::Entity" }

sub construct {
    require MIME::Parser;
    my $parser = new MIME::Parser;
    $parser->output_to_core(1);
    my ($class, $rfc822) = @_;
    $parser->parse_data($rfc822);
}

sub get_body { pop->bodyhandle->as_string }

sub set_body {
    my ($class, $obj, $body) = @_;
    my @lines = split /\n/, $body;
    my $io = $obj->bodyhandle->open("w");
    foreach (@lines) { $io->print($_."\n") }
    $io->close;
}

1;

=head1 NAME

Email::Abstract::MIMEEntity - Email::Abstract wrapper for MIME::Entity

=head1 DESCRIPTION

This module wraps the MIME::Entity mail handling library with an
abstract interface, to be used with L<Email::Abstract>

=head1 SEE ALSO

L<Email::Abstract>, L<MIME::Entity>.

=cut

