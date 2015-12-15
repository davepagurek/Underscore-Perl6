use v6;

module Underscore {
  class _ is export {
    my _ $instance;
    method new { !!! }
    method instance {
      $instance = _.bless unless $instance;
      $instance;
    }

    multi method each(@list, &each-func) {
      for @list.list -> $elem { &each-func($elem); }
    }
    multi method each(%hash, &each-func) {
      for %hash.kv -> $k, $v { &each-func($k, $v); }
    }
  }
}
