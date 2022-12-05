//
//  ServiceManager.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import Foundation

class ServiceManager {
    public static let shared = ServiceManager()

    func callService<T: Codable>(urlString: String, method: HTTPMethod, success: @escaping ((T) -> Void), fail: @escaping ((String) -> Void)) {
        let url = URL(string: urlString)
        guard let urlObj = url else {
            fail("url failed")
            return
        }
        let session = URLSession.shared
        var request = URLRequest(url: urlObj)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            
            if let error = error {
                DispatchQueue.main.async {fail(error.localizedDescription)}
            } else if let data = data, let response = response as? HTTPURLResponse {
                
                let decoder = JSONDecoder()
               
                if response.statusCode == 200 {
                    
                    DispatchQueue.main.async {
                        
                        if let json = try? decoder.decode(T.self, from: data) {
                            success(json)
                        } else {
                            fail("Parsing error")
                        }
                    }
                } else if response.statusCode == 404 {
                    DispatchQueue.main.async {
                        
                        fail("User not found")
                    }
                } else {
                    DispatchQueue.main.async {
                        
                        fail("An error occurred while processing your request")
                    }
                }
            } else {
                DispatchQueue.main.async {
                    
                    fail("An error occurred while processing your request")
                }
            }
        })
        task.resume()
    }
}
