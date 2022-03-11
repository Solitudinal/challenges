import Result "mo:base/Result";
import List "mo:base/List";

actor {

    public type Result = Result.Result<(), Text>;
    public type List<T> = ?(T, List<T>);

    let other_canister : actor {
        mint:() -> async Result;
        balance:() -> async List<Nat>;
    } = actor("rrkah-fqaaa-aaaaa-aaaaq-cai");

    public func mint() : async Result {
        return(await other_canister.mint());
    };

    public func balance() : async List<Nat> {
        return(await other_canister.balance());
    };

};