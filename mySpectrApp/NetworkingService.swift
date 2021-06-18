//
//  NetworkingService.swift
//  NewProgram
//
//  Created by CT Oak Student on 3/3/21.
//  Copyright © 2021 CT Oak Student. All rights reserved.
//

import Foundation

enum MyResult<T, E: Error> {
    
    case success(T)
    case failrue(E)
}

class NetworkingService {
    
    let baseURL = "https://kiloloco.herokuapp.com/api"
    
    func request(endpoint: String,
                 parameters: [String: Any],
                 completion: @escaping (Result<User, Error>) -> Void) {
        
        guard let url = URL(string: baseURL + endpoint) else {
            completion(.failure(NetworkingError.badUrl))
            return
        }
        
        var request: URLRequest? = nil
        
        var components = URLComponents()
        
        var queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            
            let queryItem = URLQueryItem(name: key, value: String(describing: value))
            queryItems.append(queryItem)
            
        }
        
        components.queryItems = queryItems
        
        let queryItemData = components.query?.data(using: .utf8)
        
        request?.httpBody = queryItemData
        request?.httpMethod = "POST"
        request?.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request!, completionHandler: { data, response, error in
            
            DispatchQueue.main.async {
                guard let unwrappedResponse = response as? HTTPURLResponse else {
                    
                    completion(.failure(NetworkingError.badResponse))
                    return
                }
                
                print(unwrappedResponse.statusCode)
                
                switch unwrappedResponse.statusCode {
                
                    case 200 ..< 300:
                        print("success")
                    default:
                        print("failure")
                }
                
                
            }
            
            
            
            
        })
        
        task.resume()
    }
}

enum NetworkingError: Error {
    case badUrl
    case badResponse
}
