//
//  Destructive_axe.swift
//  Game
//
//  Created by BOUHADEB Yacoub on 06/10/2018.
//  Copyright © 2018 BOUHADEB Yacoub. All rights reserved.
//

import Foundation

// Weapon for Warrior
class DestructiveAxe : Weapon {
    
    // override of the function init of the class Weapon
    override init (name: String, damage: Int, heal: Int) {
        super.init(name: name, damage: damage, heal: heal)
    }
    
    // we used convinience init to set the property of the object Destructiveaxe which is a Weapon object
    convenience init() {
        self.init(name: "Destructive axe" , damage: 30, heal: 0)
    }
}

