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
            }
        }
        return true
    }
}

//Class Game where we we have our players, porperties and methode for the game
class Game  {
    var players = [Player]()
    private var playerNames: [String] {
        var names = [String]()
        for player in players {
            names.append(player.playerName)
        }
        return names
    }
    var namesOfCharacters: [String] {
        var names = [String]()
        for player in players {
            for hero in player.heroes {
                names.append(hero.name)
            }
        }
        return names
    }
    var numberRound = 0
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
    func chooseName(allNames: [String]) -> String {
        var correctName: String = ""
        print("Choose a name")
        while (correctName.isEmpty) {
            if let name = readLine() {
                if checkName(name: (name.lowercased()), allNames: allNames) {
                    correctName = name
                }
            }
        }
        return correctName
    }
    
    func chooseTypeCharacter() -> Character? {
        if let choice = readLine()  {
            switch choice {
            case "1", "warrior":
                return(Warrior(name:(chooseName(allNames: namesOfCharacters))))
            case "2", "mage":
                return(Mage(name:(chooseName(allNames: namesOfCharacters))))
            case "3", "coloss":
                return(Coloss(name:(chooseName(allNames: namesOfCharacters))))
            case "4", "dwarf":
                return(Dwarf(name:(chooseName(allNames: namesOfCharacters))))
            case "5", "paladin":
                return(Paladin(name:(chooseName(allNames: namesOfCharacters))))
            default:
                print("\n\n\n--->Invalid choice.. make a choice force exemple by typing 1 to take warrior or typing warrior to take a warrior <---\n")
            }
        }
        return nil
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
            numberRound += 1
            let currentPlayerHeroes = players[pOneorTwo].heroes
            let playerDontPlayHeores = players[(pOneorTwo + 1) % 2].heroes
            let currentPlayerCharacter = choosenCharacterForAction(currentPlayerHeroes)
            chest(character: currentPlayerCharacter!)
            if currentPlayerCharacter is Paladin {
                (currentPlayerCharacter as! Paladin).paladinHealOrAttack() }
            if currentPlayerCharacter is Mage || (currentPlayerCharacter is Paladin && (currentPlayerCharacter as! Paladin).paladinAction == true ){
                if currentPlayerCharacter is Mage {
                    print("Which character do you want to heal ?")
                    let characterToHeal = choosenCharacterForAction(currentPlayerHeroes)
                    (currentPlayerCharacter as! Mage).healChararacter(character: characterToHeal!)
                }
                else {
                    print("Which character do you want to heal ?")
                    let characterToHeal = choosenCharacterForAction(currentPlayerHeroes)
                    (currentPlayerCharacter as! Paladin).healChararacter(character: characterToHeal!)
                }
            } else {
                print("Which character do you want to attack ?")
                let characterToAttack = choosenCharacterForAction(playerDontPlayHeores)
                currentPlayerCharacter!.attackChararacter(character: characterToAttack!)
            }
            changePlayer()
            isGameOver()
        }
        
    }
    
    private func choosenCharacterForAction( _ playerHeroes: [Character]) -> Character? {
        var chooseHero = false
        while (chooseHero != true) {
            if let choice = readLine() {
                switch choice {
                case "1":
                    chooseHero = playerHeroes[0].correctCharacter()
                    if chooseHero == true {
                    return playerHeroes[0]
                    }
                case "2":
                    chooseHero = playerHeroes[1].correctCharacter()
                    if chooseHero == true {
                    return playerHeroes[1]
                    }
                case "3":
                    chooseHero = playerHeroes[2].correctCharacter()
                    if chooseHero == true {
                    return playerHeroes[2]
                    }
                default:
                    print("\n\n\n--->Please choose between 1 and 3 !<---\n")
                }
            }
        }
        return nil
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
        for player in players {
            print("[\(player.playerName)]\n")
            player.displayCharacters()
            print("\n")
        }
    }
    
    // This function creat a new object for one character the object weapon, every characters have a chance to find a chest
    private func chest(character: Character) {
        let randomNbr =  Int(arc4random_uniform(10))
        
        if randomNbr == 1 && character.chest == false {
            if character is Warrior {
                let newWeapon = Destructivesword()
                print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", damage increase by 10 points !")
                character.weapon = newWeapon
                character.chest = true
            } else if character is Mage {
                let newWeapon = Magicstick()
                print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", heal increase by 10 points !")
                character.weapon = newWeapon
                character.chest = true
            } else if character is Coloss {
                let newWeapon = Heavysword()
                print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", damage increase by 8 points !")
                character.weapon = newWeapon
                character.chest = true
            } else if character is Dwarf {
                let newWeapon = Destructiveaxe()
                print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", damage increase by 10 points !")
                character.weapon = newWeapon
                character.chest = true
            } else {
                let nb = Int(arc4random_uniform(2))
                if  nb == 1 {
                    let newWeapon = Magicshield()
                    print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", heal increase by 10 points !")
                    character.weapon = newWeapon
                    character.chest = true
                } else {
                    let newWeapon = Magicsword()
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
            let player = Player()
            print("\n\nPlayer\(i + 1) ", terminator:"")
            player.playerName = chooseName(allNames: playerNames)
            players.append(player)
            player.createChararacters()
        }
    }
    
    // This function start the game
    func start() {
        print("Each player is going to enter his name and choose 3 characters and the game will start !")
        creatTeams()
        fight()
    }
}
