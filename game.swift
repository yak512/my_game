//
//  game.swift
//  
//
//  Created by BOUHADEB Yacoub on 08/09/2018.
//

import Foundation

class Game  {
    var player = [Player]()
    var allNaChar = [String]()
    var playerN = [String]()
    var nbrP = 0
    var nbrR = 0
    var gameOver = false
    var pOneorTwo = 0
    
    func IsGameover() {

        for i in 0..<2 {
            var a = 0
            var lifeheroes = 0
            while (a < 3) {
             lifeheroes += self.player[i].heroes[a].lifePoint
             a += 1
            }
            if (lifeheroes == 0) {
                if (i == 0) {
                 print("[" + self.player[0].playerName + "]" + ", all of your characters are dead..")
                 print("[" + self.player[1].playerName + "]" + " Win this game congratulations !")
                print("Number of round played: \(self.nbrR)")
                } else {
                    print("[" + self.player[1].playerName + "]" + ", all of your characters are dead..")
                    print("[" + self.player[0].playerName + "]" + " Win this game congratulations !\n\n\n")
                    print("Number of round played: \(self.nbrR)")
                }
                self.gameOver = true
            }
        }
        if (self.gameOver == true) {
            var a = false
            while (a != true) {
                print("Do you want to play again ? yes or no")
                if let playagain = readLine() {
                    switch playagain {
                        case "yes", "y":
                            menu()
                        case "no", "n":
                            a = true
                            print("Thank you for playing, see you soon ! :D")
                        default:
                            print("Invalid answer, please answer yes or no")
                    }
                }
            }
        }
    }
    
    func whoplay() {
        if (self.pOneorTwo == 0) {
            self.pOneorTwo = 1
        } else {
            self.pOneorTwo = 0
        }
    }
    
    func    displayChar() {
        var i = 0
        while (i < 2) {
            print("[\(self.player[i].playerName)]\n")
            var b = 0
            while (b < 3) {
                if (self.player[i].heroes[b].TypeClass == "mage" || self.player[i].heroes[b].TypeClass == "paladin") {
                    self.player[i].heroes[b].displayName()
                    self.player[i].heroes[b].displayLifePoint()
                    self.player[i].heroes[b].displaymaxLife()
                    if (self.player[i].heroes[b].TypeClass == "mage") {
                        (self.player[i].heroes[b] as! Mage).displayHeal()
                    } else {
                        self.player[i].heroes[b].displayAttack()
                        (self.player[i].heroes[b] as! Paladin).displayHeal()
                        }
                    self.player[i].heroes[b].displayTypeClass()
                    
                    b += 1
                }  else {
                        self.player[i].heroes[b].displayName()
                        self.player[i].heroes[b].displayLifePoint()
                        self.player[i].heroes[b].displaymaxLife()
                        self.player[i].heroes[b].displayAttack()
                        self.player[i].heroes[b].displayTypeClass()
                        b += 1
     
                    }
                }
            print("\n")
            i += 1
        }
     }
    
    func    chest(character: Character) {
        let randomnbr =  Int(arc4random_uniform(10))
        
        if (character.weapon == false) {
            if (randomnbr == 1) {
                switch character.TypeClass {
                    case "warrior":
                        character.attack = character.attack + 15
                        character.weapon = true
                        print("\n--->" + character.name + " found a chest with a beautiful sword in it his damages are increased +20 points !<---\n")
                    case "mage":
                        (character as! Mage).heal = (character as! Mage).heal + 20
                        character.weapon = true
                        print("\n--->" + character.name + " found a chest with a beautiful stick in it, his healing spell increased +15 points !<---\n")
                    case "coloss":
                        character.attack = character.attack + 10
                        character.weapon = true
                        print("\n--->" + character.name + " found a chest with a beautiful axe in it, his damages are increased +10 points!<---\n")
                    case "dwarf":
                        character.attack = character.attack + 10
                        character.weapon = true
                        print("\n--->" + character.name + " found a chest with a beautiful sword in it, his damages are increased +10 ponts !<---\n")
                    case "paladin":
                        let nb = Int(arc4random_uniform(2))
                        if (nb == 1) {
                            (character as! Paladin).heal = (character as! Paladin).heal + 15
                            print("\n--->" + character.name + " found a chest with a beautiful shield in it his healing spell increased +15 points !<---\n")
                            character.weapon = true
                        } else {
                            character.attack = character.attack + 15
                            print("\n-->" + character.name + " found a chest with a beautiful sword in it his damages are increased +15 points !<---\n")
                            character.weapon = true
                        }
                default:
                    print("Wrong class")
                    }
                }
            }
        }
}

class Player {
    var playerName = ""
    var heroes = [Character]()
    var allNames = [String]()
}

class Character {
    
    var name: String
    var canAttack = false
    var attack: Int
    var lifePoint: Int
    var IsAlive = true
    var TypeClass: String
    var weapon = false
    var maxLife: Int

    init (name: String, lifePoint: Int, attack: Int, TypeClass: String, maxLife: Int) {
        self.name = name
        self.lifePoint = lifePoint
        self.attack = attack
        self.TypeClass = TypeClass
        self.maxLife = maxLife
    }
    func displayName() {
        print(self.name + " ", terminator:"")
    }

    func displayLifePoint() {
        print("[Life point: \(self.lifePoint)" , terminator:"")
    }

    func displaymaxLife() {
        print("/\(self.maxLife) | " , terminator:"")
    }
    
    func displayAttack() {
        print("Dammage points: \(self.attack) | " , terminator:"")
    }

    func displayTypeClass() {
        print("Class: (" + self.TypeClass + ")]")
    }
    
    func attackChar(character: Character) {
        let oldValue = character.lifePoint
        character.lifePoint = character.lifePoint - self.attack
        print("\n\n\n--->" + self.name + " attacked with \(self.attack) points, " + character.name + " lost \(self.attack) on \(oldValue) life points!<---\n")
        if (character.lifePoint <= 0) {
            character.lifePoint = 0
            character.IsAlive = false
            print("--->" + character.name + " is dead..<--\n")
        }
    }
}

class Warrior: Character {
    override init (name: String, lifePoint: Int, attack: Int, TypeClass: String, maxLife: Int) {
        super.init(name: name, lifePoint: lifePoint, attack: attack, TypeClass: TypeClass, maxLife: maxLife)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 100, attack: 10, TypeClass: "warrior", maxLife: 100)
    }
    
}

class Mage: Character {
    var heal = 20
    
    override init (name: String, lifePoint: Int, attack: Int, TypeClass: String, maxLife: Int) {
        super.init(name: name, lifePoint: lifePoint, attack: attack, TypeClass: TypeClass, maxLife: maxLife)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 70, attack: 0, TypeClass: "mage", maxLife: 70)
    }
    
    func displayHeal() {
        print("Healing points: \(self.heal) | " , terminator:"")
    }
    
    func healChar(character: Character) {
        let oldValue = character.lifePoint
        if (character.lifePoint != character.maxLife) {
            character.lifePoint = character.lifePoint + self.heal
            if (character.lifePoint > character.maxLife) {
                print("\n\n\n--->" + character.name + " received \(character.maxLife - oldValue) heal points on \(character.maxLife) life points !", terminator:"")
            } else {
                print("\n\n\n--->" + character.name + " received \(self.heal) heal points on \(character.maxLife) life points !", terminator:"")
            }
            if (character.lifePoint > character.maxLife) {
                character.lifePoint = character.maxLife
            }
        }
    }
}

class Coloss: Character {
    override init (name: String, lifePoint: Int, attack: Int, TypeClass: String, maxLife: Int) {
        super.init(name: name, lifePoint: lifePoint, attack: attack, TypeClass: TypeClass, maxLife: maxLife)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 150, attack: 7, TypeClass: "coloss", maxLife: 150)
    }
    
}

class Dwarf: Character {
    override init (name: String, lifePoint: Int, attack: Int, TypeClass: String, maxLife: Int) {
        super.init(name: name, lifePoint: lifePoint, attack: attack, TypeClass: TypeClass, maxLife: maxLife)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 75, attack: 15, TypeClass: "dwarf", maxLife: 75)
    }
    
}

class Paladin: Character {
    
    var heal = 15
    override init (name: String, lifePoint: Int, attack: Int, TypeClass: String, maxLife: Int) {
        super.init(name: name, lifePoint: lifePoint, attack: attack, TypeClass: TypeClass, maxLife: maxLife)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 100, attack: 7, TypeClass: "paladin", maxLife: 100)
    }
    func displayHeal() {
        print("Healing points: \(self.heal) | " , terminator:"")
    }
    func healChar(character: Character) {
        let oldValue = character.lifePoint
        if (character.lifePoint != character.maxLife) {
            character.lifePoint = character.lifePoint + self.heal
            if (character.lifePoint > character.maxLife) {
                print("\n\n\n--->" + character.name + " received \(character.maxLife - oldValue) heal points on \(character.maxLife) life points !", terminator:"")
            } else {
                print("\n\n\n--->" + character.name + " received \(self.heal) heal points on \(character.maxLife) life points !", terminator:"")
            }
            if (character.lifePoint > character.maxLife) {
                character.lifePoint = character.maxLife
            }
        }
    }
    
}

func containsOnlyLetters(input: String) -> Bool {
    for chr in input {
        if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z")) {
            return false
        } else if (input == "") {
            return false
        }
    }
    return true
}

func checkName(name: String, allNaChar: [String]) -> Bool {
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

func charName(allNaChar: [String]) -> String {
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

func creatChar(game: Game) {

    var i = 0
    while(i < 3) {
        print("\nWhich class do you choose?"
            + "\n1. warrior [Life points: 100 | Damages: 10 points]"
            + "\n2. mage [Life points: 70 | Heal: 20 points]"
            + "\n3. coloss [Life points: 150 | Damages: 7 points]"
            + "\n4. dwarf [Life points: 75 | Damages: 15 points]"
            + "\n5. paladin [Life points: 100 | Damages: 10 points] | Heal: 15 points]")
    if let choice = readLine()  {
        
        switch choice {
        case "1", "warrior":
            game.player[game.nbrP].heroes.append(Warrior(name:(charName(allNaChar: game.allNaChar))))
            game.allNaChar.append(game.player[game.nbrP].heroes[i].name.lowercased())
            i += 1
        case "2", "mage":
            game.player[game.nbrP].heroes.append(Mage(name:(charName(allNaChar: game.allNaChar))))
            game.allNaChar.append(game.player[game.nbrP].heroes[i].name.lowercased())
            i += 1
        case "3", "coloss":
            game.player[game.nbrP].heroes.append(Coloss(name:(charName(allNaChar: game.allNaChar))))
            game.allNaChar.append(game.player[game.nbrP].heroes[i].name.lowercased())
            i += 1
        case "4", "dwarf":
            game.player[game.nbrP].heroes.append(Dwarf(name:(charName(allNaChar: game.allNaChar))))
            game.allNaChar.append(game.player[game.nbrP].heroes[i].name.lowercased())
            i += 1
        case "5", "paladin":
            game.player[game.nbrP].heroes.append(Paladin(name:(charName(allNaChar: game.allNaChar))))
            game.allNaChar.append(game.player[game.nbrP].heroes[i].name.lowercased())
            i += 1
        default:
            print("\n\n\n--->Invalid choice.. make a choice force exemple by typing 1 to take warrior or typing warrior to take a warrior <---\n")
            }
        }
    }
}

func attack(game: Game, character: Character) {
    game.whoplay()
    print("Which ennemi character do you want to attack ?")
    character.canAttack = false
    while (character.canAttack != true) {
    if let choice = readLine() {
        switch choice {
        case game.player[game.pOneorTwo].heroes[0].name:
            if (game.player[game.pOneorTwo].heroes[0].IsAlive == false) {
            print("\n\n\n--->This ennemi character is dead, please choose another one<---\n")
            } else {
                character.attackChar(character: game.player[game.pOneorTwo].heroes[0])
                character.canAttack = true
            }
        case game.player[game.pOneorTwo].heroes[1].name:
            if (game.player[game.pOneorTwo].heroes[1].IsAlive == false) {
               print("\n\n\n--->This ennemi character is dead, please choose another one<---\n")
            } else {
                character.attackChar(character: game.player[game.pOneorTwo].heroes[1])
                character.canAttack = true
            }
        case game.player[game.pOneorTwo].heroes[2].name:
            if (game.player[game.pOneorTwo].heroes[2].IsAlive == false) {
            print("\n\n\n--->This ennemi character is dead, please choose another one<---\n")
        } else {
            character.attackChar(character: game.player[game.pOneorTwo].heroes[2])
            character.canAttack = true
            }
        default:
            print("--->Choose a valid ennemi to attack !<---")
            }
        }
    }
}

func heal(game: Game, character: Character) -> String {
    if (game.player[game.pOneorTwo].heroes[0].lifePoint == game.player[game.pOneorTwo].heroes[0].maxLife && game.player[game.pOneorTwo].heroes[1].lifePoint == game.player[game.pOneorTwo].heroes[1].maxLife) && game.player[game.pOneorTwo].heroes[2].lifePoint == game.player[game.pOneorTwo].heroes[2].maxLife {
        return ("\n\n\n--->All the characters are full life! You can't select a healer !<---\n")
    }
    print("Which character do you want to heal ?")
    if let choice = readLine() {
        switch choice {
            case game.player[game.pOneorTwo].heroes[0].name:
                if (game.player[game.pOneorTwo].heroes[0].lifePoint < game.player[game.pOneorTwo].heroes[0].maxLife && game.player[game.pOneorTwo].heroes[0].IsAlive == false) {
                    return ("\n\n\n--->What are you trying to do do ?! You can't heal a dead character !<---\n")
                } else if (game.player[game.pOneorTwo].heroes[0].lifePoint == game.player[game.pOneorTwo].heroes[0].maxLife) {
                    return ("\n\n\n--->This character is full life !<---\n")
                } else if (character.TypeClass == "mage") {
                    (character as! Mage).healChar(character: game.player[game.pOneorTwo].heroes[0])
                } else {
                       (character as! Paladin).healChar(character: game.player[game.pOneorTwo].heroes[0])
                }
            case game.player[game.pOneorTwo].heroes[1].name:
                if (game.player[game.pOneorTwo].heroes[1].lifePoint < game.player[game.pOneorTwo].heroes[1].maxLife && game.player[game.pOneorTwo].heroes[1].IsAlive == false) {
                    return ("\n\n\n--->What are you trying to do do ?! You can't heal a dead character !<---\n")
                } else if (game.player[game.pOneorTwo].heroes[1].lifePoint == game.player[game.pOneorTwo].heroes[1].maxLife) {
                    return ("\n\n\n--->This character is full life !<---\n")
                    } else if (character.TypeClass == "mage") {
                    (character as! Mage).healChar(character: game.player[game.pOneorTwo].heroes[1])
                    }
                    else {
                        (character as! Paladin).healChar(character: game.player[game.pOneorTwo].heroes[1])
                    }
            case game.player[game.pOneorTwo].heroes[2].name:
                if (game.player[game.pOneorTwo].heroes[2].lifePoint < game.player[game.pOneorTwo].heroes[2].maxLife && game.player[game.pOneorTwo].heroes[2].IsAlive == false) {
                    return ("\n\n\n--->What are you trying to do do ?! You can't heal a dead character !<---\n")
                } else if (game.player[game.pOneorTwo].heroes[2].lifePoint == game.player[game.pOneorTwo].heroes[2].maxLife) {
                     return ("\n\n\n--->This character is full life !<---\n")
                } else if (character.TypeClass == "mage") {
                    (character as! Mage).healChar(character: game.player[game.pOneorTwo].heroes[2])
                    } else {
                        (character as! Paladin).healChar(character: game.player[game.pOneorTwo].heroes[2])
                    }
            default:
                print("\n\n\n--->Choose a valid character to heal !<---\n")
            }
    }
    game.whoplay()
    return " Character Healed !<---\n"
}

func    action(game: Game, character: Character) {
    switch character.TypeClass {
    case "warrior":
        attack(game: game, character: character)
    case "mage":
        print(heal(game: game, character: character))
    case "coloss":
        attack(game: game, character: character)
    case "dwarf":
        attack(game: game, character: character)
    case "paladin":
        print("What do you want to do ?\n 1. Heal\n 2. Attack")
        var a = false
        while (a != true) {
            if let choice = readLine() {
                switch choice {
                    case "1":
                        print(heal(game: game, character: character))
                        a = true
                    case "2":
                        attack(game: game, character: character)
                        a = true
                    default:
                        print("--->Please choose between 1 Heal or 2 Attack<---")
                    }
                }
            }
    default:
        print("wrong class")
    }
}

func fight(game: Game) {
    print("GAME begins in 3 seconds BE READY !!")
    sleep(1)
    for i in 0..<3 {
        print(i + 1)
        sleep(1)
    }
    print("\n")
    while (game.gameOver != true) {
        game.displayChar()
        print("[\(game.player[game.pOneorTwo].playerName)]" + " which character do you choose ?")
        game.nbrR += 1
        if let choice = readLine() {
            switch choice {
            case game.player[game.pOneorTwo].heroes[0].name:
                if (game.player[game.pOneorTwo].heroes[0].IsAlive != false) {
                    game.chest(character: game.player[game.pOneorTwo].heroes[0])
                    action(game: game, character: game.player[game.pOneorTwo].heroes[0])
                } else {
                print("\n\n\n-->You can't choose " + game.player[game.pOneorTwo].heroes[0].name + ", he is dead..<--\n" )
                    }
            case  game.player[game.pOneorTwo].heroes[1].name:
                if (game.player[game.pOneorTwo].heroes[1].IsAlive != false) {
                    game.chest(character: game.player[game.pOneorTwo].heroes[1])
                    action(game: game, character: game.player[game.pOneorTwo].heroes[1])
                } else {
                    print("\n\n\n-->You can't choose " + game.player[game.pOneorTwo].heroes[0].name + ", he is dead..<--\n" )
                }
            case game.player[game.pOneorTwo].heroes[2].name:
                if (game.player[game.pOneorTwo].heroes[2].IsAlive != false) {
                    game.chest(character: game.player[game.pOneorTwo].heroes[2])
                    action(game: game, character: game.player[game.pOneorTwo].heroes[2])
                } else {
                   print("\n\n\n-->You can't choose " + game.player[game.pOneorTwo].heroes[0].name + ", he is dead..<--\n" )
                }
            default:
                print("\n\n\n--->Please choose a correct name from your characters<---\n")
            }
        }
        game.IsGameover() // check if the game is over
    }
}

func    menu() {
    
    let game =  Game()
    print("Each player is going to enter his name and choose 3 characters and the game will start !")
    for i in 0..<2 {
        game.player.append(Player())
        print("\n\nPlayer\(i + 1) what's your name ?")
        var a = false
        while (a != true) {
            if let name = readLine() {
                game.nbrP = i
                if ((checkName(name: name.lowercased(), allNaChar: game.playerN)) == true) {
                    game.player[i].playerName = name
                    game.playerN.append(game.player[i].playerName.lowercased())
                    a = true
                }
            }
        }
        creatChar(game: game)
    }
    fight(game: game)
}

menu()


