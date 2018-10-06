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

    func createChararacters() {
        while (heroes.count != 3) {
            print("\nWhich class do you choose?"
                + "\n1. warrior [Life points: 100 | Damages: 10 points]"
                + "\n2. mage [Life points: 70 | Heal: 20 points]"
                + "\n3. coloss [Life points: 150 | Damages: 7 points]"
                + "\n4. dwarf [Life points: 75 | Damages: 15 points]"
                + "\n5. paladin [Life points: 100 | Damages: 10 points | Heal: 15 points]")
            let character = game.chooseTypeCharacter()
            if character != nil {
                heroes.append(character!)
            }
        }
    }

    var allNames = [String]()
    func isPlayerAlive() -> Int {
        var lifeheroes = 0
        for hero in heroes {
            lifeheroes += hero.lifePoint
        }
        if lifeheroes == 0 {
            return 1
        } else {
            return 0
        }
    }
    
    func displayCharacters() {
        var numberHero = 0
        for hero in heroes {
            print("\(numberHero + 1)) ", terminator:"")
            if (hero is Mage || hero is Paladin) {
                hero.displayName()
                hero.displayLifePoint()
                hero.displaymaxLife()
                if (hero is Mage) {
                    (hero as! Mage).displayHealpoint()
                } else {
                    hero.displayAttack()
                    (hero as! Paladin).displayHeal()
                }
                hero.displayTypeClass()
            }
            else {
                hero.displayName()
                hero.displayLifePoint()
                hero.displaymaxLife()
                hero.displayAttack()
                hero.displayTypeClass()
            }
            numberHero += 1
        }
    }
}
