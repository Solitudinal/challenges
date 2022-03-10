import Custom "custom";
import Animal "animal";
import List "mo:base/List";

actor {

    // Challenge 1
    public type Adventurer = Custom.Adventurer;
    let gwyndolin : Adventurer = {
        race = "High Elf";
        sex = "female";
        age = 145;
        weapon = "shortbow";
    };
    public func fun() : async Adventurer {
        return(gwyndolin);
    };

    // Challenge 2
    public type Animal = Animal.Animal;
    var zebra : Animal = {
        species = "zebra";
        energy = 1;
    };

    // Challenge 3
    public func sleep() : async Animal {
        zebra := Animal.animal_sleep(zebra);
        return zebra;
    };

    // Challenge 4
    public func create_animal_then_takes_a_break(s : Text, e : Nat) : async Animal {
        var new_animal = {
            species = s;
            energy = e;
        };
        new_animal := Animal.animal_sleep(new_animal);
        return new_animal;
    };

    // Challenge 5
    public type List<Animal> = ?(Animal, List<Animal>);
    var animals = List.nil<Animal>();

    // Challenge 6
    public func push_animal(a : Animal) : () {
        animals := List.push<Animal>(a, animals);
    };

    public func get_animals() : async [Animal] {
        let animals_array = List.toArray<Animal>(animals);
        return animals_array;
    };

    // Challenge 7
    //public type List<T> = ?(T, List<T>);
    public func is_null(l : List<Animal>) : async Bool {
        switch(l) {
            case(null) {
                return true;
            };
            case(?l) {
                return false;
            };
        };
    };

    // Challenge 8
    public func last(l : List<Animal>) : async ?Animal {
        return (List.last<Animal>(l));
    };

    // Challenge 9
    public func size(l : List<Animal>) : async Nat {
        return (List.size<Animal>(l));
    };

    // Challenge 10
    public func get(l : List<Animal>, n : Nat) : async ?Animal {
        return (List.get(l, n));
    };

    // Challenge 11 (Come back to this)

};