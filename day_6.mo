import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Hash "mo:base/Hash";
import Result "mo:base/Result";
import List "mo:base/List";
import HTTP "http";
import Iter "mo:base/Iter";

actor {

    // Challenge 1
    public type TokenIndex = Nat;
    public type Error = {
        #Yes;
        #No;
    };

    // Challenge 2
    stable var entries : [(TokenIndex, Principal)] = [];
    let registry = HashMap.fromIter<TokenIndex, Principal>(entries.vals(), 0, Nat.equal, Hash.hash);
    
    // Challenge 3
    public type Result = Result.Result<(), Text>;
    stable var nextTokenIndex : Nat = 0;
    stable var lastPrincipal : Text = "";
    public shared({caller}) func mint() : async Result {
        if (Principal.isAnonymous(caller)) {
            return #err("You need to be authenticated to mint.")
        } else {
            registry.put(nextTokenIndex, caller);
            nextTokenIndex += 1;
            lastPrincipal := Principal.toText(caller);
            return #ok;
        };
    };

    // Challenge 4
    public func transfer(to : Principal, tokenIndex : Nat) : async Result {
        if (registry.remove(tokenIndex) == null) {
            return #err("Token index not found.")
        } else {
            registry.put(tokenIndex, to);
            return #ok;
        };
    };

    // Challenge 5
    public type List<T> = ?(T, List<T>);
    public shared({caller}) func balance() : async List<Nat> {
        var tokens : List<Nat> = List.nil<Nat>();
        for ((k, v) in registry.entries()) {
            if (v == caller) {
                tokens := List.push<Nat>(k, tokens);
            };
        };
        return(tokens);
    };

    // Challenge 6
    public query func http_request(request : HTTP.Request) : async HTTP.Response {
    let response = {
      body = Text.encodeUtf8(Nat.toText(registry.size()) # " total NFTs minted. Last principal was " # lastPrincipal # ".");
      headers = [("Content-Type", "text/html; charset=UTF-8")];
      status_code = 200 : Nat16;
      streaming_strategy = null
      };
      return(response)
    };

    // Challenge 7
    system func preupgrade() {
        entries := Iter.toArray(registry.entries());
    };

    system func postupgrade() {
        entries := [];
    };

    // Challenge 8 code is in wallet.mo

    // Challenge 9
    // Challenge 10 (Come back for these later)

};