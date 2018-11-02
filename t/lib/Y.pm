use strict;
use warnings;
use utf8;

use parent 'X';

sub call_from_child_method {
    shift->allin_method;
}
