//
//  BA_testTests.swift
//  BA_testTests
//
//  Created by Rokas Mikelionis on 2022-10-28.
//

import XCTest

@testable import BA_test

class BA_testTests: XCTestCase {
    var sut: BA_testApp!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BA_testApp()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
        
    }
    
}
