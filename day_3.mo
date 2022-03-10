import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";

actor {

    // Challenge 1
    let array : [var Nat] = [var 1, 4, 6, 8];
    private func _swap(array : [var Nat], j : Nat, i : Nat) : () {
        var tmp : Nat = array[j];
        array[j] := array[i];
        array[i] := tmp;
    };
    _swap(array, 0, 1);
    let imm_array : [Nat] = Array.freeze<Nat>(array);

    public query func swap() : async [Nat] {
        return(imm_array);
    };

    // Challenge 2
    public func init_count(n : Nat) : async [Nat] {
        return(Iter.toArray(Iter.range(0, n-1)));
    };

    // Challenge 3 
    public func seven(array : [Nat]) : async Text {
        var check : Bool = false;
        for (num in array.vals()) {
            var num_text = Nat.toText(num);
            for (char in num_text.chars()) {
                if (char == '7') {
                    check := true;
                };
            };
        };
        if (check == true) {
            return("Seven is found");
        } else {
            return("Seven not found");
        };
    };

    // Challenge 4
    public func nat_opt_to_nat(n : ?Nat, m : Nat) : async Nat {
        switch(n) {
            case(null) {
                return(m);
            };
            case(?something) {
                return(something);
            };
        };
    };

    // Challenge 5
    public func day_of_the_week(n : Nat) : async ?Text {
        switch(n) {
            case(1) {
                return(?"Monday");
            };
            case(2) {
                return(?"Tuesday");
            };    
            case(3) {
                return(?"Wednesday");
            };
            case(4) {
                return(?"Thursday");
            };
            case(5) {
                return(?"Friday");
            };
            case(6) {
                return(?"Saturday");
            };
            case(7) {
                return(?"Sunday");
            };
            case(n) {
                return(null);
            };
        };
    };

    // Challenge 6
    private func _check_value(n : ?Nat) : Nat {
        switch(n) {
            case(null) {
                return(0);
            };
            case(?something) {
                return(something);
            };
        };
    };
    
    public func populate_array(array : [?Nat]) : async [Nat] {
        let new_array : [Nat] = Array.map<?Nat, Nat>(array, _check_value);
        return(new_array);
    };
    
    // Challenge 7
    let add_f = func _add(n : Nat, m : Nat) : Nat {
        return(n + m);
    };

    public func sum_of_array(array : [Nat]) : async Nat {
        return(Array.foldLeft<Nat, Nat>(array, 0, add_f));
    };

    // Challenge 8
    let square_f = func _square(n : Nat) : Nat {
        return(n * n);
    };

    public func squared_array(array : [Nat]) : async [Nat] {
        return(Array.map<Nat, Nat>(array, square_f));
    };

    // Challenge 9
    let index_f = func _add_index(n : Nat, m : Nat) : Nat {
        return(n + m);
    };

    public func increase_by_index(array : [Nat]) : async [Nat] {
        return(Array.mapEntries<Nat, Nat>(array, index_f));
    };

    /* Challenge 10 (Come back later)
    let comp_f = func _compare<A>(n : A, m : A) : Bool {
        if(n == m) {
            return true;
        } else {
            return false;
        };
    };

    public func contains<A>(array : [A], a : A) : async Bool {

    }; */

};