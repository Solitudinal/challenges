module {

    public type Animal = {
        species : Text;
        energy : Nat;
    };

    public func animal_sleep(a : Animal) : Animal {
        let new_energy = a.energy + 10;
        let new_animal = a.species;
        let b : Animal = {
            species = new_animal;
            energy = new_energy;
        };
        return b;
    };

};