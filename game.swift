//
//  game.swift
//  
//
//  Created by BOUHADEB Yacoub on 08/09/2018.
//

import Foundation

class Player {
    var playerName: String
    var heroes = [Character]()
    
    init(playerName: String) {
        self.playerName = playerName
    }
    
}

class Character {
    
    var name: String
    var attack: Int
    var lifePoint: Int
    
    init (name: String, lifePoint: Int, attack: Int) {
        self.name = name
        self.lifePoint = lifePoint
        self.attack = attack
    }
}

class Warrior: Character {
   
   override init (name: String, lifePoint: Int, attack: Int) {
    super.init(name: name, lifePoint: lifePoint, attack: attack)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 33, attack: 42)
    }
    
}


class Mage: Character {
    static let heal = 15;
    
    override init (name: String, lifePoint: Int, attack: Int) {
        super.init(name: name, lifePoint: lifePoint, attack: attack)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 33, attack: 0)
    }
}

class Coloss: Character {
    override init (name: String, lifePoint: Int, attack: Int) {
        super.init(name: name, lifePoint: lifePoint, attack: attack)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 150, attack: 6)
    }
    
}

class Dwarf: Character {
    override init (name: String, lifePoint: Int, attack: Int) {
        super.init(name: name, lifePoint: lifePoint, attack: attack)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 75, attack: 20)
    }
    
}

class Paladin: Character {
    
    static let heal = 10
    override init (name: String, lifePoint: Int, attack: Int) {
        super.init(name: name, lifePoint: lifePoint, attack: attack)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 100, attack: 7)
    }
    
}

var p1 = Player(playerName: "Yak")

print("good")
p1.heroes.append(Warrior(name: "Garrosh"))
p1.heroes.append(Mage(name: "lol"))


print(p1.heroes[0].attack)
print(p1.heroes[1].attack)





