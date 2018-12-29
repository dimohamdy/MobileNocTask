//
//  DataSourceTests.swift
//  TaskTests
//
//  Created by BinaryBoy on 12/22/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import XCTest
@testable import Task

class DataSourceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchForTH() {
        if let webContent = getHTML()?.lowercased() {

        let result =  Search().searchFor(words: ["10th"], content: webContent)
        if let oneResult = result.first {
            XCTAssert(oneResult.count == 2, "the html have 2 any 10th char")
        }
        }
    }

    func testSearchForEveryTH() {
        if let webContent = getHTML()?.lowercased() {

            let result =  Search().searchFor(words: generateArrayOfTh(), content: webContent)

        if let resultOfTens = result.last {
            XCTAssert(resultOfTens.count == 1, "the html have 1 result any 10th")
        } else {
            XCTAssert(false, "No result something wrong happen")
        }
        }
    }

    func testSearchNumberOfWords() {
        if let webContent = getHTML()?.lowercased() {
            let words = webContent.components(separatedBy: " ")
            let result =  Search().searchFor(words: words, content: webContent)
            XCTAssertGreaterThan(result.count, 0)

        }

    }

}
