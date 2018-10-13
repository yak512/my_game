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
    
    override init (name: String, lifePoint: Int, maxLife: Int, weapon: Weapon) {
        super.init(name: name, lifePoint: lifePoint, maxLife: maxLife, weapon: weapon)
    }
    
    convenience init(name: String) {
        self.init(name: name, lifePoint: 100, maxLife: 100, weapon: Weapon(name: "Sharp sword", damage: 10, heal: 15))
        canAttack = true
        canHeal = true
    }
    
    func displayHeal() {
        print("Healing points: \(weapon.heal) | " , terminator:"")
    }
    
    override func doActionOn(character: Character, isFriend: Bool) {
        if isFriend {
            self.characterToHeal(character: character)
        } else {
            self.chararacterToAttack(character: character)
        }
    }
}
