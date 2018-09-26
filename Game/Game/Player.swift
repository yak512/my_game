//
//  Player.swift
//  Game
//
//  Created by BOUHADEB Yacoub on 25/09/2018.
//  Copyright © 2018 BOUHADEB Yacoub. All rights reserved.
//

import Foundation

// This class creat the object player this class allow us to have Character for players, name of characters and other prorities
class Player {
    var playerName = ""
    var heroes = [Character]()
    var allNames = [String]()
    
    func isPlayerAlive() -> Int {
        var lifeheroes = 0
        for a in 0..<3 {
            lifeheroes += heroes[a].lifePoint
        }
        if lifeheroes == 0 {
            return 1
        } else {
            return 0
        }
    }
    
    func displayCharacters() {
        for b in 0 ..< 3 {
            if (heroes[b] is Mage || heroes[b] is Paladin) {
                heroes[b].displayName()
                heroes[b].displayLifePoint()
                heroes[b].displaymaxLife()
                if (heroes[b] is Mage) {
                    (heroes[b] as! Mage).displayHealpoint()
                } else {
                    heroes[b].displayAttack()
                    (heroes[b] as! Paladin).displayHeal()
                }
                heroes[b].displayTypeClass()
            }
            else {
                heroes[b].displayName()
                heroes[b].displayLifePoint()
                heroes[b].displaymaxLife()
                heroes[b].displayAttack()
                heroes[b].displayTypeClass()
            }
        }
    }
}
