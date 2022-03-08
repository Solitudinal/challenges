import Nat8 "mo:base/Nat8";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Array "mo:base/Array";
import Char "mo:base/Char";
import Text "mo:base/Text";

actor {

  // Challenge 1
  public func nat_to_nat8(n : Nat) : async Nat8 {
    return(Nat8.fromNat(n));
  };

  // Challenge 2
  public func max_number_with_n_bits(n : Nat) : async Nat {
    var sum : Nat = 0;
    for (exp in Iter.range(0, n - 1)) {
      sum += (Nat.pow(2, exp));
    };
    return(sum);
  };

  // Challenge 3 (not complete: come back to this)
  public func decimal_to_bits(n : Nat) : async Text {
    var binary_array : [Text] = [];
    var num : Nat = n;
    var rem : Nat = 0;
    var bin : Text = "";
    while (num > 1) {
      rem := num % 2;
      binary_array := Array.append<Text>(binary_array, [Nat.toText(rem)]);
      num := num / 2;
    };
    rem := num % 2;
    if (rem == 1) {
      binary_array := Array.append<Text>(binary_array, ["1"]);
    } else {
      binary_array := Array.append<Text>(binary_array, ["0"]);
    };
    for (bit in binary_array.vals()) {
      bin := bin # bit;
    };
    return(bin);
  };

  // Challenge 4 (incorrect: come back to this)
  public func capitalize_character(c : Text) : async Text {
    var upper_char_text : Text = "";
    for (char in c.chars()) {
      let lower_char_code : Nat32 = Char.toNat32(char);
      let upper_char_code : Nat32 = lower_char_code - 32;
      let upper_char : Char = Char.fromNat32(upper_char_code);
      upper_char_text := Char.toText(upper_char);
    };
    return(upper_char_text);
    };

    // Challenge 5
    public func capitalize_text(c : Text) : async Text {
    var upper_char_text : Text = "";
    for (char in c.chars()) {
      let lower_char_code : Nat32 = Char.toNat32(char);
      let upper_char_code : Nat32 = lower_char_code - 32;
      let upper_char : Char = Char.fromNat32(upper_char_code);
      upper_char_text := Char.toText(upper_char);
    };
    return(upper_char_text);
    };

    // Challenge 6
    public func is_inside(t : Text, c : Char) : async Bool {
      var inside : Bool = false;
      for (char in t.chars()) {
        if (char == c) {
          inside := true;
        };
      };
      return(inside);
    };

    // Challenge 7
    public func trim_whitespace(t : Text) : async Text {
      var trim : Text = "";
      for (char in t.chars()) {
        let check : Nat32 = Char.toNat32(char);
        if (check != 32) {
          var char_text : Text = Char.toText(char);
          trim := trim # char_text; 
        };
      };
      return(trim);
    };

    // Challenge 8 (come back to this later)
    //public func duplicated_character(t : Text) : async Text {
      //var duplicate : Bool = false;
      //for (char in t.chars()) {

      //}
    //}

    // Challenge 9 (out of time)
    // Challenge 10 (out of time)
};
