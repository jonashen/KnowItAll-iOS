//
//  KnowItAllUITests.swift
//  KnowItAllUITests
//
//  Created by Ashish Keshan on 10/25/17.
//  Copyright © 2017 Ashish Keshan. All rights reserved.
//

import XCTest

class KnowItAllUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSignOut() {
                // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")

        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        app.tabBars.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
    }
    
    func testChangePassword() {
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        
        let loginButton = app.buttons["Login"]
        loginButton.tap()
        
        let settingsButton = app.tabBars.buttons["Settings"]
        settingsButton.tap()
        
        let tablesQuery = app.tables
        let changePasswordStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Change Password"]/*[[".cells.staticTexts[\"Change Password\"]",".staticTexts[\"Change Password\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        changePasswordStaticText.tap()
        
        let oldPasswordSecureTextField = app.secureTextFields["Old Password"]
        oldPasswordSecureTextField.tap()
        oldPasswordSecureTextField.typeText("12345")
        
        let newPasswordSecureTextField = app.secureTextFields["New Password"]
        newPasswordSecureTextField.tap()
        newPasswordSecureTextField.typeText("1234")
        
        let confirmPasswordSecureTextField = app.secureTextFields["Confirm Password"]
        confirmPasswordSecureTextField.tap()
        confirmPasswordSecureTextField.tap()
        confirmPasswordSecureTextField.typeText("1234")
        
        let changePasswordButton = app.buttons["Change Password"]
        changePasswordButton.tap()
        
        let doneButton = app.alerts["Success"].buttons["Done"]
        doneButton.tap()
        
        let settingsButton2 = app.navigationBars["Change Password"].buttons["Settings"]
        settingsButton2.tap()
        
        let signOutStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ 
        signOutStaticText.tap()
        
        let yesButton = app.sheets["Are you sure you want to sign out?"].buttons["Yes"]
        yesButton.tap()
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("1234")
        loginButton.tap()
        settingsButton.tap()
        changePasswordStaticText.tap()
        oldPasswordSecureTextField.tap()
        oldPasswordSecureTextField.typeText("1234")
        newPasswordSecureTextField.tap()
        newPasswordSecureTextField.tap()
        newPasswordSecureTextField.typeText("12345")
        confirmPasswordSecureTextField.tap()
        confirmPasswordSecureTextField.tap()
        confirmPasswordSecureTextField.typeText("12345")
        changePasswordButton.tap()
        doneButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.6);/*[[".tap()",".press(forDuration: 0.6);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        settingsButton2.tap()
        signOutStaticText.tap()
        yesButton.tap()
    }
    
    func testCreateNewReview() {
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        
        let tabBarsQuery = app.tabBars
        let cells = app.tables.cells
        cells.element(boundBy: 0).tap()
        app.buttons["Add Review"].tap()
        
        app.otherElements["Rating"].tap()
        
        app.buttons["Create"].tap()
        app.alerts["Success"].buttons["Done"].tap()
        tabBarsQuery.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
    }
    
    func testCreateNewPoll() {
        
        let app2 = XCUIApplication()
        let emailTextField = app2.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app2.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        
        let app = app2
        app.buttons["Login"].tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Create New Post"].tap()
        app2/*@START_MENU_TOKEN@*/.buttons["Polls"]/*[[".segmentedControls.buttons[\"Polls\"]",".buttons[\"Polls\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let emptyListTable = app.tables["Empty list"]
        let questionTextField = emptyListTable.textFields["Question"]
        questionTextField.tap()
        questionTextField.typeText("FOR TESTING PURPOSES")
        emptyListTable.buttons["Forever"].tap()
        
        let answerChoicesTextField = emptyListTable.textFields["Answer Choices"]
        answerChoicesTextField.tap()
        answerChoicesTextField.tap()
        answerChoicesTextField.typeText("a")
        
        let addButton = emptyListTable.buttons["Add"]
        addButton.tap()
        
        let tablesQuery = app2.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["a"]/*[[".cells.staticTexts[\"a\"]",".staticTexts[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        
        let tablesQuery2 = app.tables
        tablesQuery2.buttons["Delete"].tap()
        emptyListTable.tap()
        emptyListTable.tap()
        answerChoicesTextField.tap()
        answerChoicesTextField.typeText("b")
        addButton.tap()
        
        let answerChoicesTextField2 = tablesQuery2.textFields["Answer Choices"]
        answerChoicesTextField2.tap()
        answerChoicesTextField2.typeText("c")
        
        let addButton2 = tablesQuery2.buttons["Add"]
        addButton2.tap()
        answerChoicesTextField2.tap()
        answerChoicesTextField2.typeText("d")
        addButton2.tap()
        app.buttons["Create"].tap()
        app.alerts["Success"].buttons["Done"].tap()
        tabBarsQuery.buttons["Settings"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
    }
    
    func testCreateNewTopic() {
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Create New Post"].tap()
        
        let topicTextField = app.textFields["Topic"]
        topicTextField.tap()
        topicTextField.typeText("NEW TOPIC")
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element
        element.tap()
        element.tap()
        
        let ratingElement = app.otherElements["Rating"]
        ratingElement.tap()
        ratingElement.tap()
        
        let textView = element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 3).children(matching: .textView).element
        textView.tap()
        textView.tap()
        textView.typeText("TESTING PURPOSES ONLY")
        app.buttons["Create"].tap()
        app.alerts["Success"].buttons["Done"].tap()
        tabBarsQuery.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
    }
    
    func testSendFeedback() {
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        app.tabBars.buttons["Settings"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Submit Feedback"]/*[[".cells.staticTexts[\"Submit Feedback\"]",".staticTexts[\"Submit Feedback\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.typeText("TEST")
        app.buttons["Confirm"].tap()
        app.alerts["Feedback Confirmed"].buttons["Ok"].tap()
        app.navigationBars["Submit Feedback"].buttons["Settings"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
    }
    
    func testRateKnowItAll() {
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        app.tabBars.buttons["Settings"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Rate KnowItAll"]/*[[".cells.staticTexts[\"Rate KnowItAll\"]",".staticTexts[\"Rate KnowItAll\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.otherElements["Rating"].tap()
        app.buttons["Confirm"].tap()
        app.alerts["Rating Confirmed"].buttons["Ok"].tap()
        app.navigationBars["Rate KnowItAll!"].buttons["Settings"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
    }
    
    func testHomepageDisplaysPollsAndReviews() {
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Polls"]/*[[".segmentedControls.buttons[\"Polls\"]",".buttons[\"Polls\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Review"]/*[[".segmentedControls.buttons[\"Review\"]",".buttons[\"Review\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Polls"]/*[[".segmentedControls.buttons[\"Polls\"]",".buttons[\"Polls\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Review"]/*[[".segmentedControls.buttons[\"Review\"]",".buttons[\"Review\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tabBars.buttons["Settings"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
    }
    
    func testMyPostDisplaysPollsAndReviews() {
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["My Posts"].tap()
        
        let pollsButton = app/*@START_MENU_TOKEN@*/.buttons["Polls"]/*[[".segmentedControls.buttons[\"Polls\"]",".buttons[\"Polls\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        pollsButton.tap()
        
        let reviewButton = app/*@START_MENU_TOKEN@*/.buttons["Review"]/*[[".segmentedControls.buttons[\"Review\"]",".buttons[\"Review\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        reviewButton.tap()
        pollsButton.tap()
        reviewButton.tap()
        tabBarsQuery.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
    }
    
    func testSearch() {
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        
        let searchKnowitallSearchField = app.searchFields["Search KnowItAll..."]
        searchKnowitallSearchField.tap()
        searchKnowitallSearchField.typeText("csci")
        app.typeText("\r")
        app.tabBars.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
        
    }
    
    func testClickOnTopic() {
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        
        let cells = app.tables.cells
        cells.element(boundBy: 0).tap()
    
        app.tabBars.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
        
    }
    
    func testVoteOnPoll() {
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        
        app.tables/*@START_MENU_TOKEN@*/.buttons["Polls"]/*[[".segmentedControls.buttons[\"Polls\"]",".buttons[\"Polls\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        var cells = app.tables.cells
        cells.element(boundBy: 0).tap()
        
        cells = app.tables.cells
        cells.element(boundBy: 1).tap()

        app.tabBars.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
        
    }
    
    func testChangeVoteOnPoll() {
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        
        app.tables/*@START_MENU_TOKEN@*/.buttons["Polls"]/*[[".segmentedControls.buttons[\"Polls\"]",".buttons[\"Polls\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        var cells = app.tables.cells
        cells.element(boundBy: 1).tap()
        
        cells = app.tables.cells
        cells.element(boundBy: 0).tap()
        cells.element(boundBy: 1).tap()
        cells.element(boundBy: 0).tap()
        
        app.tabBars.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
    }
    
    func testInvalidPollCreation() {
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Create New Post"].tap()
        
        let app2 = app
        app2/*@START_MENU_TOKEN@*/.buttons["Polls"]/*[[".segmentedControls.buttons[\"Polls\"]",".buttons[\"Polls\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let emptyListTable = app.tables["Empty list"]
        let questionTextField = emptyListTable.textFields["Question"]
        questionTextField.tap()
        questionTextField.typeText("What's your favorite color?")
        emptyListTable.buttons["Forever"].tap()
        
        let addButton = emptyListTable.buttons["Add"]
        addButton.tap()
        emptyListTable.tap()
        
        let answerChoicesTextField = emptyListTable.textFields["Answer Choices"]
        answerChoicesTextField.tap()
        answerChoicesTextField.tap()
        answerChoicesTextField.typeText("blue")
        addButton.tap()
        app.buttons["Create"].tap()
        app.alerts["Warning!"].buttons["Done"].tap()
        tabBarsQuery.buttons["Settings"].tap()
        app2.tables/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
        
    }
    
    func testInavlidTopicCreation() {
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Create New Post"].tap()
        
        let createButton = app.buttons["Create"]
        createButton.tap()
        
        let doneButton = app.alerts["Warning!"].buttons["Done"]
        doneButton.tap()
        app.otherElements["Rating"].tap()
        
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 3).children(matching: .textView).element
        textView.tap()
        textView.typeText("test")
        createButton.tap()
        doneButton.tap()
        tabBarsQuery.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
        
    }
    
    func testInvalidTopicNoRating() {
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Create New Post"].tap()
        
        let topicTextField = app.textFields["Topic"]
        topicTextField.tap()
        topicTextField.typeText("error post")
        
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 3).children(matching: .textView).element
        textView.tap()
        textView.typeText("give a warning")
        let createButton = app.buttons["Create"]
        createButton.tap()
        
        let doneButton = app.alerts["Warning!"].buttons["Done"]
        doneButton.tap()
        tabBarsQuery.buttons["My Posts"].tap()
        tabBarsQuery.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
        
    }
    
    func testEmptyStringSearchFromHomePage() {
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        
        let searchKnowitallSearchField = app.searchFields["Search KnowItAll..."]
        searchKnowitallSearchField.tap()
        app.typeText("\r")
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
    }
    
    func testEmptyStringSearchFromSearchPage() {
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("shuzawa@usc.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345")
        app.buttons["Login"].tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Search"].tap()
        
        let searchKnowitallSearchField = app.searchFields["Search KnowItAll..."]
        searchKnowitallSearchField.tap()
        searchKnowitallSearchField.typeText("\r")
        tabBarsQuery.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Are you sure you want to sign out?"].buttons["Yes"].tap()
    }
    
    func testContinueAsGuest() {
        
        let app = XCUIApplication()
        app.buttons["Continue as Guest"].tap()
        app.tabBars.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Log In"]/*[[".cells.staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                
    }
    
    func testCreateTopicAsGuest() {
        
        let app = XCUIApplication()
        app.buttons["Continue as Guest"].tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Create New Post"].tap()
        
        let topicTextField = app.textFields["Topic"]
        topicTextField.tap()
        topicTextField.typeText("Test")
        app.otherElements["Rating"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element
        let textView = element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 3).children(matching: .textView).element
        textView.tap()
        textView.tap()
        app.buttons["Create"].tap()
        app.alerts["Error!"].buttons["Done"].tap()
        element.tap()
        tabBarsQuery.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Log In"]/*[[".cells.staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    func testAddPollAsGuest() {
        
        let app = XCUIApplication()
        app.buttons["Continue as Guest"].tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Create New Post"].tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["Polls"]/*[[".segmentedControls.buttons[\"Polls\"]",".buttons[\"Polls\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let emptyListTable = app.tables["Empty list"]
        let questionTextField = emptyListTable.textFields["Question"]
        questionTextField.tap()
        questionTextField.typeText("Will this work?")
        emptyListTable.buttons["Forever"].tap()
        emptyListTable.tap()
        
        let answerChoicesTextField = emptyListTable.textFields["Answer Choices"]
        answerChoicesTextField.tap()
        answerChoicesTextField.tap()
        answerChoicesTextField.typeText("a")
        emptyListTable.buttons["Add"].tap()
        
        let questionTable = app/*@START_MENU_TOKEN@*/.tables.containing(.textField, identifier:"Question").element/*[[".tables.containing(.textField, identifier:\"Days\").element",".tables.containing(.button, identifier:\"Forever\").element",".tables.containing(.textField, identifier:\"Answer Choices\").element",".tables.containing(.button, identifier:\"Add\").element",".tables.containing(.textField, identifier:\"Question\").element"],[[[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        questionTable.tap()
        questionTable.tap()
        
        let tablesQuery = app.tables
        let answerChoicesTextField2 = tablesQuery.textFields["Answer Choices"]
        answerChoicesTextField2.tap()
        answerChoicesTextField2.tap()
        answerChoicesTextField2.typeText("b")
        tablesQuery.buttons["Add"].tap()
        app.buttons["Create"].tap()
        app.alerts["Error!"].buttons["Done"].tap()
        tabBarsQuery.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Log In"]/*[[".cells.staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    func testAddReviewToExistingTopicAsGuest() {
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        app.buttons["Continue as Guest"].tap()
        let cells = app.tables.cells
        cells.element(boundBy: 0).tap()
        app.buttons["Add Review"].tap()
        app.alerts["Error!"].buttons["Done"].tap()
        tabBarsQuery.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Log In"]/*[[".cells.staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    func testAddVoteAsGuest() {
        
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        app.buttons["Continue as Guest"].tap()
        app.tables/*@START_MENU_TOKEN@*/.buttons["Polls"]/*[[".segmentedControls.buttons[\"Polls\"]",".buttons[\"Polls\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        var cells = app.tables.cells
        cells.element(boundBy: 0).tap()
        cells = app.tables.cells
        cells.element(boundBy: 1).tap()
        app.alerts["Error!"].buttons["Done"].tap()
        tabBarsQuery.buttons["Settings"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Log In"]/*[[".cells.staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testChangePasswordAsGuest() {
        
        let app = XCUIApplication()
        app.buttons["Continue as Guest"].tap()
        app.tabBars.buttons["Settings"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Change Password"]/*[[".cells.staticTexts[\"Change Password\"]",".staticTexts[\"Change Password\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Error!"].buttons["Done"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Log In"]/*[[".cells.staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
}
