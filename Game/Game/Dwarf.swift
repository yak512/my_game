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
    
    // override of the function init of class Character
    override init (name: String, lifePoint: Int, maxLife: Int, weapon: Weapon, canHeal: Bool, canAttack: Bool) {
        super.init(name: name, lifePoint: lifePoint, maxLife: maxLife, weapon: weapon, canHeal: canHeal, canAttack: canAttack)
    }
    
    // We used convinience init to set property of object Dwarf who is a Character
    convenience init(name: String) {
        self.init(name: name, lifePoint: 75, maxLife: 75, weapon: Weapon(name: "Sharp axe", damage: 20, heal: 0), canHeal: false, canAttack: true)
    }
    
    // override of the function doAction for the Dwarf
    override func doActionOn(character: Character, isFriend: Bool) {
        self.chararacterToAttack(character: character)
    }
}
