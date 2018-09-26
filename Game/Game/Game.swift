//
//  Game.swift
//  Game
//
//  Created by BOUHADEB Yacoub on 25/09/2018.
//  Copyright © 2018 BOUHADEB Yacoub. All rights reserved.
//

import Foundation

extension String {
    func containsOnlyLetters() -> Bool {
        for chr in self {
            if !(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") {
                return false
            } else if (self == "") {
                return false
            }
        }
        return true
    }
}

//Class Game where we we have our players, porperties and methode for the game
class Game  {
    var players = [Player]()
    private var allNameCharacters = [String]()
    private var playerNames = [String]()
    var numberPlayer = 0
    private var numberRound = 0
    private var gameOver = false
    var pOneorTwo = 0
    
    // This function verify is a name is already use and call the function containsLetters() to verify if the character string is correct
    private func checkName(name: String, allNames: [String]) -> Bool {
        if allNames.contains(name) {
            print("This name is already used ! Choose another one.")
            return false
        }
        else if name.containsOnlyLetters() == false {
            print("Invalide characters ! Use characters a-z or A-Z")
            return false
        }
        return true
    }
    
    // This function tell you to choose a name and it return a correct name, a unique name
    private func chooseNameForCharacter(allCharactersNames: [String]) -> String {
        var a: Bool = false
        var CorrectName: String = ""
        print("Choose a name for your character")
        while (a != true ) {
            if let name = readLine() {
                a = checkName(name: (name.lowercased()), allNames: allCharactersNames)
                CorrectName = name
            }
        }
        return CorrectName
    }
    
    // This function is callse in fight to select a character of a player
    private func choosenCharacterForAction(choice: Int) {
        if players[game.pOneorTwo].heroes[choice].IsAlive != false {
            chest(character: players[pOneorTwo].heroes[choice])
            players[game.pOneorTwo].heroes[choice].action()
        } else {
            print("\n\n\n-->You can't choose " + players[pOneorTwo].heroes[choice].name + ", he is dead..<--\n" )
        }
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
            displayPlayers()
            print("[\(players[pOneorTwo].playerName)]" + " which character do you choose ? Choose between 1 and 3")
            game.numberRound += 1
            if let choice = readLine() {
                switch choice {
                case "1":
                    choosenCharacterForAction(choice: 0)
                case "2":
                    choosenCharacterForAction(choice: 1)
                case "3":
                    choosenCharacterForAction(choice: 2)
                default:
                    print("\n\n\n--->Please choose between 1 and 3 !<---\n")
                }
            }
            isGameOver()
        }
    }
    
    // In this function we creat the 3 characters of a player, he can choose between 5 different characters
    private func creatChararacters() {
        var i = 0
        while (i < 3) {
            print("\nWhich class do you choose?"
                + "\n1. warrior [Life points: 100 | Damages: 10 points]"
                + "\n2. mage [Life points: 70 | Heal: 20 points]"
                + "\n3. coloss [Life points: 150 | Damages: 7 points]"
                + "\n4. dwarf [Life points: 75 | Damages: 15 points]"
                + "\n5. paladin [Life points: 100 | Damages: 10 points | Heal: 15 points]")
            if let choice = readLine()  {
                switch choice {
                case "1", "warrior":
                    let newCharacter = Warrior(name:(chooseNameForCharacter(allCharactersNames: allNameCharacters)))
                    players[numberPlayer].heroes.append(newCharacter)
                    allNameCharacters.append(players[numberPlayer].heroes[i].name.lowercased())
                    i += 1
                case "2", "mage":
                    let newCharacter = Mage(name:(chooseNameForCharacter(allCharactersNames: allNameCharacters)))
                    players[numberPlayer].heroes.append(newCharacter)
                    allNameCharacters.append(players[numberPlayer].heroes[i].name.lowercased())
                    i += 1
                case "3", "coloss":
                    let newCharacter = Coloss(name:(chooseNameForCharacter(allCharactersNames: allNameCharacters)))
                    players[numberPlayer].heroes.append(newCharacter)
                    allNameCharacters.append(players[numberPlayer].heroes[i].name.lowercased())
                case "4", "dwarf":
                    let newCharacter = Dwarf(name:(chooseNameForCharacter(allCharactersNames: allNameCharacters)))
                    players[numberPlayer].heroes.append(newCharacter)
                    allNameCharacters.append(players[numberPlayer].heroes[i].name.lowercased())
                    i += 1
                case "5", "paladin":
                    let newCharacter = Paladin(name:(chooseNameForCharacter(allCharactersNames: allNameCharacters)))
                    players[numberPlayer].heroes.append(newCharacter)
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
            if  players[i].isPlayerAlive() == 1 {
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
     func changePlayer() {
        if self.pOneorTwo == 0 {
            self.pOneorTwo = 1
        } else {
            self.pOneorTwo = 0
        }
    }
    
    // This function displayer all the characters of the players
    private func displayPlayers() {
        for i in 0 ..< 2 {
            print("[\(players[i].playerName)]\n")
            players[i].displayCharacters()
            print("\n")
        }
    }
    
    // This function creat a new object for one character the object weapon, every characters have a chance to find a chest
    private func chest(character: Character) {
        let randomNbr =  Int(arc4random_uniform(10))
        
        if randomNbr == 1 && character.chest == false {
            if character is Warrior {
                let newWeapon = Weapon(name: "Destructive sword", damage: 20, heal: 0)
                print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", damage increase by 10 points !")
                character.weapon = newWeapon
                character.chest = true
            } else if character is Mage {
                let newWeapon = Weapon(name: "Magic stick", damage: 0, heal: 25)
                print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", heal increase by 10 points !")
                character.weapon = newWeapon
                character.chest = true
            } else if character is Coloss {
                let newWeapon = Weapon(name: "Heavy sword", damage: 15, heal: 0)
                print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", damage increase by 8 points !")
                character.weapon = newWeapon
                character.chest = true
            } else if character is Dwarf {
                let newWeapon = Weapon(name: "Destructive Axe", damage: 25, heal: 0)
                print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", damage increase by 10 points !")
                character.weapon = newWeapon
                character.chest = true
            } else {
                let nb = Int(arc4random_uniform(2))
                if  nb == 1 {
                    let newWeapon = Weapon(name: "Magic shield", damage: 10, heal: 25)
                    print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", heal increase by 10 points !")
                    character.weapon = newWeapon
                    character.chest = true
                } else {
                    let newWeapon = Weapon(name: "Magic sword", damage: 20, heal: 15)
                    print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", damage increase by 10 points !")
                    character.weapon = newWeapon
                    character.chest = true
                }
            }
        }
    }
    
    // This function creat the players and their characters
    private func creatTeams()  {
        for i in 0..<2 {
            players.append(Player())
            print("\n\nPlayer\(i + 1) what's your name ?")
            var a = false
            while (a != true) {
                if let name = readLine() {
                    numberPlayer = i
                    if checkName(name: name.lowercased(), allNames: playerNames) == true {
                        players[i].playerName = name
                        playerNames.append(players[i].playerName.lowercased())
                        a = true
                    }
                }
                creatChararacters()
            }
        }
    }
        
    // This function start the game
        func start() {
            print("Each player is going to enter his name and choose 3 characters and the game will start !")
            creatTeams()
            fight()
        }
}
