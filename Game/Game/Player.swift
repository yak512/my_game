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
    
    var playerName = "" // property used to set a name for a player
    
    var heroes = [Character]() // property used to set the characters of a player
    
    
    ////////                        ///////
    ///////        METHODS          ///////
    ///////                         ///////
    
    
    // This function is used to create a character
    func createChararacters() {
        
        while (heroes.count != 3) {
            print("\nWhich class do you choose?"
                + "\n1. warrior 🗡 [Life points: 100 ❤️ | Damages: 15 points]"
                + "\n2. mage 🌿 [Life points: 70 ❤️ | Heal: 20 points]"
                + "\n3. coloss 🛡 [Life points: 150 ❤️ | Damages: 10 points]"
                + "\n4. dwarf ⚔️ [Life points: 75 ❤️ | Damages: 20 points]"
                + "\n5. paladin 📿🗡 [Life points: 100 ❤️ | Damages: 15 points | Heal: 10 points]")
            let character = game.chooseTypeCharacter()
            if character != nil {
                heroes.append(character!)
            }
        }
    }
    
    // This fucntion check if a player is alive or not
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
    
    // This function displayer all the characters and their statistics of player
    func displayCharacters() {
        
        var numberHero = 0
        for hero in heroes {
            print("\(numberHero + 1)) ", terminator:"")
            if (hero is Mage || hero is Paladin) {
                hero.displayName()
                hero.displayLifePoint()
                hero.displayMaxLife()
                hero.displayWeapon()
                if (hero is Mage) {
                    hero.displayHealpoint()
                } else {
                    hero.displayDamagePoint()
                    hero.displayHealpoint()
                }
                hero.displayTypeClass()
            }
            else {
                hero.displayName()
                hero.displayLifePoint()
                hero.displayMaxLife()
                hero.displayWeapon()
                hero.displayDamagePoint()
                hero.displayTypeClass()
            }
            numberHero += 1
        }
    }
}
