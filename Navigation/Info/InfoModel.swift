//
//  InfoModel.swift
//  Navigation
//
//  Created by MacBook on 15.11.2022.
//

import Foundation

struct InfoModel: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}

func getRandomTitle(completion: ((_ infoModal: InfoModel?)->Void)?) {

    let session = URLSession(configuration: .default)
    
    let task = session.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/\(Int.random(in: 1...20))")!) { data, responce, error in

        if let error {
            print(error.localizedDescription)
            completion?(nil)
            return
        }
        
        if (responce as! HTTPURLResponse).statusCode != 200 {
            print("Status code != 200, statusCode = \((responce as! HTTPURLResponse).statusCode)")
            completion?(nil)
            return
        }
        
        guard let data else {
            print("data = nil")
            completion?(nil)
            return
        }
        
        //
        do {
//            if let answer = try JSONSerialization.jsonObject(with: data) as? [String:Any] {
//                guard let title = answer["title"] as? String else {return}
//                completion?(title)
//                print(title)
//                return
//            }
            let infoModel = try JSONDecoder().decode(InfoModel.self, from: data)
            completion?(infoModel)
            return
        } catch {
            print(error)
        }
        
        completion?(nil)
    }
    
    task.resume()
}
