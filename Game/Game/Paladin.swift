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
    }
    func displayHeal() {
        print("Healing points: \(weapon.heal) | " , terminator:"")
    }
    func healChar(character: Character) {
        let oldValue = character.lifePoint
        if (character.lifePoint != character.maxLife) {
            character.lifePoint = character.lifePoint + weapon.heal
            if (character.lifePoint > character.maxLife) {
                print("\n\n\n--->" + character.name + " received \(character.maxLife - oldValue) heal points on \(character.maxLife) life points !", terminator:"")
            } else {
                print("\n\n\n--->" + character.name + " received \(weapon.heal) heal points on \(character.maxLife) life points !", terminator:"")
            }
            if (character.lifePoint > character.maxLife) {
                character.lifePoint = character.maxLife
            }
        }
    }
    
}
