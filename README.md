# NAME

Captcha::noCAPTCHA - Simple implementation of Google's noCAPTCHA reCAPTCHA for perl

# SYNOPSIS

The following is example usage to include captcha in page.

        my $cap = Captcha::noCAPTCHA->new({site_key => "your site key",secret_key => "your secret key"});
        my $html = $cap->html;

        # Include $html in your form page.

The following is example usage to verify captcha response.

        my $cap = Captcha::noCAPTCHA->new({site_key => "your site key",secret_key => "your secret key"});
        my $cgi = CGI->new;
        my $captcha_response = $cgi->param('g-recaptcha-response');

        if ($cap->verify($captcha_response',$cgi->remote_addr)) {
                # Process the rest of the form.
        } else {
                # Tell user he/she needs to prove his/her humanity.
        }

# METHODS

## html

Accepts no arguments.  Returns CAPTCHA html to be rendered with form.

## verify($g\_captcha\_response,$users\_ip\_address?)

Required $g\_captcha\_response. Input parameter from form containing g\_captcha\_response
Optional $users\_ip\_address.

Returns 1 if passed.

# FIELD OPTIONS

Support for the following field options, over what is inherited from
[HTML::FormHandler::Field](https://metacpan.org/pod/HTML::FormHandler::Field)

## site\_key

Required. The site key you get when you create an account on [https://www.google.com/recaptcha/](https://www.google.com/recaptcha/)

## secret\_key

Required. The secret key you get when you create an account on [https://www.google.com/recaptcha/](https://www.google.com/recaptcha/)

## theme

Optional. The color theme of the widget. Options are 'light ' or 'dark' (Default: light)

## api\_url

Optional. URL to the Google API. Defaults to https://www.google.com/recaptcha/api/siteverify

## api\_timeout

Optional. Seconds to wait for Google API to respond. Default is 10 seconds.

# SEE ALSO

The following modules or resources may be of interest.

[HTML::FormHandlerX::Field::noCAPTCHA](https://metacpan.org/pod/HTML::FormHandlerX::Field::noCAPTCHA)

See it in action at [https://www.httpuptime.com](https://www.httpuptime.com)

# AUTHOR

Chuck Larson `<clarson@cpan.org>`

# CONTRIBUTORS

leejo `<leejo@cpan.org>`

# COPYRIGHT & LICENSE

Copyright 2015, Chuck Larson `<chuck+github@endcapsoftwware.com>`

This projects work sponsered by End Cap Software, LLC.
[http://www.endcapsoftware.com](http://www.endcapsoftware.com)

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
