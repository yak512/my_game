//
//  Game.swift
//  Game
//
//  Created by BOUHADEB Yacoub on 25/09/2018.
//  Copyright © 2018 BOUHADEB Yacoub. All rights reserved.
//

import Foundation
//Class Game where we we have our players, porperties and methode for the game
class Game  {
    private var players = [Player]()
    private var allNameCharacters = [String]()
    private var playerNames = [String]()
    private var numberPlayer = 0
    private var numberRound = 0
    private var gameOver = false
    private var pOneorTwo = 0
    
    // This function verifiy if the character string is correct
    private func containsOnlyLetters(input: String) -> Bool {
        for chr in input {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z")) {
                return false
            } else if (input == "") {
                return false
            }
        }
        return true
    }
    
    // This function verify is a name is already use and call the function containsLetters() to verify is the character string is correct
    private func checkName(name: String, allNaChar: [String]) -> Bool {
        if allNaChar.contains(name) {
            print("This name is already used ! Choose another one.")
            return false
        }
        else if(containsOnlyLetters(input: name) == false ) {
            print("Invalide characters ! Use characters a-z or A-Z")
            return false
        }
        return true
    }
    
    // This function tell you to choose a name and it return a correct name, a unique name
    private func charName(allNaChar: [String]) -> String {
        var a: Bool = false
        var n: String = ""
        print("Choose a name for your character")
        while (a != true ) {
            if let name = readLine() {
                a = checkName(name: (name.lowercased()), allNaChar: allNaChar)
                n = name
            }
        }
        return n
    }
    
    // In this function  the character choose a character to do an action
    private func fight() {
        print("GAME begins in 3 seconds BE READY !!")
        sleep(1)
        for i in 0..<3 {
            print(i + 1)
            sleep(1)
        }
        print("\n")
        while (gameOver != true) {
            displayPlayer()
            print("[\(players[pOneorTwo].playerName)]" + " which character do you choose ?")
            game.numberRound += 1
            if let choice = readLine() {
                switch choice {
                case players[pOneorTwo].heroes[0].name:
                    if (players[game.pOneorTwo].heroes[0].IsAlive != false) {
                        chest(character: players[pOneorTwo].heroes[0])
                        action(character: players[pOneorTwo].heroes[0])
                    } else {
                        print("\n\n\n-->You can't choose " + players[pOneorTwo].heroes[0].name + ", he is dead..<--\n" )
                    }
                case  players[pOneorTwo].heroes[1].name:
                    if (players[pOneorTwo].heroes[1].IsAlive != false) {
                        chest(character: players[pOneorTwo].heroes[1])
                        action(character: players[pOneorTwo].heroes[1])
                    } else {
                        print("\n\n\n-->You can't choose " + players[pOneorTwo].heroes[0].name + ", he is dead..<--\n" )
                    }
                case players[pOneorTwo].heroes[2].name:
                    if (players[pOneorTwo].heroes[2].IsAlive != false) {
                        chest(character: players[pOneorTwo].heroes[2])
                        action(character: players[pOneorTwo].heroes[2])
                    } else {
                        print("\n\n\n-->You can't choose " + players[pOneorTwo].heroes[0].name + ", he is dead..<--\n" )
                    }
                default:
                    print("\n\n\n--->Please choose a correct name from your characters<---\n")
                }
            }
            isGameOver()
        }
    }
    
    // In this function when the player choose a character we verify what this character can do according to his type (warrioe, mage..)
    private func action(character: Character) {
        if character is Warrior {
            attack(character: character)
        } else if character is Mage {
            print(heal(character: character))
        } else if character is Coloss {
            attack(character: character)
        } else if character is Dwarf {
            attack(character: character)
        } else {
            print("What do you want to do ?\n 1. Heal\n 2. Attack")
            var a = false
            while (a != true) {
                if let choice = readLine() {
                    switch choice {
                    case "1":
                        print(heal(character: character))
                        a = true
                    case "2":
                        attack(character: character)
                        a = true
                    default:
                        print("--->Please choose between 1 Heal or 2 Attack<---")
                    }
                }
            }
        }
    }
    
    // This function is called in function action(), it  used by the mage and the paladin to heal an allied character
    private func heal(character: Character) -> String {
        if (players[pOneorTwo].heroes[0].lifePoint == players[pOneorTwo].heroes[0].maxLife && players[pOneorTwo].heroes[1].lifePoint == players[pOneorTwo].heroes[1].maxLife) && players[pOneorTwo].heroes[2].lifePoint == players[pOneorTwo].heroes[2].maxLife {
            return ("\n\n\n--->All the characters are full life! You can't select a healer !<---\n")
        }
        print("Which character do you want to heal ?")
        if let choice = readLine() {
            switch choice {
            case players[pOneorTwo].heroes[0].name:
                if (players[pOneorTwo].heroes[0].lifePoint < players[pOneorTwo].heroes[0].maxLife && players[pOneorTwo].heroes[0].IsAlive == false) {
                    return ("\n\n\n--->What are you trying to do do ?! You can't heal a dead character !<---\n")
                } else if (players[pOneorTwo].heroes[0].lifePoint == players[pOneorTwo].heroes[0].maxLife) {
                    return ("\n\n\n--->This character is full life !<---\n")
                } else if (character is Mage) {
                    (character as! Mage).healChararacter(character: players[pOneorTwo].heroes[0])
                } else {
                    (character as! Paladin).healChar(character: players[pOneorTwo].heroes[0])
                }
            case players[pOneorTwo].heroes[1].name:
                if (players[pOneorTwo].heroes[1].lifePoint < players[game.pOneorTwo].heroes[1].maxLife && game.players[pOneorTwo].heroes[1].IsAlive == false) {
                    return ("\n\n\n--->What are you trying to do do ?! You can't heal a dead character !<---\n")
                } else if (game.players[pOneorTwo].heroes[1].lifePoint == game.players[pOneorTwo].heroes[1].maxLife) {
                    return ("\n\n\n--->This character is full life !<---\n")
                } else if (character is Mage) {
                    (character as! Mage).healChararacter(character: players[pOneorTwo].heroes[1])
                }
                else {
                    (character as! Paladin).healChar(character: players[pOneorTwo].heroes[1])
                }
            case players[pOneorTwo].heroes[2].name:
                if (players[pOneorTwo].heroes[2].lifePoint < players[game.pOneorTwo].heroes[2].maxLife && game.players[pOneorTwo].heroes[2].IsAlive == false) {
                    return ("\n\n\n--->What are you trying to do do ?! You can't heal a dead character !<---\n")
                } else if (game.players[pOneorTwo].heroes[2].lifePoint == game.players[pOneorTwo].heroes[2].maxLife) {
                    return ("\n\n\n--->This character is full life !<---\n")
                } else if (character is Mage) {
                    (character as! Mage).healChararacter(character: players[pOneorTwo].heroes[2])
                }
                else {
                    (character as! Paladin).healChar(character: players[pOneorTwo].heroes[2])
                }
            default:
                print("\n\n\n--->Choose a valid character to heal !<---\n")
            }
        }
        whoplay()
        return " Character Healed !<---\n"
    }
    
    // This function is called in the function action, it used to attack an enemy character
    private func attack(character: Character) {
        whoplay()
        print("Which ennemi character do you want to attack ?")
        character.canAttack = false
        while (character.canAttack != true) {
            if let choice = readLine() {
                switch choice {
                case players[pOneorTwo].heroes[0].name:
                    if (players[pOneorTwo].heroes[0].IsAlive == false) {
                        print("\n\n\n--->This ennemi character is dead, please choose another one<---\n")
                    } else {
                        character.attackChar(character: players[pOneorTwo].heroes[0])
                        character.canAttack = true
                    }
                case players[pOneorTwo].heroes[1].name:
                    if (players[pOneorTwo].heroes[1].IsAlive == false) {
                        print("\n\n\n--->This ennemi character is dead, please choose another one<---\n")
                    } else {
                        character.attackChar(character: players[pOneorTwo].heroes[1])
                        character.canAttack = true
                    }
                case players[pOneorTwo].heroes[2].name:
                    if (players[pOneorTwo].heroes[2].IsAlive == false) {
                        print("\n\n\n--->This ennemi character is dead, please choose another one<---\n")
                    } else {
                        character.attackChar(character: game.players[game.pOneorTwo].heroes[2])
                        character.canAttack = true
                    }
                default:
                    print("--->Choose a valid ennemi to attack !<---")
                }
            }
        }
    }
    
    // In this function we creat the 3 characters of a player, he can choose between 5 different characters
    private func creatChar() {
        
        var i = 0
        while(i < 3) {
            print("\nWhich class do you choose?"
                + "\n1. warrior [Life points: 100 | Damages: 10 points]"
                + "\n2. mage [Life points: 70 | Heal: 20 points]"
                + "\n3. coloss [Life points: 150 | Damages: 7 points]"
                + "\n4. dwarf [Life points: 75 | Damages: 15 points]"
                + "\n5. paladin [Life points: 100 | Damages: 10 points | Heal: 15 points]")
            if let choice = readLine()  {
                
                switch choice {
                case "1", "warrior":
                    players[numberPlayer].heroes.append(Warrior(name:(charName(allNaChar: allNameCharacters))))
                    allNameCharacters.append(players[numberPlayer].heroes[i].name.lowercased())
                    i += 1
                case "2", "mage":
                    players[numberPlayer].heroes.append(Mage(name:(charName(allNaChar: allNameCharacters))))
                    allNameCharacters.append(players[numberPlayer].heroes[i].name.lowercased())
                    i += 1
                case "3", "coloss":
                    players[numberPlayer].heroes.append(Coloss(name:(charName(allNaChar: allNameCharacters))))
                    allNameCharacters.append(players[numberPlayer].heroes[i].name.lowercased())
                    i += 1
                case "4", "dwarf":
                    players[numberPlayer].heroes.append(Dwarf(name:(charName(allNaChar: allNameCharacters))))
                    allNameCharacters.append(players[numberPlayer].heroes[i].name.lowercased())
                    i += 1
                case "5", "paladin":
                    players[numberPlayer].heroes.append(Paladin(name:(charName(allNaChar: allNameCharacters))))
                    allNameCharacters.append(players[numberPlayer].heroes[i].name.lowercased())
                    i += 1
                default:
                    print("\n\n\n--->Invalid choice.. make a choice force exemple by typing 1 to take warrior or typing warrior to take a warrior <---\n")
                }
            }
        }
    }
    
    // This function verify is a player is alive, so it can tell if the game is over our not
    private func isGameOver() {
        
        for i in 0..<2 {
            if (players[i].isPlayerAlive() == 1) {
                print("[" + players[i].playerName + "]" + ", all of your characters are dead..")
                print("[" + players[i == 0 ? 1 : 0].playerName + "]" + " Win this game congratulations !")
                print("Number of round played: \(numberRound)")
                gameOver = true
            }
        }
        if (gameOver) {
            print("Thank you for playing, see you soon ! :D")
        }
    }
    
    // This function tell us which player should play
    private func whoplay() {
        if (self.pOneorTwo == 0) {
            self.pOneorTwo = 1
        } else {
            self.pOneorTwo = 0
        }
    }
    
    // This function displayer all the characters of one player
    private func displayPlayer() {
        for i in 0 ..< 2 {
            print("[\(players[i].playerName)]\n")
            players[i].displayChar()
            print("\n")
        }
    }
    
    // This function creat a new object for one character the object weapon, every characters have a chance to find a chest
    private func chest(character: Character) {
        let randomNbr =  Int(arc4random_uniform(10))
        
        if (randomNbr == 1 && character.chest == false) {
            if character is Warrior {
                let newWeapon = Weapons(name: "Destructive sword", damage: 20, heal: 0)
                print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", damage increase by 10 points !")
                character.weapon = newWeapon
                character.chest = true
            } else if character is Mage {
                let newWeapon = Weapons(name: "Magic stick", damage: 0, heal: 25)
                print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", heal increase by 10 points !")
                character.weapon = newWeapon
                character.chest = true
            } else if character is Coloss {
                let newWeapon = Weapons(name: "Heavy sword", damage: 15, heal: 0)
                print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", damage increase by 8 points !")
                character.weapon = newWeapon
                character.chest = true
            } else if character is Dwarf {
                let newWeapon = Weapons(name: "Destructive Axe", damage: 25, heal: 0)
                print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", damage increase by 10 points !")
                character.weapon = newWeapon
                character.chest = true
            } else {
                let nb = Int(arc4random_uniform(2))
                if (nb == 1) {
                    let newWeapon = Weapons(name: "Magic shield", damage: 10, heal: 25)
                    print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", heal increase by 10 points !")
                    character.weapon = newWeapon
                    character.chest = true
                } else {
                    let newWeapon = Weapons(name: "Magic sword", damage: 20, heal: 15)
                    print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", damage increase by 10 points !")
                    character.weapon = newWeapon
                    character.chest = true
                }
            }
        }
    }
    
    // This function start the game, and ask the name of the players
    func start() {
        
        print("Each player is going to enter his name and choose 3 characters and the game will start !")
        for i in 0..<2 {
            players.append(Player())
            print("\n\nPlayer\(i + 1) what's your name ?")
            var a = false
            while (a != true) {
                if let name = readLine() {
                    numberPlayer = i
                    if ((checkName(name: name.lowercased(), allNaChar: playerNames)) == true) {
                        players[i].playerName = name
                        playerNames.append(players[i].playerName.lowercased())
                        a = true
                    }
                }
                creatChar()
            }
        }
        fight()
    }
}
