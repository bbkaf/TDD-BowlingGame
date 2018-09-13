//
//  TDD_BowlingGameUITest.swift
//  TDD-BowlingGameTests
//
//  Created by HankTseng on 2018/9/13.
//  Copyright © 2018 HyerTech. All rights reserved.
//

import XCTest

class TDD_BowlingGameUITest: XCTestCase {
    let app = XCUIApplication()
    override func setUp() {
        super.setUp()
        print("UITest go")
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
        
       
        
       
        
    }
    
    func testAllHitFivePins() {
        app.sliders["pinSlider"].adjust(toNormalizedSliderPosition: 1)
        app.sliders["pinSlider"].adjust(toNormalizedSliderPosition: 0)
        app.sliders["pinSlider"].adjust(toNormalizedSliderPosition: 0.55)
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        sleep(1)
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "totalScore").label, "10")
        XCTAssertEqual(app.tables.cells.containing(.staticText, identifier:"1")/*@START_MENU_TOKEN@*/.staticTexts["bonusLabel"]/*[[".staticTexts[\"Strike!!\"]",".staticTexts[\"bonusLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.label, "Spare")
        XCTAssertEqual(app.tables.cells.containing(.staticText, identifier:"1").staticTexts["scoreLabel"].label, "10")
        
        
        app.buttons["rollBtn"].tap()
        XCTAssertEqual(app.tables.cells.containing(.staticText, identifier:"1").staticTexts["scoreLabel"].label, "15")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "totalScore").label, "20")
        app.sliders["pinSlider"].adjust(toNormalizedSliderPosition: 0.3)
        app.sliders["pinSlider"].adjust(toNormalizedSliderPosition: 0.55)
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.sliders["pinSlider"].adjust(toNormalizedSliderPosition: 1)
        app.sliders["pinSlider"].adjust(toNormalizedSliderPosition: 0.55)
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "totalScore").label, "150")
        XCTAssertFalse(app.buttons["rollBtn"].exists)
    }
    
    func testAllStrike() {
        app.sliders["pinSlider"].adjust(toNormalizedSliderPosition: 1)
        app.buttons["rollBtn"].tap()
        sleep(1)
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "totalScore").label, "10")
        XCTAssertEqual(app.tables.cells.containing(.staticText, identifier:"1")/*@START_MENU_TOKEN@*/.staticTexts["bonusLabel"]/*[[".staticTexts[\"Strike!!\"]",".staticTexts[\"bonusLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.label, "Strike!!")
        
        app.buttons["rollBtn"].tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "totalScore").label, "30")
        app.sliders["pinSlider"].adjust(toNormalizedSliderPosition: 0.3)
        app.sliders["pinSlider"].adjust(toNormalizedSliderPosition: 1)
        app.buttons["rollBtn"].tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "totalScore").label, "60")
        app.buttons["rollBtn"].tap()
        app.sliders["pinSlider"].adjust(toNormalizedSliderPosition: 0.5)
        app.sliders["pinSlider"].adjust(toNormalizedSliderPosition: 1)
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        app.buttons["rollBtn"].tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "totalScore").label, "300")
        XCTAssertFalse(app.buttons["rollBtn"].exists)
    }
    
}
