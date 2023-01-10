//
//  PlanetModel.swift
//  Navigation
//
//  Created by MacBook on 10.01.2023.
//

import Foundation

struct PlanetModel: Decodable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}

func getRotationPeriod(completion: ((_ planetModel: PlanetModel?)->Void)?) {
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: URL(string: "https://swapi.dev/api/planets/1")!) { data, responce, error in
        
        if let error {
            print(error.localizedDescription)
            completion?(nil)
            return
        }
        
        if (responce as! HTTPURLResponse).statusCode != 200 {
            print("Статус code != 200, statusCode = \((responce as! HTTPURLResponse).statusCode)")
            completion?(nil)
            return
        }
        
        guard let data else {
            print("data = nil")
            completion?(nil)
            return
        }
        do {
            
            let planetModel = try JSONDecoder().decode(PlanetModel.self, from: data)
            completion?(planetModel)
            return
            
        } catch {
            print(error)
        }
        completion?(nil)
    }
    task.resume()
}

