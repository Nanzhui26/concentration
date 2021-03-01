//
//  Card.swift
//  concentration
//
//  Created by Azure on 2021/2/15.
//  Copyright © 2021 Azure. All rights reserved.
//

import Foundation

struct Card {//值类型
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    //不需要emoji，因为Card是与UI不相关的
    //基于MVC理论，Model只与游戏逻辑有关
    static var identifierFactory = 0
    static func getUniqueIdentifier () -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
