package Email::Abstract::MailMessage;
use strict;

sub construct {
    require Mail::Message;
    my ($class, $rfc822) = @_;
    Mail::Message->read($rfc822);
}
sub get_header { 
    my ($class, $obj, $header) = @_; 
    $obj->head->get($header);
}

sub get_body   { 
    my ($class, $obj) = @_; 
    $obj->decoded->string;
}

sub set_header { 
    my ($class, $obj, $header, @data) = @_; 
    $obj->head->delete($header);
    $obj->head->add($header, $_) for @data; # Madness
}

sub set_body   {
    my ($class, $obj, $body) = @_; 
    $obj->body(Mail::Message::Body->new(data => [split /\n/, $body]));
    # Madness, madness
}

sub as_string { 
    my ($class, $obj) = @_; 
    $obj->string();
}

1;

=head1 NAME

Email::Abstract::MailMessage - Email::Abstract wrapper for Mail::Message

=head1 DESCRIPTION

This module wraps the Mail::Message mail handling library with an
abstract interface, to be used with L<Email::Abstract>

=head1 SEE ALSO

L<Email::Abstract>, L<Mail::Message>.

=cut

