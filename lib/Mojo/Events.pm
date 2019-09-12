package Mojo::Events;
use Mojo::Base -base;

use Mojo::Events::Dispatcher;
use Mojo::Events::Listeners;

use Mojo::Server;

our $VERSION = '0.0.1';

has app => sub { Mojo::Server->new->build_app('Mojo::HelloWorld') }, weak => 1;

has dispatcher => sub {
    return Mojo::Events::Dispatcher->new(app => shift->app);
};

has listeners => sub {
    my $self = shift;

    return Mojo::Events::Listeners->new(app => $self->app, namespaces => $self->namespaces);
};

1;
