//
//  ServerManagerTests.swift
//  Task
//
//  Created by BinaryBoy on 12/22/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import XCTest
@testable import Task

class ServerManagerTests: XCTestCase {
    var serverManager: ServerManager!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        serverManager = ServerManager()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetMachines() {
        serverManager.getMachines(page: 0, size: 10) { result in
            switch result {
            case .succeed(let page):
                guard let page = page, let content = page.content  else {
                    XCTFail("error from serverManager")
                }
                XCTAssertEqual(content.count, 10)
            default:
                XCTFail("error from serverManager")
            }
        }

    }
}
