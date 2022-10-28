//
//  BA_testTests.swift
//  BA_testTests
//
//  Created by Rokas Mikelionis on 2022-10-28.
//

import XCTest

@testable import BA_test

class NetworkServiceTests: XCTestCase {
    var sut: NetworkService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = NetworkService()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
        
    }
    
    
    func testValidApiCall() throws {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        let promise = expectation(description: "Data gets returned")
        
         sut.fetch(from: urlString) { data, error in
            if case .generic(let description) = error {
                XCTFail("Error: \(description)")
                return
            } else if let data2 = data {
                promise.fulfill()
            }
        }

        wait(for: [promise], timeout: 5)
    }

    func testInvalidApiCall() throws {
        let urlString = "https://jsonplaceholder.typicodeposts"
        let promise = expectation(description: "Data gets returned")
        
         sut.fetch(from: urlString) { data, error in
            if case .generic(let description) = error {
                promise.fulfill()

                return
            } else if let data2 = data {
                XCTFail("Error: Call returned data")

            }
        }

        wait(for: [promise], timeout: 5)
    }

}
