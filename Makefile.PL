use inc::Module::Install;

name     'Data-Money-Converter-WebserviceX';
all_from 'lib/Data/Money/Converter/WebserviceX.pm';
author   q{Cory G Watson <gphat@cpan.org>};
license  'perl';

requires 'Data::Money';
requires 'Data::Money::Converter';
requires 'Finance::Currency::Convert::WebserviceX';
requires 'Moose';

build_requires 'Test::More';

WriteAll;

