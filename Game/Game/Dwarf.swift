//
//  Dwarf.swift
//  Game
//
//  Created by BOUHADEB Yacoub on 25/09/2018.
//  Copyright © 2018 BOUHADEB Yacoub. All rights reserved.
//

import Foundation

// Dward inherit of class Character, Dwarf is an unique Character with unique specs
class Dwarf: Character {
    override init (name: String, lifePoint: Int, maxLife: Int, weapon: Weapons) {
        super.init(name: name, lifePoint: lifePoint, maxLife: maxLife, weapon: weapon)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 75, maxLife: 75, weapon: Weapons(name: "Sharp axe", damage: 15, heal: 0))
    }
    
}
