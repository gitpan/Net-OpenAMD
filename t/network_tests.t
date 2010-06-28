#!perl
package NetworkTests;

# $AFresh1: network_tests.t,v 1.5 2010/06/28 20:40:38 andrew Exp $

use strict;
use warnings;

use Test::More;
use Net::OpenAMD;

if ( !caller() ) {
    if ( $ENV{'NETWORK_TESTS'} ) {

        # plan tests => ??;
    }
    else {
        plan skip_all => 'Network test.  Set $ENV{NETWORK_TESTS} to a true value to run.';
    }

    my $amd = Net::OpenAMD->new();
    run_tests($amd);

    done_testing();
}

1;

sub run_tests {
    my ($amd) = @_;

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

    foreach my $method ( keys %tests ) {
        foreach my $test ( @{ $tests{$method} } ) {
            no warnings 'uninitialized';
            my $result;
            eval { $result = $amd->$method( $test->{args} ) };
            if ( ref $test->{expect} eq 'Regexp' ) {
                like( $@, $test->{expect}, "AMD->$method($test->{args})" );
            }
            elsif ( ref $test->{expect} ) {
                is( $@, '', "AMD->$method($test->{args})" );
                is_deeply( $result, $test->{expect}, 'got expected result' );
            }
            else {
                is( $@, $test->{expect}, "AMD->$method($test->{args})" );
            }
        }
    }
}
