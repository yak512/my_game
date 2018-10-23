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
    
    var name: String // Name of a character
    
    var canAttack: Bool // Used to know if a character can attack or no
    
    var canHeal: Bool // Used to know if a character can heal or no
    
    var lifePoint: Int // life point of a chatacter
    
    var maxLife: Int // This is the maximum life point a character can have
    
    var chest = false // A character can only find one chest, used to know if the character already found a chest
    
    var weapon: Weapon { // Every character has a weapon, this is the weapon of character, he can found one in a chest
        didSet {
            chest = true
        }
    }
    
    ////////                        ///////
    ///////        METHODS          ///////
    ///////                         ///////
    
    
    
    // Initialization of the object character 
    init (name: String, lifePoint: Int, maxLife: Int, weapon: Weapon, canHeal: Bool, canAttack: Bool) {
        self.name = name
        self.lifePoint = lifePoint
        self.maxLife = maxLife
        self.weapon = weapon
        self.canHeal = canHeal
        self.canAttack = canAttack
    }
    
    // function used to display the name of a character
    func displayName() {
        print(self.name + " ", terminator:"")
    }
    
    // function used to display the life point of a character
    func displayLifePoint() {
        print("[Life point: \(lifePoint)" , terminator:"")
    }
    
    // function used to display the maximum life point of a character
    func displayMaxLife() {
        if lifePoint == 0 {
            print("/\(maxLife) 💔 | " , terminator:"")
        } else {
            print("/\(maxLife) ❤️ | " , terminator:"")
        }
    }
    
    // function used to display the weapon name of a character
    func displayWeapon() {
        print(" Weapon: \(weapon.name) | ", terminator:"" )
    }
    
    // function used to display the damage number of a character weapon
    func displayDamagePoint() {
        print("Damage points: \(weapon.damage) | " , terminator:"")
    }
    
    func displayHealpoint() {
        print("Healing points: \(weapon.heal) | " , terminator:"")
    }
    
    // function used to displayer the type of character
    func displayTypeClass() {
        
        if self is Warrior {
            print("Class: (Warrior) 🗡 ]")
        } else if self is Mage {
            print("Class: (Mage) 🌿 ]")
        } else if self is Coloss {
            print("Class: (Coloss) 🛡 ]")
        } else if self is Dwarf {
            print("Class: (Dwarf) ⚔️ ]")
        } else {
            print("Class: (Paladin) 📿🗡 ]")
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

