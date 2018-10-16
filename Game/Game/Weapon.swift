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
    
    var name: String
    var damage: Int
    var heal: Int
    
    init(name: String, damage: Int, heal: Int) {
        self.name = name
        self.damage = damage
        self.heal = heal
    }
}
