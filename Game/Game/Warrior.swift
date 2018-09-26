//
//  Warrior.swift
//  Game
//
//  Created by BOUHADEB Yacoub on 25/09/2018.
//  Copyright © 2018 BOUHADEB Yacoub. All rights reserved.
//

import Foundation

// This Class inherit of class Character, Warrior is an unique Character with unique specs
class Warrior: Character {
    override init (name: String, lifePoint: Int, maxLife: Int, weapon: Weapon) {
        super.init(name: name, lifePoint: lifePoint, maxLife: maxLife, weapon: weapon)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 100, maxLife: 100, weapon: Weapon(name: "Sword of fury", damage: 10, heal: 0))
    }
    
}
