package Sub::AccessModifiers;
use 5.008001;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(public protected private);

our $VERSION = "0.01";

sub public {}

sub protected {
    my ($c0_pkg, $c0_filename, $c0_line, $c0_sub) = caller(0);
    my ($c1_pkg, $c1_filename, $c1_line)          = caller(1);
    die "$c0_sub is Private at $c1_filename line $c1_line.\n"
        if $c1_pkg->isa($c0_pkg);
}

sub private {
    my ($c0_pkg, $c0_filename, $c0_line, $c0_sub) = caller(0);
    my ($c1_pkg, $c1_filename, $c1_line)          = caller(1);
    die "$c0_sub is Private at $c1_filename line $c1_line.\n"
        if $c1_pkg eq $c0_pkg;
}

1;
__END__

=encoding utf-8

=head1 NAME

Sub::AccessModifiers - It's new $module

=head1 SYNOPSIS

    use Sub::AccessModifiers;

=head1 DESCRIPTION

Sub::AccessModifiers is ...

=head1 LICENSE

Copyright (C) yumlonne.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

yumlonne E<lt>yumlonne@gmail.comE<gt>

=cut

