use strict;
use warnings;
use utf8;

use Sub::AccessModifiers qw(public protected private);

# should mock 2/3 function
sub allin_method { public; protected; private;
    return 1;
}

sub call_method {
    shift->allin_method;
}

1;
