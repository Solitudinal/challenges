import Debug "mo:base/Debug";
import Array "mo:base/Array";
import Iter "mo:base/Iter";

actor {

  // Challenge 1
  public func add(n : Nat, m : Nat) : async Nat {
    return(n + m);
  };

  // Challenge 2
  public func square(n : Nat) : async Nat {
    return(n * n);
  };

  // Challenge 3
  public func days_to_seconds(n : Nat) : async Nat {
    return(n * 86400);
  };

  // Challenge 4
  var counter : Nat = 0;
  public func increment_counter(n : Nat) : async Nat {
    counter += n;
    return(counter);
  };
  public func clear_counter() : async Nat {
    counter := 0;
    return(counter);
  };

  // Challenge 5
  public func divide(n : Nat, m : Nat) : async Bool {
    if(n % m == 0) {
      return(true);
    } else {
      return(false);
    };
  };

  // Challenge 6
  public func is_even(n : Nat) : async Bool {
    if(n % 2 == 0) {
      return(true);
    } else {
      return(false);
    };
  };

  // Challenge 7
  var sum : Nat = 0;
  public func sum_of_array(n : [Nat]) : async Nat {
    if(sum != 0) {
      sum := 0;
    };
    for (num in n.vals()) {
      sum += num
    };
    if(n == []) {
      return(0);
    } else {
      return(sum);
    };
  };

  // Challenge 8
  var max : Nat = 0;
  public func maximum(n : [Nat]) : async Nat {
    if(max != 0) {
      max := 0; 
    };
    for (num in n.vals()) {
      if(num > max) {
        max := num;
      };
    };
    return(max)
  };

  // Challenge 9
  public func remove_from_array(m : [Nat], n : Nat) : async [Nat] {
    var new_array : [Nat] = [];
    for (num in m.vals()) {
      if(num != n) {
        new_array := Array.append<Nat>(new_array, [num]);
      };
    };
    return(new_array)
  }; 

  // Challenge 10 (come back to this later)
  //public func selection_sort(m : [Nat]) : async [Nat] {
    //var new_array : [Nat] = [];
    //var current : Int = (-1);
    //var min : Int = (-1);
    //for (iter in Iter.range(0, m.size()) {
      //if(min >= 0) {
        //new_array := Array.append<Nat>(new_array, [min]);
      //};  
      //for (num in m.vals()) {
        //if (iter == 0) {
          //min := num;
        //};
        //current := num;
        //if (current < min) {
          //min := num;
        //};
      //};  
    //};
  //};
};