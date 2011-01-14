#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use lib $ENV{HOME}.'/perl5/lib/perl5';
use Encode;
use Cocoa::Growl ':all';
use Cocoa::EventLoop;

growl_register(
    app           => 'HDK48',
    icon          => 'http://yappo.irori.org/ouffu/hidek.png',
    notifications => [qw( start tiger fire cyber fiber diver viver jyajya )],
);

growl_notify(
    name        => 'start',
    title       => 'HDK48',
    description => encode_utf8('っしゃいくぜー'),
    icon        => 'http://yappo.irori.org/ouffu/hidek.png',
    on_click    => sub {
        tiger();
    },
    on_timeout  => sub { exit; },
);

sub tiger {
    growl_notify(
        name        => 'tiger',
        title       => 'HDK48',
        description => encode_utf8('タイガー'),
        icon        => 'http://yappo.irori.org/ouffu/hidek.png',
        on_click    => sub {
            fire()
        },
        on_timeout  => sub { exit; },
    );
}

sub fire {
    growl_notify(
        name        => 'fire',
        title       => 'HDK48',
        description => encode_utf8('ファイヤー'),
        icon        => 'http://yappo.irori.org/ouffu/hidek-red.png',
        on_click    => sub {
            cyber();
        },
        on_timeout  => sub { exit; },
    );
}

sub cyber {
    growl_notify(
        name        => 'cyber',
        title       => 'HDK48',
        description => encode_utf8('サイバー'),
        icon        => 'http://yappo.irori.org/ouffu/hidek.png',
        on_click    => sub {
            fiber();
        },
        on_timeout  => sub { exit; },
    );
}

sub fiber {
    growl_notify(
        name        => 'fiber',
        title       => 'HDK48',
        description => encode_utf8('ファイバー'),
        icon        => 'http://yappo.irori.org/ouffu/hidek-green.png',
        on_click    => sub {
            diver();
        },
        on_timeout  => sub { exit; },
    );
}

sub diver {
    growl_notify(
        name        => 'diver',
        title       => 'HDK48',
        description => encode_utf8('ダイバー'),
        icon        => 'http://yappo.irori.org/ouffu/hidek-blue.png',
        on_click    => sub {
            viver();
        },
        on_timeout  => sub { exit; },
    );
}

sub viver {
    growl_notify(
        name        => 'viver',
        title       => 'HDK48',
        description => encode_utf8('バイバー'),
        icon        => 'http://yappo.irori.org/ouffu/hidek.png',
        on_click    => sub {
            jyajya();
        },
        on_timeout  => sub { exit; },
    );
}

sub jyajya {
    growl_notify(
        name        => 'jyajya',
        title       => 'HDK48',
        description => encode_utf8('ジャージャー'),
        icon        => 'http://yappo.irori.org/ouffu/hidek.png',
        on_click    => sub {
            exit;
        },
        on_timeout  => sub { exit; },
    );
}

Cocoa::EventLoop->run;

