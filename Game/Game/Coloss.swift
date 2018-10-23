//
//  Coloss.swift
//  Game
//
//  Created by BOUHADEB Yacoub on 25/09/2018.
//  Copyright © 2018 BOUHADEB Yacoub. All rights reserved.
//

import Foundation

// Coloss inherit of class Character, Warrior is an unique Character with unique specs
class Coloss: Character {
    
    // override of the function init of class Character
    override init (name: String, lifePoint: Int, maxLife: Int, weapon: Weapon, canHeal: Bool, canAttack: Bool) {
        super.init(name: name, lifePoint: lifePoint, maxLife: maxLife, weapon: weapon, canHeal: canHeal, canAttack: canAttack)
    }
    
    // We used convinience init to set property of object Colosss who is a Character
    convenience init(name: String) {
        self.init(name: name, lifePoint: 150, maxLife: 150, weapon: Weapon(name: "Protective shield", damage: 10, heal: 0), canHeal: false, canAttack: true)
    }
    
    // override of the function doAction for the Coloss
    override func doActionOn(character: Character, isFriend: Bool) {
        self.chararacterToAttack(character: character)
    }
    
}
