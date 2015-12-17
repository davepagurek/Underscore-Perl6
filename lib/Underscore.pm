use v6;

module Underscore {
  my $iterable-type = List|Hash;

  class _ is export {
    my _ $instance;
    method new { !!! }
    method instance {
      $instance = _.bless unless $instance;
      $instance;
    }

    method each ($iterable where $iterable ~~ $iterable-type, &each-func) {
      for $iterable.kv -> $k, $v {
        if &each-func.count == 1 {
          &each-func($v); 
        } else {
          &each-func($v, $k);
        }
      }
    }
  }
}
