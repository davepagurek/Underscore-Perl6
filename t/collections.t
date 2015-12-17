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

subtest {
  is [1, 4, 9], _.map([1, 2, 3], -> $elem { $elem*$elem }), "can map a list";
  is [1, 5, 11], _.map([1, 2, 3], -> $elem, $i { $elem*$elem+$i }), "can map a list and receive index";

  is Set.new(1, 4, 9), Set.new(|_.map({a=>1, b=>2, c=>3}, -> $i { $i*$i })), "can map a hash";

  done-testing;
}, "map";

done-testing;
