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
    
    // override of the function init of class Character
    override init (name: String, lifePoint: Int, maxLife: Int, weapon: Weapon, canHeal: Bool, canAttack: Bool) {
        super.init(name: name, lifePoint: lifePoint, maxLife: maxLife, weapon: weapon, canHeal: canHeal, canAttack: canAttack)
    }
    
    // We used convinience init to set property of object Warrior who is a Character
    convenience init(name: String) {
        self.init(name: name, lifePoint: 100, maxLife: 100, weapon: Weapon(name: "Sword of fury", damage: 15, heal: 0), canHeal: false, canAttack: true)
    }
    
    // override of the function doAction for the Warrior 
    override func doActionOn(character: Character, isFriend: Bool) {
        self.chararacterToAttack(character: character)
    }
}
