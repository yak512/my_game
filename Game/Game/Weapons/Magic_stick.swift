//
//  Magic stick.swift
//  Game
//
//  Created by BOUHADEB Yacoub on 06/10/2018.
//  Copyright © 2018 BOUHADEB Yacoub. All rights reserved.
//

import Foundation

// Weapon for Mage
class MagicStick : Weapon {
    
    // override of the function init of the class Weapon
    override init (name: String, damage: Int, heal: Int) {
        super.init(name: name, damage: damage, heal: heal)
    }
    
    // we used convinience init to set the property of the object Magicstick which is a Weapon object
    convenience init() {
        self.init(name: "Magic stick" , damage: 0, heal: 25)
    }
}

