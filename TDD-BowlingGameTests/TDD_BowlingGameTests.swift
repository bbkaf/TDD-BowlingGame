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
        print("unit test go")
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
        XCTAssertEqual(game.isEnd(), true)
    }
    
    func testOneStrike() {
        game.roll(10)
        game.roll(4)
        game.roll(5)
        game.roll(4)
        XCTAssertEqual(game.score(), 32)
    }
    
    func testPerfectGame() {
        roll(knockPins: 10, times: 12)
        XCTAssertEqual(game.score(), 300)
        XCTAssertEqual(game.isEnd(), true)
    }
    
    func testRealGame() {
        game.roll(1)
        game.roll(4)
        game.roll(4)
        game.roll(5)
        game.roll(6)
        game.roll(4)
        game.roll(5)
        game.roll(5)
        game.roll(10)
        game.roll(0)
        game.roll(1)
        game.roll(7)
        game.roll(3)
        game.roll(6)
        game.roll(4)
        game.roll(10)
        game.roll(2)
        game.roll(8)
        game.roll(6)
        XCTAssertEqual(game.score(), 133)
        XCTAssertEqual(game.isEnd(), true)
    }
    private func roll(knockPins: Int, times: Int) {
        for _ in 1...times {
            game.roll(knockPins)
        }
    }
    
}
