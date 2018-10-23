//
//  Paladin.swift
//  Game
//
//  Created by BOUHADEB Yacoub on 25/09/2018.
//  Copyright © 2018 BOUHADEB Yacoub. All rights reserved.
//

import Foundation

//Paladin inherit of class Character, Paladin is an unique Character with unique specs
class Paladin: Character {
    
    // override of the function init of class Character
    override init (name: String, lifePoint: Int, maxLife: Int, weapon: Weapon, canHeal: Bool, canAttack: Bool) {
        super.init(name: name, lifePoint: lifePoint, maxLife: maxLife, weapon: weapon, canHeal: canHeal, canAttack: canAttack)
    }
    
    // We used convinience init to set property of object Paladin who is a Character
    convenience init(name: String) {
        self.init(name: name, lifePoint: 100, maxLife: 100, weapon: Weapon(name: "Sharp sword", damage: 15, heal: 10), canHeal: true, canAttack: true)
    }
    
    // override of the function doAction for the Warrior
    override func doActionOn(character: Character, isFriend: Bool) {
        if isFriend {
            self.characterToHeal(character: character)
        } else {
            self.chararacterToAttack(character: character)
        }
    }
}
