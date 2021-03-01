//
//  ViewController.swift
//  concentration
//
//  Created by Azure on 2021/2/13.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     @IBOutlet var CarButton: [UIButton]!
    //创建绿色通道
    var game : Concentration = Concentration(numberOfParisOfCards:6 )
    
    @IBOutlet weak var filpCountNumber: UILabel!
    
    var filpCount = 0{
        didSet{//属性观测器
            filpCountNumber.text="Filps:\(filpCount)"
        }
    }
    
 
    var flips=0
    var fisEmoji=""
    
    
    @IBAction func TouchCard(_ sender: UIButton) {
        filpCount += 1
        flips += 1
        
        if let CardNumber = CarButton.index(of: sender) {
            game.choseCard(at: CardNumber)
            updateViewFromModel()
        }
        
    }
    func updateViewFromModel(){
        for index in CarButton.indices{
            let button = CarButton[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for:card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    var emojiChoses=["👻","🎃","👹","🤡","🎭","🎪","🍬","🍭","🦇","👺","👾","🧛‍♀️"]
    var emoji = Dictionary<Int,String>()//var emoji = [Int:String]()
    func emoji(for card :Card)->String{
        if emoji[card.identifier] == nil{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoses.count)))
            emoji[card.identifier] = emojiChoses.remove(at: randomIndex)
        }
       /* if emoji[card.identifier] != nil{
            return emoji[card.identifier]!
        }else{
            return "?"
        }*/
        return emoji[card.identifier] ?? "?"
    }
    
    
}

