//
//  NetworkService.swift
//  Navigation
//
//  Created by MacBook on 07.11.2022.
//

import Foundation

struct NetworkService {
    
    static func request(for configuration: AppConfiguration) {
        
        guard let url = URL(string: configuration.rawValue ) else {return}
        sessionDataTask(url)

    }
    static func sessionDataTask(_ adress: URL) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: adress) { data, responce, error in
            
            if let error {
                print(error.localizedDescription)
                return //The Internet connection appears to be offline.
            }
            
            if let responce = responce as? HTTPURLResponse {
                print("responce -",responce.allHeaderFields, responce.statusCode)
                return
            }
            
            guard let data else {return}
            let decoding = String(decoding: data, as: UTF8.self)
            print("data - \(decoding))")
        }
        task.resume()
    }
    
}
