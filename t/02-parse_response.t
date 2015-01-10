#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

use_ok('Captcha::noCAPTCHA');

my $cap = Captcha::noCAPTCHA->new({
	site_key   => 'fake site key',
	secret_key => 'fake secret key',
});

ok(not $cap->_parse_response);
ok(not $cap->_parse_response(''));
ok(not $cap->_parse_response('not a hash'));
ok(not $cap->_parse_response({}));
ok(not $cap->_parse_response({success => 0}));
ok(not $cap->_parse_response({success => 1}));
ok(not $cap->_parse_response({success => 1,content => ''}));
ok(not $cap->_parse_response({success => 1,content => '{"success": false}'}));
ok($cap->_parse_response({success => 1,content => '{"success": true}'}));

done_testing();
