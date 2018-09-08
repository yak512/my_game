//
//  game.swift
//  
//
//  Created by BOUHADEB Yacoub on 08/09/2018.
//

import Foundation

class Character {
    
    var name: String
    
    init (name: String) {
        self.name = name
    }
    
    enum Class {
        case warrior
        case mage
        case coloss
        case dwarf
        case paladin
    }
    
    func attack() {
        
    }
}

class Warrior: Character {
    var lifePoint = 100
    let attack = 10
    var typeClass = Class.warrior
    
}

class Mage: Character {
    var lifePoint = 75
    let heal = 15
    var typeClass = Class.mage
    
}
class Coloss: Character {
    var lifePoint = 150
    let attack = 5
    var typeClass = Class.coloss
    
}

class Dwarf: Character {
    var lifePoint = 75
    let attack = 15
    var typeClass = Class.dwarf
    
}

class Paladin: Character {
    var lifePoint = 100
    let attack = 6
    let heal = 10
    var typeClass = Class.paladin
    
}
var arthas = Paladin(name: "Arthas")
print(arthas.typeClass)
