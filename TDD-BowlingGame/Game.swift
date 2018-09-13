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
    private var scoresRecord: [Int] = []
    var currentRoll = 0
    var rollScores: [Score] = []
    func roll(_ pins: Int) {
        scores[currentRoll] = pins
        scoresRecord.append(pins)
        currentRoll += 1
    }
    func isEnd() -> Bool {
        var isEnd = false
        var roll: Double = 0
        for i in 0..<scoresRecord.count {
            if scoresRecord[i] == 10 {
                roll += 1
            }
        }
        
        roll += Double((Double(scoresRecord.count) - roll) / 2)
        if roll >= 10 && roll < 12{
            if scoresRecord.last == 10 {
                isEnd = false
            } else if scoresRecord[scoresRecord.count - 1] + scoresRecord[scoresRecord.count - 2] == 10 && roll == 11.5{
                isEnd = false
            } else if scoresRecord[scoresRecord.count - 1] + scoresRecord[scoresRecord.count - 2] == 10 && roll == 10{
                isEnd = false
            } else {
                isEnd = true
            }
        }
        if roll >= 12 {
            isEnd = true
        }
        
        return isEnd
    }
    func score() -> Int {
        var roll = 0
        var spareBonus = 0
        var strikeBonus = 0
        rollScores = []
        print("--")
        print(roll)
        for i in 1...9 {
            var score = Score()
            score.roll = i
            if isStrike(scores[roll]) {
                
                score.isStrike = true
                score.firstPins = 10
                score.rollScore = 10 + scores[roll + 1] + scores[roll + 2]
                strikeBonus += scores[roll + 1] + scores[roll + 2]
                roll += 1
            } else if isSpare(scores[roll], scores[roll + 1]) {
                score.isSpare = true
                score.firstPins = scores[roll]
                score.secPins = scores[roll + 1]
                score.rollScore = scores[roll] + scores[roll + 1] + scores[roll + 2]
                spareBonus += scores[roll + 2]
                roll += 2
            } else {
                score.firstPins = scores[roll]
                score.secPins = scores[roll + 1]
                score.rollScore = scores[roll] + scores[roll + 1]
                roll += 2
            }
            
            rollScores.append(score)
            if i == 9 {
                var scoreX = Score()
                scoreX.roll = 10
                scoreX.firstPins = scores[roll]
                scoreX.secPins = scores[roll + 1]
                scoreX.rollScore = scores[roll] + scores[roll + 1]
                if scores[roll] + scores[roll + 1] >= 10 {
                    scoreX.thirdPins = scores[roll + 2]
                    scoreX.rollScore = scores[roll] + scores[roll + 1] + scores[roll + 2]
                }
                
                rollScores.append(scoreX)
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

struct Score {
    var roll: Int? = 0
    var firstPins: Int? = 0
    var secPins: Int? = 0
    var thirdPins: Int? = 0
    var rollScore: Int? = 0
    var isStrike: Bool? = false
    var isSpare: Bool? = false
}
