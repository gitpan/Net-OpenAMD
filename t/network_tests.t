#!perl
package NetworkTests;

# $AFresh1: network_tests.t,v 1.8 2010/07/13 00:14:43 andrew Exp $

use strict;
use warnings;

use Test::More;
use Net::OpenAMD;
use Data::Dumper;

if ( !caller() ) {
    if ( $ENV{'NETWORK_TESTS'} ) {
        plan tests => 13;
    }
    else {
        plan skip_all =>
            'Network test.  Set $ENV{NETWORK_TESTS} to a true value to run.';
    }

    my %tests = (
        location => [
            {   args   => undef,
                expect => [
                    {   'y'    => '43.4861220266',
                        'user' => 'user6',
                        'x'    => '18.2468971683'
                    },
                    {   'y'    => '36.5212503999',
                        'user' => 'user7',
                        'x'    => '27.138154414'
                    },
                    {   'y'    => '45.4561205517',
                        'user' => 'user4',
                        'x'    => '43.2247016461'
                    },
                    {   'y'    => '33.3876312219',
                        'user' => 'user5',
                        'x'    => '1.88999914202'
                    },
                    {   'y'    => '6.24512871596',
                        'user' => 'user2',
                        'x'    => '19.3851425782'
                    },
                    {   'y'    => '11.5686903901',
                        'user' => 'user3',
                        'x'    => '37.0118334017'
                    },
                    {   'y'    => '39.6231665024',
                        'user' => 'user0',
                        'x'    => '4.80925926012'
                    },
                    {   'y'    => '30.0999230116',
                        'user' => 'user1',
                        'x'    => '1.48091119245'
                    },
                    {   'y'    => '44.0085836003',
                        'user' => 'user8',
                        'x'    => '15.5482823414'
                    },
                    {   'y'    => '35.8354729961',
                        'user' => 'user9',
                        'x'    => '1.3539559599'
                    },
                    {   'y'    => '23.0220504783',
                        'user' => 'user10',
                        'x'    => '16.5797941904'
                    },
                    {   'y'    => '18.1245161319',
                        'user' => 'user11',
                        'x'    => '39.2951848533'
                    },
                    {   'y'    => '11.3998081612',
                        'user' => 'user12',
                        'x'    => '3.99920632586'
                    },
                    {   'y'    => '13.1865736157',
                        'user' => 'user13',
                        'x'    => '20.5159017473'
                    },
                    {   'y'    => '17.742550877',
                        'user' => 'user14',
                        'x'    => '4.55691655225'
                    },
                    {   'y'    => '18.7671525659',
                        'user' => 'user15',
                        'x'    => '0.262498111169'
                    },
                    {   'y'    => '44.2762837418',
                        'user' => 'user16',
                        'x'    => '35.5124464395'
                    },
                    {   'y'    => '36.5340075619',
                        'user' => 'user17',
                        'x'    => '9.14220464394'
                    },
                    {   'y'    => '29.2264569149',
                        'user' => 'user18',
                        'x'    => '3.47406301583'
                    },
                    {   'y'    => '1.68159309609',
                        'user' => 'user19',
                        'x'    => '1.41024785197'
                    }
                ],
            },
            {   args   => [ user => 'user0' ],
                expect => [],
            },
        ],
        speakers => [
            {   args   => undef,
                expect => [
                    [   '9000',
                        {   'name' => 'The Cheshire Catalyst',
                            'bio'  => 'Jacob\'s bio'
                        }
                    ],
                    [   'user0',
                        {   'name' => 'Jacob',
                            'bio'  => 'Jacob\'s bio'
                        }
                    ],
                    [   'user1',
                        {   'name' => 'Emma',
                            'bio'  => 'Emma\'s bio'
                        }
                    ],
                    [   'user10',
                        {   'name' => 'Alexander',
                            'bio'  => 'Alexander\'s bio'
                        }
                    ],
                    [   'user11',
                        {   'name' => 'Olivia',
                            'bio'  => 'Olivia\'s bio'
                        }
                    ],
                    [   'user12',
                        {   'name' => 'Anthony',
                            'bio'  => 'Anthony\'s bio'
                        }
                    ],
                    [   'user13',
                        {   'name' => 'Sophia',
                            'bio'  => 'Sophia\'s bio'
                        }
                    ],
                    [   'user14',
                        {   'name' => 'William',
                            'bio'  => 'William\'s bio'
                        }
                    ],
                    [   'user15',
                        {   'name' => 'Abigail',
                            'bio'  => 'Abigail\'s bio'
                        }
                    ],
                    [   'user16',
                        {   'name' => 'Christopher',
                            'bio'  => 'Christopher\'s bio'
                        }
                    ],
                    [   'user17',
                        {   'name' => 'Elizabeth',
                            'bio'  => 'Elizabeth\'s bio'
                        }
                    ],
                    [   'user18',
                        {   'name' => 'Matthew',
                            'bio'  => 'Matthew\'s bio'
                        }
                    ],
                    [   'user19',
                        {   'name' => 'Chloe',
                            'bio'  => 'Chloe\'s bio'
                        }
                    ],
                    [   'user2',
                        {   'name' => 'Michael',
                            'bio'  => 'Michael\'s bio'
                        }
                    ],
                    [   'user3',
                        {   'name' => 'Isabella',
                            'bio'  => 'Isabella\'s bio'
                        }
                    ],
                    [   'user4',
                        {   'name' => 'Ethan',
                            'bio'  => 'Ethan\'s bio'
                        }
                    ],
                    [   'user5',
                        {   'name' => 'Emily',
                            'bio'  => 'Emily\'s bio'
                        }
                    ],
                    [   'user6',
                        {   'name' => 'Joshua',
                            'bio'  => 'Joshua\'s bio'
                        }
                    ],
                    [   'user7',
                        {   'name' => 'Madison',
                            'bio'  => 'Madison\'s bio'
                        }
                    ],
                    [   'user8',
                        {   'name' => 'Daniel',
                            'bio'  => 'Daniel\'s bio'
                        }
                    ],
                    [   'user9',
                        {   'name' => 'Ava',
                            'bio'  => 'Ava\'s bio'
                        },
                    ],
                ],
            },
        ],
        talks => [
            {   args   => undef,
                expect => [
                    [   'Hacking Democracy: An In Depth Analysis of the ES&S Voting Systems',
                        {   'speakers' =>
                                '["Matt Blaze", "Sandy Clark", "Eric Cronin", "Gaurav Shah", "Micah Sherr", "Adam Aviv", "Pavol Cerny"]',
                            'interests' => '["crypto", "telephones"]',
                            'time'      => '2008/07/14 13:00:00',
                            'track'     => 'Hooper',
                            'abstract'  => '
                                     This talk will outline the U. Penn team\'s findings, which included 
                                     the discovery of exploitable security vulnerabilities in almost every 
                                     hardware and software component of the ES&S touch-screen and optical 
                                     scan systems.
                                     ',
                            'title' =>
                                'Hacking Democracy: An In Depth Analysis of the ES&S Voting Systems',
                        },
                    ],
                ],
            },
        ],
        interests => [
            {   args   => undef,
                expect => [
                    'new tech',
                    'activism',
                    'radio',
                    'lockpicking',
                    'crypto',
                    'privacy',
                    'ethics',
                    'telephones',
                    'social engineering',
                    'hacker spaces',
                    'hardware hacking',
                    'nostalgia',
                    'communities',
                    'science',
                    'government',
                    'network security',
                    'malicious software',
                    'pen testing',
                    'web',
                    'niche hacks',
                    'media',
                ],
            },
        ],
        users => [
            {   args   => undef,
                expect => [],
            },
        ],
        stats => [
            {   args   => undef,
                expect => qr/^Unused \s feature/xms,
            },
        ],
    );

    my $amd
        = Net::OpenAMD->new( { base_uri => 'http://api.hope.net/api/', } );
    run_tests( $amd, \%tests );

    #done_testing();
}

1;

sub run_tests {
    my ( $amd, $tests ) = @_;

    foreach my $method ( keys %{$tests} ) {
        foreach my $test ( @{ $tests->{$method} } ) {
            no warnings 'uninitialized';
            my $result;
            eval { $result = $amd->$method( $test->{args} ) };
            if ( ref $test->{expect} eq 'Regexp' ) {
                like( $@, $test->{expect}, "AMD->$method($test->{args})" );
            }
            elsif ( ref $test->{expect} ) {
                is( $@, '', "AMD->$method($test->{args})" );
                is_deeply( $result, $test->{expect},
                          "AMD->$method($test->{args}) - "
                        . 'got expected result' );
            }
            else {
                is( $@, $test->{expect}, "AMD->$method($test->{args})" );
            }
        }
    }
}
