//
//  TBDataManager.swift
//  TBNetwork
//
//  Created by Matías Contreras on 31-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import Foundation

protocol Storable{
    var key : DataManager.StoringKey{get}
}

struct DataManager{

    enum StoringKey: String, Codable{
        case songs
    }

    func save<T: Codable>(object: T) {
        guard let storableObject = object as? Storable else{
            debugPrint("The object <\(type(of: T.self))> does not conform to protocol Storable")
            return
        }

        let storingKey = storableObject.key
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: storingKey.rawValue)
            defaults.synchronize()
        }
    }

    func retrieve<T: Decodable>(decodingType: T.Type, storingKey: StoringKey) -> T? {

        if let data = UserDefaults.standard.data(forKey: storingKey.rawValue){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(decodingType, from: data){
                return decoded
            }
        }
        return nil
    }
}

