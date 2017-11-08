//
//  SimpleHotelsTests.swift
//  SimpleHotelsTests
//
//  Created by Paul Kite on 6/18/17.
//  Copyright © 2017 Expedia, Inc. All rights reserved.
//

import XCTest

@testable import SimpleHotels

class SimpleHotelsTests: XCTestCase {
    
    var sessionUnderTest: URLSession!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sessionUnderTest  = nil
        super.tearDown()
    }
    
    func testValidCallToChicagoHotelsGetsHTTPStatusCode200(){
        
        //given
        let url = URL(string: "https://techblog.expedia.com/utility/chicago-hotels.json")
        let promise = expectation(description: "Status code 200")
        
        let dataTask = sessionUnderTest.dataTask(with: url!) { (data, response, error) in
            
            if let error = error {
                
                XCTFail("Error: \(error.localizedDescription)")
                return
            }else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                
                if statusCode == 200 {
                    promise.fulfill()
                }else {
                    XCTFail("Status Code: \(statusCode)")
                }
            }
        }
        
        dataTask.resume()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testValidCallToSanFranciscoGetsHTTPStatusCode200(){
        
        //given
        let url = URL(string: "https://techblog.expedia.com/utility/san-francisco-hotels.json")
        let promise = expectation(description: "Status code 200")
        
        let dataTask = sessionUnderTest.dataTask(with: url!) { (data, response, error) in
            
            if let error = error {
                
                XCTFail("Error: \(error.localizedDescription)")
                return
            }else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                
                if statusCode == 200 {
                    promise.fulfill()
                }else {
                    XCTFail("Status Code: \(statusCode)")
                }
            }
        }
        
        dataTask.resume()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
