package Email::Abstract::MailInternet;
use strict;
sub target { "Mail::Internet" }

sub construct {
    require Mail::Internet;
    my ($class, $rfc822) = @_;
    Mail::Internet->new([ map { "$_\n" } split /\n/, $rfc822]);
}

sub get_header { 
    my ($class, $obj, $header) = @_; 
    my @values = $obj->head->get($header); 

    # No reason to s/// lots of values if we're just going to return one.
    $#values = 0 if not wantarray;

    chomp @values;
    s/(?:\x0d\x0a|\x0a\x0d|\x0a|\x0d)\s+/ /g for @values;

    return wantarray ? @values : $values[0];
}

sub get_body { 
    my ($class, $obj) = @_; 
    join "", @{$obj->body()};
}

sub set_header { 
    my ($class, $obj, $header, @data) = @_; 
    my $count = 0;
    $obj->head->replace($header, shift @data, ++$count) while @data; 
}

sub set_body {
    my ($class, $obj, $body) = @_; 
    $obj->body( map { "$_\n" } split /\n/, $body ); 
}

sub as_string { my ($class, $obj) = @_; $obj->as_string(); }

1;

=head1 NAME

Email::Abstract::MailInternet - Email::Abstract wrapper for Mail::Internet

=head1 DESCRIPTION

This module wraps the Mail::Internet mail handling library with an
abstract interface, to be used with L<Email::Abstract>

=head1 SEE ALSO

L<Email::Abstract>, L<Mail::Internet>.

=cut

