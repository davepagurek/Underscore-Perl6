use v6;
use Test;
plan *;

use lib "lib";
use Underscore;

my @arr;
my %hsh;

subtest {
  @arr := [];
  _.each([1, 2, 3], -> $elem {
    @arr.push($elem);
  });
  is @arr, [1, 2, 3], "can iterate through simple list";

  %hsh := {};
  _.each({a => 1, b => 2, c => 3}, -> $v, $k {
    %hsh.push($k => $v);
  });
  is %hsh, {a => 1, b => 2, c => 3}, "can iterate through simple hash";

  @arr := [];
  _.each([1, 2, 3], -> $elem, $i {
    @arr.push($elem - $i);
  });
  is @arr, [1, 1, 1], "list can receive index";

  done-testing;
}, "each";

done-testing;
