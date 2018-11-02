use strict;
use warnings;
use utf8;
use lib 't/lib';

require X;
require Y;

use Sub::AccessModifiers qw(protected);

use Test::Spec;
use Test::Exception;
use Test::MockModule;

describe 'about Sub::AccessModifiers::protected' => sub {
    my ($mockmodule);

    before all => sub {
        $mockmodule = Test::MockModule->new('Sub::AccessModifiers');
        $mockmodule->mock(public  => sub {});
        $mockmodule->mock(private => sub {});
    };

    describe 'when called directly' => sub {
        it 'should die' => sub {
            throws_ok {
                protected;
            } qr/Protected/;

            throws_ok {
                X->allin_method;
            } qr/Protected/;
        };
    };
    describe 'when called from same package' => sub {
        it 'should do nothing' => sub {
            is X->call_method, 1;
        };
    };
    describe 'when called from other package' => sub {
        describe 'when caller package is child' => sub {
            it 'should do nothing' => sub {
                is Y->call_from_child_method, 1;
            };
        };
        describe 'other' => sub {
            it 'should die' => sub {
                throws_ok {
                    Z->call_from_other_method;
                } qr/Protected/;
            };
        };
    };
};

runtests unless caller;
