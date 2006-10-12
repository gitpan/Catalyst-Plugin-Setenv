package Catalyst::Plugin::Setenv;

use warnings;
use strict;
use NEXT;

=head1 NAME

Catalyst::Plugin::Setenv - Allows you to set up the environment from Catalyst's config file.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

In your application:

    use Catalyst qw/Setenv/;

In your config file:

    environment:
      FOO: bar
      BAR: baz

When your app starts, $ENV{FOO} will be "bar", and $ENV{BAR} will be
"baz".

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 FUNCTIONS

=head2 setup

Calls the other setup methods, and then sets the environment variables.

=cut

sub setup {
    my $c = shift;
    
    $c->NEXT::setup(@_);
    
    my $env = $c->config->{environment};
    return unless ref $env eq 'HASH';

    foreach (keys %$env){
	$ENV{$_} = $env->{$_};
    }
      
    return;
}

=head1 AUTHOR

Jonathan Rockway, C<< <jrockway at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-catalyst-plugin-setenv at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Catalyst-Plugin-Setenv>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Catalyst::Plugin::Setenv

You can also look for information at:

=over 4

=item * The Catalyst Website

L<http://www.catalystframework.org/>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Catalyst-Plugin-Setenv>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Catalyst-Plugin-Setenv>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Catalyst-Plugin-Setenv>

=item * Search CPAN

L<http://search.cpan.org/dist/Catalyst-Plugin-Setenv>

=back

=head1 ACKNOWLEDGEMENTS

Thanks to Bill Moseley's message to the mailing list that prompted me
to write this.

=head1 COPYRIGHT & LICENSE

Copyright 2006 Jonathan Rockway, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Catalyst::Plugin::Setenv
