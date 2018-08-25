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
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGutterGame() {
        let game = Game()
        for _ in 1...20 {
            game.roll(0)
        }
        XCTAssertEqual(game.score(), 0)
    }
    
    func testAllTwoPins() {
        let game = Game()
        for _ in 1...20 {
            game.roll(2)
        }
        XCTAssertEqual(game.score(), 40)
    }
    
}
