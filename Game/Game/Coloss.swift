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
    
    override init (name: String, lifePoint: Int, maxLife: Int, weapon: Weapon) {
        super.init(name: name, lifePoint: lifePoint, maxLife: maxLife, weapon: weapon)
    }
    
    convenience init(name: String) {
        self.init(name: name, lifePoint: 150, maxLife: 150, weapon: Weapon(name: "Protective shield", damage: 10, heal: 0))
        canAttack = true
        canHeal = false
    }
    
    override func doActionOn(character: Character, isFriend: Bool) {
        self.chararacterToAttack(character: character)
    }
    
}
