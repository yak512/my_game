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
    
    var players = [Player]() // Table of object player, we stock all the player
    
    private var playerNames: [String] { // We stock the players names
        var names = [String]()
        for player in players {
            names.append(player.playerName)
        }
        return names
    }
    
    var namesOfCharacters: [String] { // We stock all the names of the characters
        var names = [String]()
        for player in players {
            for hero in player.heroes {
                names.append(hero.name)
            }
        }
        return names
    }
    
    private var numberRounds = 0  // Used to count the number of round played
    
    private var gameOver = false // Used to know if the game is over or not
    
    private var playerOneOrTwo = 0 // Index used in the function changePlayer(), so we can change between player one and two
    
    
    
    ////////                        ///////
    ///////        METHODS          ///////
    ///////                         ///////
    
    
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
    
    // This function let us choose a specific type of character (Warrior, Mage, Coloss, Dwarf, Paladin)
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
    
    // This fucntion let us choose between attack or heal, when a player choose Paladin (ally character)
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
    
    // This function let us choose between playing again or not
    private func playAgain() {
        
        var playAgain: Bool?
        print("Do you want to play again, yes or no ?")
        while (playAgain == nil) {
            if let choose = readLine() {
                switch choose {
                case "y", "yes":
                    players.removeAll()
                    numberRounds = 0
                    playerOneOrTwo = 0
                    playAgain = true
                    gameOver = false
                    start()
                case "n", "no":
                    playAgain = false
                    print("Thank you for playing, see you soon ! :D")
                default:
                    print("Please tape y or yes to play again, n or no to stop")
                }
            }
        }
    }
    
    // This function is only a countdown before the game start
    private func gameStartTimer() {
        
        print("\n\nGAME begins in 3 seconds BE READY !!")
        sleep(1)
        for i in (0..<3).reversed() {
            print(i + 1)
            sleep(1)
        }
        print("\n")
    }
    
    // This function let us choose an ally character to do an action
    private func chooseCharacter() ->([Character], [Character], Character) {
        
        print("[\(players[playerOneOrTwo].playerName)]" + " which character do you choose ? Choose between 1 and 3")
        let currentPlayerHeroes = players[playerOneOrTwo].heroes
        let playerDontPlayHeores = players[(playerOneOrTwo + 1) % 2].heroes
        let currentPlayerCharacter = choosenCharacterForAction(currentPlayerHeroes)
        
        return (currentPlayerHeroes, playerDontPlayHeores, currentPlayerCharacter)
    }
    
    // In this function the game take place and the two player can choose their character and do an action
    private func fight() {
        
        gameStartTimer()
        
        while (gameOver != true) {
            displayPlayers()
            
            numberRounds += 1
            
            let (currentPlayerHeroes, playerDontPlayHeores, currentPlayerCharacter) = chooseCharacter()
            
            chest(character: currentPlayerCharacter)
            
            var isAttack: Bool = true
            if currentPlayerCharacter.canHeal {
                if currentPlayerCharacter.canAttack && !chooseHealOrAttack() {
                    isAttack = true
                } else {
                    isAttack = false
                }
            }
            
            if isAttack {
                print("Which character do you want to attack ?")
                let characterToAttack = choosenCharacterForAction(playerDontPlayHeores)
                currentPlayerCharacter.doActionOn(character: characterToAttack, isFriend: false)
            } else {
                print("Which character do you want to heal ?")
                let characterToHeal = choosenCharacterForAction(currentPlayerHeroes)
                currentPlayerCharacter.doActionOn(character: characterToHeal, isFriend: true)
            }
            
            changePlayer()
            isGameOver()
        }
    }
    
    // this function let us choose and ennemy character to attack or an ally chaarcter to heal
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
    
    // This function verify is a player is alive, so it can tell if the game is over or not
    private func isGameOver() {
        
        for i in 0..<2 {
            if  players[i].isPlayerAlive() == 1 {
                displayPlayers()
                print("[" + players[i].playerName + "]" + ", all of your characters are dead..")
                print("[" + players[i == 0 ? 1 : 0].playerName + "]" + " win this game congratulations !")
                print("Number of round played: \(numberRounds)")
                gameOver = true
            }
        }
        if gameOver {
            playAgain()
        }
    }
    
    // This function tell us which player should play
    func changePlayer() {
        playerOneOrTwo = playerOneOrTwo == 0 ? 1 : 0
    }
    
    // This function is used to explain the game
    func rules() {
        print("\n\n---->Each player is going to enter his name and choose 3 characters and their names, you have the choice between 5 different characters, choose wisely, the player who kills all the characters of his enemy wins the game ! Good luck !<----")
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
                    paladinShieldOrSword = true
                } else {
                    character.weapon = MagicSword()
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
        rules()
        creatTeams()
        fight()
    }
}
