//
//  TDD_BowlingGameTests.swift
//  TDD-BowlingGameTests
//
//  Created by HankTseng on 2018/8/25.
//  Copyright © 2018年 HyerTech. All rights reserved.
//

import XCTest
@testable import TDD_BowlingGame

class TDD_BowlingGameTests: XCTestCase {
    var game: Game!
    override func setUp() {
        game = Game()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        game = nil
    }
    
    func testGutterGame() {
        roll(knockPins: 0, times: 20)
        XCTAssertEqual(game.score(), 0)
    }
    
    func testAllTwoPins() {
        roll(knockPins: 2, times: 20)
        XCTAssertEqual(game.score(), 40)
    }
    
    func testSpare() {
        game.roll(1)
        game.roll(4)
        game.roll(5)
        game.roll(5)
        game.roll(6)
        game.roll(0)
        XCTAssertEqual(game.score(), 27)
    }
    
    func testAllFivePins() {
        roll(knockPins: 5, times: 21)
        XCTAssertEqual(game.score(), 150)
    }
    
    private func roll(knockPins: Int, times: Int) {
        for _ in 1...times {
            game.roll(knockPins)
        }
    }
    
}
