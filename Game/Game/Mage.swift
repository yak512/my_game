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
    
    override init (name: String, lifePoint: Int, maxLife: Int, weapon: Weapon) {
        super.init(name: name, lifePoint: lifePoint, maxLife: maxLife, weapon: weapon)
    }
    
    convenience init(name: String) {
        self.init(name: name, lifePoint: 70, maxLife: 70, weapon: Weapon(name: "Magic wand", damage: 0, heal: 20))
        canAttack = false
        canHeal = true
    }
    
    func displayHealpoint() {
        print("Healing points: \(weapon.heal) | " , terminator:"")
    }
    
    override func doActionOn(character: Character, isFriend: Bool) {
        self.characterToHeal(character: character)
    }
}

