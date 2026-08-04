// Type asliases
type vector3D = (int, int, int)

// Datatypes
datatype Colour = Red | Orange | Yellow | Green | Blue | Indigo | Violet
datatype date = Date(day:nat, month:nat, year:nat)

// Discriminator
predicate isRed(c : Colour) { c.Red? }

// Fields
function centuryNumber(d:date) : nat {
    d.year / 100 + 1
}

// Using Fields
const jan1_1900 : date := Date(1,1,1900)

// Updating Fields
function makeFirstOfJan(d : date) : date {
    d.(day := 1, month := 2)
}


method Main() {
    print "isRed: ", isRed(Red), "\n";
    
    print "making 19/3/2026 the first of jan: ", makeFirstOfJan(Date(19, 3, 2026)), "\n";
}