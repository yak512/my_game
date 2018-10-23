//
//  Mage.swift
//  Game
//
//  Created by BOUHADEB Yacoub on 25/09/2018.
//  Copyright © 2018 BOUHADEB Yacoub. All rights reserved.
//

import Foundation

// Mage inherit of class Character, Mage is an unique Character with unique specs
class Mage: Character {
    
    // override of the function init of class Character
    override init (name: String, lifePoint: Int, maxLife: Int, weapon: Weapon, canHeal: Bool, canAttack: Bool) {
        super.init(name: name, lifePoint: lifePoint, maxLife: maxLife, weapon: weapon, canHeal: canHeal, canAttack: canAttack)
    }
    
    // We used convinience init to set property of object Mage who is a Character
    convenience init(name: String) {
        self.init(name: name, lifePoint: 70, maxLife: 70, weapon: Weapon(name: "Magic wand", damage: 0, heal: 20), canHeal: true, canAttack: false)
    }
    
    // override of the function doAction for the Mage
    override func doActionOn(character: Character, isFriend: Bool) {
        self.characterToHeal(character: character)
    }
}

