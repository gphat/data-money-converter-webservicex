use inc::Module::Install;

name     'Data-Currency-Converter-WebserviceX';
all_from 'lib/Data/Currency/Converter/WebserviceX.pm';
author   q{Cory G Watson <gphat@cpan.org>};
license  'perl';

requires 'Data::Currency';
requires 'Finance::Currency::Convert::WebserviceX';
requires 'Moose';

build_requires 'Test::More';

WriteAll;

