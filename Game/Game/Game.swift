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
    var playerOneOrTwo = 0
    
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
    private func chooseHealOrAttack() -> Bool {
        print("Do you wanto heal or Attack ?\n 1 heal \n 2 attack")
        var healOrAttack: Bool?
        
        while (healOrAttack == nil) {
            if let choose = readLine() {
                switch choose {
                case "1", "heal":
                    healOrAttack = true
                case "2", "attack":
                    healOrAttack = false
                default:
                    print("Please choose 1 or 2, you can also write heal to heal and attack to attack")
                }
            }
        }
        return healOrAttack!
    }
    
    private func gameStartTimer() {
        print("GAME begins in 3 seconds BE READY !!")
        sleep(1)
        for i in 0..<3 {
            print(i + 1)
            sleep(1)
        }
        print("\n")
    }
    
    private func chooseCharacter() ->([Character], [Character], Character) {
        
        print("[\(players[playerOneOrTwo].playerName)]" + " which character do you choose ? Choose between 1 and 3")
        let currentPlayerHeroes = players[playerOneOrTwo].heroes
        let playerDontPlayHeores = players[(playerOneOrTwo + 1) % 2].heroes
        let currentPlayerCharacter = choosenCharacterForAction(currentPlayerHeroes)
        
        return (currentPlayerHeroes, playerDontPlayHeores, currentPlayerCharacter)
    }
    
    // In this function  the character choose a character to do an action
    private func fight() {
        
        gameStartTimer()
        
        while (gameOver != true) {
            displayPlayers()
            
            numberRound += 1
            
            let (currentPlayerHeroes, playerDontPlayHeores, currentPlayerCharacter) = chooseCharacter()
            
            chest(character: currentPlayerCharacter)
            
            if currentPlayerCharacter.canHeal && !currentPlayerCharacter.canAttack {
                print("Which character do you want to heal ?")
                let characterToHeal = choosenCharacterForAction(currentPlayerHeroes)
                currentPlayerCharacter.doActionOn(character: characterToHeal, isFriend: true)
                
            } else if !currentPlayerCharacter.canHeal && currentPlayerCharacter.canAttack {
                print("Which character do you want to attack ?")
                let characterToAttack = choosenCharacterForAction(playerDontPlayHeores)
                currentPlayerCharacter.doActionOn(character: characterToAttack, isFriend: false)
            } else {
                if chooseHealOrAttack() {
                    print("Which character do you want to heal ?")
                    let characterToHeal = choosenCharacterForAction(currentPlayerHeroes)
                    currentPlayerCharacter.doActionOn(character: characterToHeal, isFriend: true)
                } else {
                    print("Which character do you want to attack ?")
                    let characterToAttack = choosenCharacterForAction(playerDontPlayHeores)
                    currentPlayerCharacter.doActionOn(character: characterToAttack, isFriend: false)
                }
            }
            changePlayer()
            isGameOver()
        }
    }
    
    private func choosenCharacterForAction(_ playerHeroes: [Character]) -> Character {
        while (true) {
            if let choice = readLine() {
                switch choice {
                case "1":
                    if playerHeroes[0].correctCharacter() {
                        return playerHeroes[0]
                    }
                case "2":
                    if playerHeroes[1].correctCharacter() {
                        return playerHeroes[1]
                    }
                case "3":
                    if playerHeroes[2].correctCharacter() {
                        return playerHeroes[2]
                    }
                default:
                    print("\n\n\n--->Please choose between 1 and 3 !<---\n")
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
        playerOneOrTwo = playerOneOrTwo == 0 ? 1 : 0
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
        let randomNbr =  Int(arc4random_uniform(2))
        
        let oldWeapon = character.weapon
        var paladinShieldOrSword = false
        if randomNbr == 1 && character.chest == false {
            if character is Warrior {
                character.weapon = Destructivesword()
            } else if character is Mage {
                character.weapon = MagicStick()
            } else if character is Coloss {
                character.weapon = HeavySword()
            } else if character is Dwarf {
                character.weapon = DestructiveAxe()
            } else {
                let nb = Int(arc4random_uniform(2))
                if  nb == 1 {
                    character.weapon = MagicShield()
                    print(character.name + " found a chest, he replace his " + oldWeapon.name + " by a " + character.weapon.name + ", heal increase by 10 points !")
                    paladinShieldOrSword = true
                } else {
                    character.weapon = MagicSword()
                    // print(character.name + " found a chest, he replace his " + character.weapon.name + " by a " + newWeapon.name + ", damage increase by 10 points !")
                }
            }
            if character is Mage || (character is Paladin && paladinShieldOrSword == true) {
                print(character.name + " found a chest, he replace his " + oldWeapon.name + " by a " + character.weapon.name + ", heal increase by \(character.weapon.heal - oldWeapon.heal) points !")
            } else {
                print(character.name + " found a chest, he replace his " + oldWeapon.name + " by a " + character.weapon.name + ", damage increase by \(character.weapon.damage - oldWeapon.damage) points !")
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
