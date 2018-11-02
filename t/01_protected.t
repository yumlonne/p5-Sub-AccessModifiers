use strict;
use warnings;
use utf8;
#use lib 't/lib';

use Test::Spec;

describe 'about Sub::AccessModifiers::protected' => sub {
    describe 'when called directly' => sub {
        it 'should die' => sub {
            dies_ok {
                X->protected_function;
            };
        }
    };
    describe 'when called from same package' => sub {
        it 'should do nothing' => sub {

        };
    }
    describe 'when called from other package' => sub {
        describe 'when caller package is child' => sub {
            it 'should do nothing' => sub {

            };
        };
        describe 'other' => sub {
            it 'should die' => sub {

            };
        };
    };
};

runtests unless caller;
