# -*- perl -*-

use v5.16;
use warnings;

use Athena::Lib;
use Test::More;

use_ok 'Potter';

is Potter::price(1), 8;
is Potter::price(1, 1), 16;
is Potter::price(5), 8;
is Potter::price(1, 2), 16 * .95;
is Potter::price(1, 3), 16 * .95;

is Potter::price(1,2,3), 24 * .9;
is Potter::price(1,2,3,4,5), 40 * .75;
done_testing();
