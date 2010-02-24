use Test::More;
use strict;

use Data::Currency;
use Data::Currency::Converter::WebserviceX;

my $curr = Data::Currency->new(value => 10, code => 'USD');
my $conv = Data::Currency::Converter::WebserviceX->new;

SKIP: {
    skip 'Set TEST_WEBSERVICEX for online tests.', 1 unless $ENV{TEST_WEBSERVICEX};
    ok($conv->convert($curr, 'GBP'), 'conversion');
};

done_testing;