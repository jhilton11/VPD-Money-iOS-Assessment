//
//  ApiManager.swift
//  VPD Money Assessment
//
//  Created by user on 30/09/2022.
//

import Foundation

class ApiManager {
    static var shared = ApiManager()
    
    static func getUsers(urlString: String, completed: @escaping (Data?, Error?) -> (Void)) {
        guard let url = URL(string: urlString) else {
            print("URL error")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [:]
        
        let task = URLSession.shared.dataTask(with: urlRequest) {
            data, response, error in
            
            let code = (response as! HTTPURLResponse).statusCode
            print("Status code is \(code)")
            
            completed(data, error)
        }
        
        task.resume()
    }
}
