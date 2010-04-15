package Data::Money::Converter::WebserviceX;
use warnings;
use strict;
use Moose;

use Data::Money;
use Data::Money::Types qw(CurrencyCode);
use Finance::Currency::Convert::WebserviceX;

with 'Data::Money::Converter';

our $VERSION = '0.02';

has '_converter' => (
    is => 'ro',
    isa => 'Finance::Currency::Convert::WebserviceX',
    lazy_build => 1
);

sub _build__converter {
    return Finance::Currency::Convert::WebserviceX->new;
}

sub convert {
    my ($self, $curr, $code) = @_;

    die("$code is not a valid currency code.") unless is_CurrencyCode($code);

    return $curr->clone(
        code => $code,
        value => $self->_converter->convert($curr->value, $curr->code, $code),
    );
}

1;

__END__

=head1 NAME

Data::Money::Converter::WebserviceX - WebserviceX currency conversion implementation

=head1 SYNOPSIS

    my $curr = Data::Money->new(value => 10, code => 'USD');
    my $conv = Data::Money::Converter::WebserviceX->new;
    $conv->convert($curr, 'GBP'); # Converted!


=head1 AUTHOR

Cory G Watson, C<< <gphat at cpan.org> >>

=head1 ACKNOWLEDGEMENTS

=head1 COPYRIGHT & LICENSE

Copyright 2010 Cory G Watson.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut
