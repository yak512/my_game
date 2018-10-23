//
//  Weapon.swift
//  Game
//
//  Created by BOUHADEB Yacoub on 25/09/2018.
//  Copyright © 2018 BOUHADEB Yacoub. All rights reserved.
//

import Foundation

// The class Weapons allow use to creat the object Weapon for our characters
class Weapon {
    
    var name: String // Name of the weapon
    var damage: Int // Number of damages
    var heal: Int // Number of heal points
    
    // Inisializaton of the object Weapon
    init(name: String, damage: Int, heal: Int) {
        self.name = name
        self.damage = damage
        self.heal = heal
    }
}
