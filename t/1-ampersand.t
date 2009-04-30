#!/usr/bin/perl
# $Id: 1-ampersand.t 3398 2009-04-21 13:18:16Z makholm $

use strict;
use warnings;

use Test::More tests => 6;
use Test::NoWarnings;

use Encode::IMAPUTF7 qw(encode decode);

is(Encode::IMAPUTF7->encode("&"), "&-", "Single ampersand");
is(Encode::IMAPUTF7->encode("A&B"), "A&-B", "Ampersand surrounded by two US-ASCII chars");
is(Encode::IMAPUTF7->encode("A&\x{C5}"), "A&-&AMU-", "Ampersand surrounded by US-ASCII char and 8bit char");
is(Encode::IMAPUTF7->encode("\x{C5}&B"), "&AMU-&-B", "Ampersand surrounded by 8bit char and US-ASCII char");
is(Encode::IMAPUTF7->encode("\x{D8}&\x{C5}"), "&ANg-&-&AMU-", "Ampersand surrounded by two 8bit chars");


