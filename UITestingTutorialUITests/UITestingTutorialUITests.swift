//
//  UITestingTutorialUITests.swift
//  UITestingTutorialUITests
//
//  Created by Alan Liu on 2020/08/05.
//  Copyright © 2020 Code Pro. All rights reserved.
//

import XCTest

class UITestingTutorialUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testInvalidLogin_progressSpinnerIsHidden() {
        
        let app = XCUIApplication()
        
        app.launch()
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
        app.buttons["Login"].tap()
        app.alerts["Missing Credentials"].buttons["Ok"].tap()
        
        let activityIndicatorView = app.activityIndicators["In progress"]
        XCTAssertFalse(activityIndicatorView.exists)
        
    }
    
    func testInvalidLogin_missingCredentialsAlertIsShown() {
        
        let app = XCUIApplication()
        
        app.launch()
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
        app.textFields["Username"].tap()
        app.buttons["Login"].tap()
        
        let alertDialog = app.alerts["Missing Credentials"]
        
        XCTAssertTrue(alertDialog.exists)
        
        alertDialog.buttons["Ok"].tap()
    }
    
    func testValidLoginSuccess() {
        
        let validUserName = "CodePro"
        let validPassword = "abc123"
        
        let app = XCUIApplication()
        
        app.launch()
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
        
        let userNameTextField = app.textFields["Username"]
        XCTAssertTrue(userNameTextField.exists)
        userNameTextField.tap()
        userNameTextField.typeText(validUserName)
        
        let passwordTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText(validPassword)
        
        app.buttons["Login"].tap()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
