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
    var canAttack = false
    var lifePoint: Int
    var IsAlive = true
    var chest = false
    var weapon: Weapon
    var maxLife: Int
    
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
    
    func displaymaxLife() {
        print("/\(maxLife) | " , terminator:"")
    }
    
    func displayAttack() {
        print("Dammage points: \(weapon.damage) | " , terminator:"")
    }
    
    func displayTypeClass() {
        if self is Warrior {
            print("Class: (Warrior)]")
        } else if self is Mage {
            print("Class: (Mage)]")
        } else if self is Coloss {
            print("Class: (Coloss)]")
        } else if self is Dwarf {
            print("Class: (Dwarf)]")
        } else {
            print("Class: (Paladin)]")
        }
        
    }
    
    func chararacterToAttack(character: Character) {
        if character.IsAlive == false {
            print("\n\n\n--->This ennemi character is dead, please choose another one<---\n")
        } else {
            let oldValue = character.lifePoint
            character.lifePoint = character.lifePoint - weapon.damage
            print("\n\n\n--->" + self.name + " attacked with \(weapon.damage) points, " + character.name + " lost \(weapon.damage) on \(oldValue) life points!<---\n")
            if character.lifePoint <= 0 {
                character.lifePoint = 0
                character.IsAlive = false
                print("--->" + character.name + " is dead..<--\n")
            }
        }
    }
    
    func correctCharacter() -> Bool {
        if IsAlive == false {
            print("\n\n\n--->This Character is dead, please choose another one<---\n")
            return false
        } 
        return true
    }
}

