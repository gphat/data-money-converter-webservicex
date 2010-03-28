use Test::More;
use strict;

use Data::Money;
use Data::Money::Converter::WebserviceX;

my $curr = Data::Money->new(value => 10, code => 'USD');
my $conv = Data::Money::Converter::WebserviceX->new;

SKIP: {
    skip 'Set TEST_WEBSERVICEX for online tests.', 1 unless $ENV{TEST_WEBSERVICEX};
    ok($conv->convert($curr, 'GBP'), 'conversion');
};

done_testing;