//
//  NetworkTests.swift
//  Task
//
//  Created by BinaryBoy on 12/22/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import XCTest
@testable import Task

class NetworkTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetPage() {
        // Setup our objects
        let session = URLSessionMock()
        let manager = NetworkManager(session: session)
        // Create data and tell the session to always return it
        session.data = getData()
        // Create a URL (using the file path API to avoid optionals)
        let url = URL(fileURLWithPath: "url")
        // Perform the request and verify the result
        manager.loadData(from: url) { (result: Result<Page>) in
            switch result {
            case .succeed(let page):
                guard page != nil else {
                    return
                }
                XCTAssert(true)
                break
            default:
                XCTFail("error from serverManager")
                break
            }

        }
    }

}
