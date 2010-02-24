package Data::Currency::Converter::WebserviceX;
use warnings;
use strict;
use Moose;

use Data::Currency;
use Data::Currency::Types qw(CurrencyCode);
use Finance::Currency::Convert::WebserviceX;


with 'Data::Currency::Converter';

our $VERSION = '0.01';

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

Data::Currency::Converter::WebserviceX - The great new Data::Currency::Converter::WebserviceX!

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Data::Currency::Converter::WebserviceX;

    my $foo = Data::Currency::Converter::WebserviceX->new();
    ...

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
