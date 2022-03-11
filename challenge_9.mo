import HashMap "mo:base/HashMap";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import Principal "mo:base/Principal";

actor {

    stable var entries : [(Principal, Nat)] = [];
    let favoriteNumber = HashMap.fromIter<Principal, Nat>(entries.vals(), 0, Principal.equal, Principal.hash); 

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

    public shared({caller}) func update_favorite_number(n : Nat) : async ?Nat {
        return(favoriteNumber.replace(caller, n));
    };

    public shared({caller}) func delete_favorite_number() : async ?Nat {
        return(favoriteNumber.remove(caller));
    };

    system func preupgrade() {
        entries := Iter.toArray(favoriteNumber.entries());
     };

    system func postupgrade() {
        entries := [];
    };

};