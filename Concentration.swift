//
//  Concentration.swift
//  concentration
//
//  Created by Azure on 2021/2/15.
//  Copyright © 2021 Azure. All rights reserved.
//

import Foundation

class Concentration{//应用类型
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard:Int?
    func choseCard(at index:Int){
         //此处有三种可能，1.无牌被翻开，2.一张牌被翻开，3.两张牌被翻开
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard,matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                //either no cards or 2 cards are face up
                for flipDowmIndex in cards.indices{
                    cards[flipDowmIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard  = index
            }
        }
    }
    init(numberOfParisOfCards:Int){
        for _ in 1...numberOfParisOfCards{
            let card = Card()
            cards += [card,card]
            /*cards.append(card)
            cards.append(card)//machingCard*/
        }
        //TODO:shuffle the Cards
    }
}
