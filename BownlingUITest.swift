//
//  BownlingUITest.swift
//  TDD-BowlingGameTests
//
//  Created by HankTseng on 2018/9/13.
//  Copyright © 2018 HyerTech. All rights reserved.
//

import XCTest

class BownlingUITest: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testAllSpare() {
        
        let pinSlider = app.sliders["pinSlider"]
        let rollBtn = app.buttons["rollBtn"]
        let totalScore = app.staticTexts.element(matching: .staticText, identifier: "totalScore")
        let rollTableView = app.tables.matching(.table, identifier: "rollTableView")
        let cell = rollTableView.cells.element(matching: .cell, identifier: "ScoreTableViewCell_0")
        let bonusLabelInCell = cell.staticTexts["bonusLabel"]
        let scoreInCell = cell.staticTexts["scoreLabel"]
        
        pinSlider.adjust(toNormalizedSliderPosition: 1.0)
        pinSlider.adjust(toNormalizedSliderPosition: 0)
        pinSlider.adjust(toNormalizedSliderPosition: 0.55)
        rollBtn.tap()
        rollBtn.tap()
        
        XCTAssertEqual(scoreInCell.label, "10")
        XCTAssertEqual(bonusLabelInCell.label, "Spare")
        
        for _ in 3...21 {
            rollBtn.tap()
        }
        
        XCTAssertFalse(rollBtn.exists)
        XCTAssertEqual(totalScore.label, "150")
        
    }
    
    func testAllStrike() {
        let pinSlider = app.sliders["pinSlider"]
        let rollBtn = app.buttons["rollBtn"]
        let totalScore = app.staticTexts.element(matching: .staticText, identifier: "totalScore")
        let rollTableView = app.tables.matching(.table, identifier: "rollTableView")
        let cell = rollTableView.cells.element(matching: .cell, identifier: "ScoreTableViewCell_0")
        let bonusLabelInCell = cell.staticTexts["bonusLabel"]
        let scoreInCell = cell.staticTexts["scoreLabel"]
        
        pinSlider.adjust(toNormalizedSliderPosition: 1.0)
        rollBtn.tap()
        XCTAssertEqual(bonusLabelInCell.label, "Strike!!")
        XCTAssertEqual(scoreInCell.label, "10")
        
        rollBtn.tap()
        XCTAssertEqual(scoreInCell.label, "20")
        rollBtn.tap()
        XCTAssertEqual(scoreInCell.label, "30")
        
        for _ in 4...12 {
            rollBtn.tap()
        }
        
        XCTAssertFalse(rollBtn.exists)
        XCTAssertEqual(totalScore.label, "300")
    }
    
    
    
    
    
}
