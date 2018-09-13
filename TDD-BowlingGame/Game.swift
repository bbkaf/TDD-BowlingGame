//
//  Game.swift
//  TDD-BowlingGame
//
//  Created by HankTseng on 2018/8/25.
//  Copyright © 2018年 HyerTech. All rights reserved.
//

import Foundation

class Game {
    private var scores = Array<Int>.init(repeating: 0, count: 21)
    var currentRoll = 0
    func roll(_ pins: Int) {
        scores[currentRoll] = pins
        currentRoll += 1
    }
    
    func score() -> Int {
        var roll = 0
        var spareBonus = 0
        var strikeBonus = 0
        for _ in 1...9 {
            if isStrike(scores[roll]) {
                strikeBonus += scores[roll + 1] + scores[roll + 2]
                roll += 1
            } else if isSpare(scores[roll], scores[roll + 1]) {
                spareBonus += scores[roll + 2]
                roll += 2
            } else {
                roll += 2
            }
        }
        return scores.reduce(0, +) + spareBonus + strikeBonus
    }
    
    private func isSpare(_ firstPin: Int, _ secondPin: Int) -> Bool {
        return firstPin + secondPin == 10 ? true : false
    }

    private func isStrike(_ firstPin: Int) -> Bool {
        return firstPin == 10 ? true : false
    }

}
