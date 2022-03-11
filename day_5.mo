import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Cycles "mo:base/ExperimentalCycles";
import Nat "mo:base/Nat";

actor {

    // Challenge 1
    public shared({caller}) func is_anonymous() : async Bool {
        if (Principal.isAnonymous(caller) == true) {
            return true;
        } else {
            return false;
        };
    };

    // Challenge 2
    let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

    // Challenge 3 & 4
    public shared({caller}) func add_favorite_number(n : Nat) : async Text {
        if (favoriteNumber.get(caller) == null) {
            favoriteNumber.put(caller, n);
            return "You've successfully registered your number.";
         } else {
             return "You've already registered your number.";
         };
    };


    public shared({caller}) func show_favorite_number() : async ?Nat {
        return(favoriteNumber.get(caller));
    };

    // Challenge 5
    public shared({caller}) func update_favorite_number(n : Nat) : async ?Nat {
        return(favoriteNumber.replace(caller, n));
    };

    public shared({caller}) func delete_favorite_number() : async ?Nat {
        return(favoriteNumber.remove(caller));
    };

    // Challenge 6
    public func deposit_cycles() : async Nat {
        let bal : Nat = Cycles.available();
        return(Cycles.accept(bal));
    };

    /* Challenge 7 (I don't understand this one lol)
    public shared({caller}) func withdraw_cycles(n : Nat) : async Nat {
        return(Cycles.accept(n));
    };*/

    // Challenge 8
    stable var counter : Nat = 0;
    public func increment_counter(n : Nat) : async Nat {
        counter += n;
        return(counter);
    };
    
    public func clear_counter() : async Nat {
        counter := 0;
        return(counter);
    };

    stable var versionNumber : Nat = 0;
    public func check_version() : async Nat {
        return(versionNumber);
    };
    
    system func postupgrade() {
        versionNumber += 1;
    };

    // Challenge 9 in challenge_9.mo

    // Challenge 10 (come back to this later)



};