use v6;
use Test;
plan *;

use lib "lib";
use Underscore;

my @arr;
my %hsh;

subtest {
  @arr := [];
  _.each([1, 2, 3], -> $i {
    @arr.push($i);
  });
  is @arr, [1, 2, 3], "can iterate through simple list";

  %hsh := {};
  _.each({a => 1, b => 2, c => 3}, -> $k, $v {
    %hsh.push($k => $v);
  });
  is %hsh, {a => 1, b => 2, c => 3}, "can iterate through simple hash";

  done-testing;
}, "each";

done-testing;
