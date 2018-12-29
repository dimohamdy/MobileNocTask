//
//  ServerManager.swift
//  MobileNOCTask
//
//  Created by BinaryBoy on 12/21/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import Foundation
import UIKit

final class ServerManager {
    let networkManager: NetworkManager!
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager =  networkManager
    }
    func getMachines(page:Int,size:Int,completion: @escaping (Result<Page>) -> Void ) {
        guard let url = URL(string: "https://45.55.43.15:9090/api/machine?page=\(page)&size=\(size)") else { return }
        print(url.absoluteString)
        networkManager.loadData(from: url) { (result: Result<Page>) in
            switch result {
            case .succeed(let page):
                if let page = page {
                    completion(.succeed(page))
                } else {
                    completion(.failed(.noResults))
                }
            default:
                completion(.failed(MobileNOCError.unknownError))
            }
        }

    }
}

enum Result<T> {
    case succeed(T?), failed(MobileNOCError?)
}

enum MobileNOCError: Error {
    case failedConnection
    case idError
    case noResults
    case noInternetConnection
    case unknownError
    case runtimeError(String)
    var localizedDescription: String {
        switch self {
        case .noResults:
            return "No result found"
        case .noInternetConnection:
            return "No Internet Connection"
        case .unknownError:
            return "something wrong Happen, please try other time"
        default:
            return "something wrong Happen, please try other time"
        }
    }
}
