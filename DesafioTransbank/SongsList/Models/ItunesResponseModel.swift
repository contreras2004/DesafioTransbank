//
//  ItunesResponseModel.swift
//  DesafioTransbank
//
//  Created by Matías Contreras on 31-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import Foundation

struct ItunesResponseModel: Codable {
    let resultCount: Int
    let results: [Song]
}
