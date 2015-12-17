use v6;

module Underscore {
  class _ is export {
    my _ $instance;
    my $iterable-type = List|Hash;

    method new { !!! }
    method instance {
      $instance = _.bless unless $instance;
      $instance;
    }

    method !call-with(&func, *@args) {
      say @args[0 ..^ &func.count];
      &func(|@args[0 ..^ &func.count]);
    }

    method each($iterable where $iterable ~~ $iterable-type, &each-func) {
      for $iterable.kv -> $k, $v {
        self!call-with(&each-func, $v, $k);
      }
    }

    method map($iterable where $iterable ~~ $iterable-type, &map-func) {
      my @mapped = ();
      for $iterable.kv -> $k, $v {
        @mapped := |@mapped, self!call-with(&map-func, $v, $k);
      }
      @mapped;
    }
  }
}
