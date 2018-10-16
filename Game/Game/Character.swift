//
//  Character.swift
//  Game
//
//  Created by BOUHADEB Yacoub on 25/09/2018.
//  Copyright © 2018 BOUHADEB Yacoub. All rights reserved.
//

import Foundation

// This class can allow us to creat the object character, the class Warrior, Mage, Coloss, Dwarf and Paladin inherit of the class Character
class Character {
    
    var name: String
    var canAttack: Bool = false
    var canHeal: Bool = false
    var lifePoint: Int
    var maxLife: Int
    var chest = false
    
    var weapon: Weapon {
        didSet {
            chest = true
        }
    }
    
    init (name: String, lifePoint: Int, maxLife: Int, weapon: Weapon) {
        self.name = name
        self.lifePoint = lifePoint
        self.maxLife = maxLife
        self.weapon = weapon
    }
    
    func displayName() {
        print(self.name + " ", terminator:"")
    }
    
    func displayLifePoint() {
        print("[Life point: \(lifePoint)" , terminator:"")
    }
    
    func displayMaxLife() {
        print("/\(maxLife) ❤️ | " , terminator:"")
    }
    
    func displayWeapon() {
        print(" Weapon: \(weapon.name) | ", terminator:"" )
    }
    
    func displayAttack() {
        print("Damage points: \(weapon.damage) | " , terminator:"")
    }
    
    func displayTypeClass() {
        
        if self is Warrior {
            print("Class: (Warrior)] 🗡")
        } else if self is Mage {
            print("Class: (Mage)] 🌿")
        } else if self is Coloss {
            print("Class: (Coloss)]🛡")
        } else if self is Dwarf {
            print("Class: (Dwarf)] ⚔️")
        } else {
            print("Class: (Paladin)] 📿🗡")
        }
        
    }
    
    // This function is used by all the hereos (Warrior, Mage, Coloss, Dwarf and Paladin) to do an action
    func doActionOn(character: Character, isFriend: Bool) {
        self.chararacterToAttack(character: character)
    }
    
    // This function is used by the Warrior, Coloss, Dwarf and Paladin to attack an ennemy character
    func chararacterToAttack(character: Character) {
        
        if character.lifePoint == 0 {
            print("\n\n\n--->This ennemi character is dead, please choose another one<---\n")
        } else {
            let oldValue = character.lifePoint
            character.lifePoint = character.lifePoint - weapon.damage
            print("\n\n\n--->" + self.name + " attacked with \(weapon.damage) points, " + character.name + " lost \(weapon.damage) on \(oldValue) life points!<---\n")
            if character.lifePoint <= 0 {
                character.lifePoint = 0
                print("--->" + character.name + " is dead.. ☠︎ <--\n")
            }
        }
    }
    
    // This function is used by the Mage and Paladin to heal an ally character
    func characterToHeal(character: Character) {
        
        if (character.lifePoint == character.maxLife) {
            print("\n\n\n--->This character is full life !<---\n")
        } else if (character.lifePoint != character.maxLife) {
            let oldValue = character.lifePoint
            character.lifePoint = character.lifePoint + weapon.heal
            if (character.lifePoint > character.maxLife) {
                print("\n\n\n--->" + character.name + " received \(character.maxLife - oldValue) heal points on \(character.maxLife) life points !<---\n")
            } else {
                print("\n\n\n--->" + character.name + " received \(weapon.heal) heal points on \(character.maxLife) life points !<---\n")
            }
            if (character.lifePoint > character.maxLife) {
                character.lifePoint = character.maxLife
            }
        }
    }
    
    // This function verify is a correct character is choosed
    func correctCharacter() -> Bool {
        
        if lifePoint == 0 {
            print("\n\n\n--->This Character is dead, please choose another one<---\n")
            return false
        }
        return true
    }
}

