//
//  TaipeiSightseeingSpotTests.swift
//  TaipeiSightseeingSpotTests
//
//  Created by Wii Lin on 2018/7/18.
//  Copyright © 2018年 wiilin. All rights reserved.
//

import XCTest
@testable import TaipeiSightseeingSpot

class TaipeiSightseeingSpotTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInterError() {
        let someError  = NSError.init(domain: "", code: 0, userInfo: [:])
        XCTAssert(!someError.isInternetError)
        let notConnectedError  = NSError.init(domain: "", code: NSURLErrorNotConnectedToInternet, userInfo: [:])
        XCTAssert(notConnectedError.isInternetError)
        let timedOutError  = NSError.init(domain: "", code: NSURLErrorTimedOut, userInfo: [:])
        XCTAssert(timedOutError.isInternetError)
    }
    
    func testSightseeingSpotListAPI(){
        let expectation : XCTestExpectation = self.expectation(description: "testSightseeingSpotListAPI")
    
        WLAPIService.shared.getSightseeingSpotList(offset: 0, success: { (sightseeingSpotList) in
            XCTAssert(0 != sightseeingSpotList.count)
             expectation.fulfill()
        }) { (error) in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
