#!perl
# $AFresh1: local_server.t,v 1.10 2010/06/30 05:30:17 andrew Exp $
use Test::More;

use strict;
use warnings;

use Net::OpenAMD;

BEGIN {
    use FindBin;
    use lib "$FindBin::Bin";
    use lib "$FindBin::Bin/../../mojo/lib";

    eval "use Test::Mojo::Server";
    if ($@) {
        plan skip_all => "Test::Mojo::Server required for testing local server";
    }
    else {
        plan tests => 15;
    }
    require 'network_tests.t';
}

my %tests = (
    location => [
        {   args   => undef,
            expect => [
                {   'y'      => '83.1452331542969',
                    'area'   => 'Engressia',
                    'time'   => 2387,
                    'user'   => 12983,
                    'x'      => '46.7369918823242',
                    'button' => 'False'
                }
            ],
        },
    ],
    speakers => [
        {   args   => undef,
            expect => [
                {   'name' => 'Johnny',
                    'bio'  => 'Johnny\'s bio'
                },
            ],
        },
    ],
    talks => [
        {   args   => undef,
            expect => [
                {   'speakers'  => [ 'Judas', 'JohnnyX' ],
                    'interests' => [ 'media', 'crypto' ],
                    'time'      => '2008/7/18 13:00:00',
                    'track'     => 'Hooper',
                    'title' => 'Ancient Egyptian Music and DRM',
                    'abstract' =>
                        'A discussion of the development of musical notation, which was designed as a means of reproducing music while making it impossible for the general public to perform without permission.'
                }
            ],
        },
    ],
    interests => [
        {   args   => undef,
            expect => [
                'new tech',           'activism',
                'radio',              'lockpicking',
                'crypto',             'privacy',
                'ethics',             'telephones',
                'social engineering', 'hacker spaces',
                'hardware hacking',   'nostalgia',
                'communities',        'science',
                'government',         'network security',
                'malicious software', 'pen testing',
                'web',                'niche hacks',
                'media',
            ],
        },
    ],
    users => [
        {   args   => undef,
            expect => [
                {   'name'      => 'JohnnyX',
                    'x'         => '32.54091324',
                    'y'         => '54.10958384',
                    'interests' => [
                        'new tech',           'radio',
                        'lockpicking',        'crypto',
                        'telephones',         'social engineering',
                        'hacker spaces',      'hardware hacking',
                        'nostalgia',          'communities',
                        'science',            'network security',
                        'malicious software', 'pen testing'
                    ],
                }
            ]
        },
    ],
    stats => [
        {   args   => undef,
            expect => qr/^Unused \s feature/xms,
        },
    ],
);

my $server = Test::Mojo::Server->new();
$server->executable('test_server.pl');

my $path = $server->find_executable_ok('executable found');
my $port = $server->start_daemon_ok('daemon test');
$server->server_ok('server running');

my $amd = Net::OpenAMD->new(
    { base_uri => 'http://127.0.0.1:' . $port . '/api/', } );
NetworkTests::run_tests( $amd, \%tests );

$server->stop_server_ok('server stopped');

#done_testing();
