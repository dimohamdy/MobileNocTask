//
//  NetworkSession.swift
//  Task
//
//  Created by BinaryBoy on 12/10/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import Foundation
import UIKit

protocol NetworkSession {
    func loadData(from url: URL,
                  completionHandler: @escaping (Data?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    func loadData(from url: URL,
                  completionHandler: @escaping (Data?, Error?) -> Void) {
        
        let loginData = String(format: "%@:%@", username, password).data(using: String.Encoding.utf8)!
        let base64LoginData = loginData.base64EncodedString()
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Basic \(base64LoginData)", forHTTPHeaderField: "Authorization")
        
        let task = dataTask(with: request) { (data, _, error) in
            completionHandler(data, error)
        }
        task.resume()
    }
}
let username = "admin@boot.com"
let password =  "admin"

class SessionDelegate:NSObject, URLSessionDelegate
{
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if(challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust)
        {
            print(challenge.protectionSpace.host)
            if(challenge.protectionSpace.host == "45.55.43.15")
            {
           
                let credential = URLCredential(user: username, password: password,
                                               persistence: .none)

                completionHandler(URLSession.AuthChallengeDisposition.useCredential, credential)
            }
        }

    }
}
class NetworkManager  {

    
    private var session: NetworkSession!
    init(session: NetworkSession = URLSession.shared) {
    self.session = session
    }
    func loadData<T:Codable>(from url: URL,
                     completion: @escaping (Result<T>) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        let sessionDelegate = SessionDelegate()
        let session = URLSession(configuration: .default, delegate: sessionDelegate, delegateQueue: nil)
        session.loadData(from: url) { data, _ in
            
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                do {
                    guard let data = data else {
                        completion(.failed(MobileNOCError.noResults))
                        return
                    }
                    let returnData = String(data: data, encoding: .utf8)
                                            print(returnData)
                    // Parse JSON data

                    let decoder = JSONDecoder()
                    let result = try decoder.decode(T.self, from: data)
                    completion(.succeed(result))

                } catch let err {
                    print("Err", err)
                    completion(.failed(err as? MobileNOCError))

                }
            }
        }
    }
}
