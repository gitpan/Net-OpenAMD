#!perl
# $AFresh1: local_server.t,v 1.9 2010/06/28 20:40:38 andrew Exp $
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

my $server = Test::Mojo::Server->new();
$server->executable('test_server.pl');

my $path = $server->find_executable_ok('executable found');
my $port = $server->start_daemon_ok('daemon test');
$server->server_ok('server running');

my $amd = Net::OpenAMD->new(
    { base_uri => 'http://127.0.0.1:' . $port . '/api/', } );
NetworkTests::run_tests($amd);

$server->stop_server_ok('server stopped');

#done_testing();
