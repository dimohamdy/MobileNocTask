//
//  ViewModelTests.swift
//  Task
//
//  Created by BinaryBoy on 12/22/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import XCTest
@testable import Task
import RxSwift

class ViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    fileprivate let disposeBag = DisposeBag()

    override func setUp() {

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetContents() {
        let mockNetwork = getMockNetwork()
        viewModel = HomeViewModel(networkManager: mockNetwork)
        
        viewModel.contentsObservable.subscribe(onNext: { contents in
            XCTAssertEqual(contents.count, 10)
        }).disposed(by: disposeBag)
        

    }

    func getMockNetwork() -> NetworkManager {
        let session = URLSessionMock()
        let manager = NetworkManager(session: session)
        // Create data and tell the session to always return it
        session.data = getData()
        return manager
    }
}
