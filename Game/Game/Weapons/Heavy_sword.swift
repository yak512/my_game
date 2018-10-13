//
//  Heavy sword.swift
//  Game
//
//  Created by BOUHADEB Yacoub on 06/10/2018.
//  Copyright © 2018 BOUHADEB Yacoub. All rights reserved.
//

import Foundation

class HeavySword : Weapon {
    override init (name: String, damage: Int, heal: Int) {
        super.init(name: name, damage: damage, heal: heal)
    }
    convenience init() {
        self.init(name: "Heavy sword" , damage: 15, heal: 0)
    }
}

