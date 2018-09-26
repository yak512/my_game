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
    
    private func CharacterToAttack(choice: Int) {
        if game.players[game.pOneorTwo].heroes[choice].IsAlive == false {
            print("\n\n\n--->This ennemi character is dead, please choose another one<---\n")
        } else {
            self.attackChararacter(character: game.players[game.pOneorTwo].heroes[choice])
            self.canAttack = true
        }
    }
    
    private func chooseCharacterToAttack(character: Character) {
        game.changePlayer()
        print("Which ennemi character do you want to attack ?")
        character.canAttack = false
        while (character.canAttack != true) {
            if let choice = readLine() {
                switch choice {
                case "1":
                    CharacterToAttack(choice: 0)
                case "2":
                    CharacterToAttack(choice: 1)
                case "3":
                    CharacterToAttack(choice: 2)
                default:
                    print("--->Choose a valid ennemi to attack !<---")
                }
            }
        }
    }
    
    func action() {
        if self is Warrior {
           chooseCharacterToAttack(character: self)
        } else if self is Mage {
            print(chooseCharacterToHeal())
        } else if self is Coloss {
            chooseCharacterToAttack(character: self)
        } else if self is Dwarf {
            chooseCharacterToAttack(character: self)
        } else {
            print("What do you want to do ?\n 1. Heal\n 2. Attack")
            var a = false
            while (a != true) {
                if let choice = readLine() {
                    switch choice {
                    case "1":
                        print(chooseCharacterToHeal())
                        a = true
                    case "2":
                        chooseCharacterToAttack(character: self)
                        a = true
                    default:
                        print("--->Please choose between 1 Heal or 2 Attack<---")
                    }
                }
            }
        }
    }
    
    private func attackChararacter(character: Character) {
        let oldValue = character.lifePoint
        character.lifePoint = character.lifePoint - weapon.damage
        print("\n\n\n--->" + self.name + " attacked with \(weapon.damage) points, " + character.name + " lost \(weapon.damage) on \(oldValue) life points!<---\n")
        if character.lifePoint <= 0 {
            character.lifePoint = 0
            character.IsAlive = false
            print("--->" + character.name + " is dead..<--\n")
        }
    }
    
    private func characterToHeal(choice: Int) {
        if game.players[game.pOneorTwo].heroes[choice].lifePoint < game.players[game.pOneorTwo].heroes[choice].maxLife && game.players[game.pOneorTwo].heroes[choice].IsAlive == false {
                print("\n\n\n--->What are you trying to do do ?! You can't heal a dead character !<---\n")
        } else if (game.players[game.pOneorTwo].heroes[choice].lifePoint == game.players[game.pOneorTwo].heroes[choice].maxLife) {
                print("\n\n\n--->This character is full life !<---\n")
        } else if self is Mage {
            (self as! Mage).healChararacter(character: game.players[game.pOneorTwo].heroes[choice])
        } else {
            (self as! Paladin).healChar(character: game.players[game.pOneorTwo].heroes[choice])
        }
    }
    
    private func chooseCharacterToHeal() -> String {
        if game.players[game.pOneorTwo].heroes[0].lifePoint == game.players[game.pOneorTwo].heroes[0].maxLife && game.players[game.pOneorTwo].heroes[1].lifePoint == game.players[game.pOneorTwo].heroes[1].maxLife && game.players[game.pOneorTwo].heroes[2].lifePoint == game.players[game.pOneorTwo].heroes[2].maxLife {
            return ("\n\n\n--->All the characters are full life! You can't select a healer !<---\n")
        }
        var a = false
        while (a != true) {
            print("Which character do you want to heal ?")
            if let choice = readLine() {
                switch choice {
                case "1":
                    characterToHeal(choice: 0)
                    a = true
                case "2":
                    characterToHeal(choice: 1)
                    a = true
                case "3":
                    characterToHeal(choice: 2)
                    a = true
                default:
                    print("\n\n\n--->Choose a valid character to heal !<---\n")
                }
            }
        }
        game.changePlayer()
        return " Character Healed !<---\n"
    }
}




