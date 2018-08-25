//
//  Game.swift
//  TDD-BowlingGame
//
//  Created by HankTseng on 2018/8/25.
//  Copyright © 2018年 HyerTech. All rights reserved.
//

import Foundation

class Game {
    private var totalScore = 0
    func roll(_ pins: Int) {
     totalScore += pins
    }
    
    func score() -> Int {
        return totalScore
    }
}
