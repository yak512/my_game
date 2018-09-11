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
    var nbrP = 0
    
}

class Player {
    var playerName = ""
    var heroes = [Character]()
    var allNames = [String]()
}

class Character {
    
    var name: String
    var attack: Int
    var lifePoint: Int
    var TypeClass: String
    var weapon = false
    
    init (name: String, lifePoint: Int, attack: Int, TypeClass: String) {
        self.name = name
        self.lifePoint = lifePoint
        self.attack = attack
        self.TypeClass = TypeClass
    }
    func displayName() {
        print(self.name + " ", terminator:"")
    }

    func displayLifePoint() {
        print("[Life point: \(self.lifePoint) | " , terminator:"")
    }

    func displayAttack() {
        print("Dammage points: \(self.attack) | " , terminator:"")
    }

    func displayTypeClass() {
        print("Class: (" + self.TypeClass + ")]")
    }
}

class Warrior: Character {
    override init (name: String, lifePoint: Int, attack: Int, TypeClass: String) {
        super.init(name: name, lifePoint: lifePoint, attack: attack, TypeClass: TypeClass)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 33, attack: 42, TypeClass: "warrior")
    }
    
}

class Mage: Character {
    var heal = 15
    
    override init (name: String, lifePoint: Int, attack: Int, TypeClass: String) {
        super.init(name: name, lifePoint: lifePoint, attack: attack, TypeClass: TypeClass)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 33, attack: 0, TypeClass: "mage")
    }
    
    func displayHeal() {
        print("Healing points: \(self.heal) | " , terminator:"")
    }
}

class Coloss: Character {
    override init (name: String, lifePoint: Int, attack: Int, TypeClass: String) {
        super.init(name: name, lifePoint: lifePoint, attack: attack, TypeClass: TypeClass)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 150, attack: 6, TypeClass: "coloss")
    }
    
}

class Dwarf: Character {
    override init (name: String, lifePoint: Int, attack: Int, TypeClass: String) {
        super.init(name: name, lifePoint: lifePoint, attack: attack, TypeClass: TypeClass)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 75, attack: 20, TypeClass: "dwarf")
    }
    
}

class Paladin: Character {
    
    var heal = 10
    override init (name: String, lifePoint: Int, attack: Int, TypeClass: String) {
        super.init(name: name, lifePoint: lifePoint, attack: attack, TypeClass: TypeClass)
    }
    convenience init(name: String) {
        self.init(name: name, lifePoint: 100, attack: 7, TypeClass: "paladin")
    }
    func displayHeal() {
        print("Healing points: \(self.heal) | " , terminator:"")
    }
    
}

func checkName(name: String, allNaChar: [String]) -> Bool {
        if allNaChar.contains(name) {
            print("name already used")
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
                a = checkName(name: name, allNaChar: allNaChar)
                n = name
        }
    }
    return n
}

func creatChar(game: Game) {

    var i = 0
    while(i < 3) {
        print("Quel classe choisez vous?"
            + "\n1. warrior"
            + "\n2. mage"
            + "\n3. coloss"
            + "\n4. dwarf"
            + "\n5. paladin")
    if let choice = readLine()  {
        
        switch choice {
        case "1":
            game.player[game.nbrP].heroes.append(Warrior(name:(charName(allNaChar: game.allNaChar))))
            game.allNaChar.append(game.player[game.nbrP].heroes[i].name)
            i += 1
        case "2":
            game.player[game.nbrP].heroes.append(Mage(name:(charName(allNaChar: game.allNaChar))))
            game.allNaChar.append(game.player[game.nbrP].heroes[i].name)
            i += 1
        case "3":
            game.player[game.nbrP].heroes.append(Coloss(name:(charName(allNaChar: game.allNaChar))))
            game.allNaChar.append(game.player[game.nbrP].heroes[i].name)
            i += 1
        case "4":
            game.player[game.nbrP].heroes.append(Dwarf(name:(charName(allNaChar: game.allNaChar))))
            game.allNaChar.append(game.player[game.nbrP].heroes[i].name)
            i += 1
        case "5":
            game.player[game.nbrP].heroes.append(Paladin(name:(charName(allNaChar: game.allNaChar))))
            game.allNaChar.append(game.player[game.nbrP].heroes[i].name)
            i += 1
        default:
            print("I don't understand.. make a choice between 1 and 5")
            }
        }
    }
}

func    displayChar(game: Game) {
    print("GAME begins in 3 seconds")
    sleep(1)
    for i in 0..<3 {
        print(i + 1)
        sleep(1)
    }
    var i = 0
    while (i < 2) {
        print(game.player[i].playerName)
        var b = 0
        while (b < 3) {
            if (game.player[i].heroes[b].TypeClass == "mage") {
                game.player[i].heroes[b].displayName()
                game.player[i].heroes[b].displayLifePoint()
                (game.player[i].heroes[b] as! Mage).displayHeal()
                game.player[i].heroes[b].displayTypeClass()
                b += 1
            } else if (game.player[i].heroes[b].TypeClass == "paladin") {
                game.player[i].heroes[b].displayName()
                game.player[i].heroes[b].displayLifePoint()
                (game.player[i].heroes[b] as! Paladin).displayHeal()
                game.player[i].heroes[b].displayAttack()
                game.player[i].heroes[b].displayTypeClass()
                b += 1
            } else {
                game.player[i].heroes[b].displayName()
                game.player[i].heroes[b].displayLifePoint()
                game.player[i].heroes[b].displayAttack()
                game.player[i].heroes[b].displayTypeClass()
                b += 1
            }
        }
        i += 1
    }
}

func    menu() {
    
    let game =  Game()
    for i in 0..<2 {
        game.player.append(Player())
        print("Player\(i + 1) what's your name ?")
        if let name = readLine() {
        game.nbrP = i
        game.player[i].playerName = name
        }
        creatChar(game: game)
    }
 displayChar(game: game)
}

menu()


/*p1.heroes.append(Paladin(name: "Garrosh"))
for Character in p1.heroes {
    if let pala = Character as? Paladin {
        print(p1.heroes.count)
        print(pala.name)
    }
}
p1.heroes.append(Mage(name: "lol"))
p1.heroes.append(Coloss(name: "Tommy"))
*/
/*
    for Character in p1.heroes {
        if Character is Paladin {
            print("gooog baby")
        }
    }

*/


/*for Character in p1.heroes {
    if let pala = Character as? Mage {
        print(pala.name)
    }
}*/
//print((p1.heroes[0] as! Paladin).heal)



