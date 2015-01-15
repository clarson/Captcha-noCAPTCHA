#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

use_ok('Captcha::noCAPTCHA');

my $cap = Captcha::noCAPTCHA->new({
	site_key   => 'fake site key',
	secret_key => 'fake secret key',
});

ok(not defined $cap->_parse_response);
is_deeply($cap->errors,['http-tiny-no-response']);

ok(not defined $cap->_parse_response(''));
is_deeply($cap->errors,['http-tiny-no-response']);

ok(not defined $cap->_parse_response('not a hash'));
is_deeply($cap->errors,['http-tiny-no-response']);

ok(not defined $cap->_parse_response({}));
is_deeply($cap->errors,['status-code-0']);

ok(not defined $cap->_parse_response({success => 0,status => 500}));
is_deeply($cap->errors,['status-code-500']);

ok(not defined $cap->_parse_response({success => 1}));
is_deeply($cap->errors,['no-content-returned']);

ok(not defined $cap->_parse_response({success => 1,content => ''}));
is_deeply($cap->errors,['no-content-returned']);

ok(not $cap->_parse_response({success => 1,content => '{"success": false}'}));
ok(not defined $cap->errors);

ok($cap->_parse_response({success => 1,content => '{"success": true}'}));
ok(not defined $cap->errors);

done_testing();
