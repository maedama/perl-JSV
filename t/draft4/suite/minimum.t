use strict;
use warnings;

use Test::More;
use Test::JSV::Suite;
use JSV::Validator;

my $validator = JSV::Validator->new;

subtest "strict type" => sub {
    Test::JSV::Suite->run(
        version => "draft4",
        suite   => "minimum",
        cb      => sub {
            my ($schema, $instance) = @_;
            return $validator->validate($schema, $instance);
        },
    );
};

subtest "loose type" => sub {
    Test::JSV::Suite->run(
        version => "draft4",
        suite   => "minimum",
        cb      => sub {
            my ($schema, $instance) = @_;
            return $validator->validate($schema, $instance, +{ loose_type => 1 });
        },
    );
};

done_testing;
