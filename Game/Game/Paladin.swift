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
    
    func characterToHeal(character: Character) {
        if (character.lifePoint == character.maxLife) {
            print("\n\n\n--->This character is full life !<---\n")
            game.changePlayer()
            game.numberRound -= 1
        } else if (character.lifePoint != character.maxLife) {
            let oldValue = character.lifePoint
            character.lifePoint = character.lifePoint + weapon.heal
            if (character.lifePoint > character.maxLife) {
                print("\n\n\n--->" + character.name + " received \(character.maxLife - oldValue) heal points on \(character.maxLife) life points !")
            } else {
                print("\n\n\n--->" + character.name + " received \(weapon.heal) heal points on \(character.maxLife) life points !")
            }
            if (character.lifePoint > character.maxLife) {
                character.lifePoint = character.maxLife
            }
        }
    }
    
    func paladinHealOrAttack() -> Bool {
        print("What do you want to do ?\n 1. Heal\n 2. Attack")
        var chooseAction = false
        while (chooseAction != true) {
            if let choice = readLine() {
                switch choice {
                case "1":
                    chooseAction = true
                    return true
                case "2":
                    chooseAction = true
                    return false
                default:
                    print("--->Please choose between 1 Heal or 2 Attack<---")
                }
            }
        }
    }
}
