//
//  SongModel.swift
//  DesafioTransbank
//
//  Created by Matías Contreras on 31-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import Foundation

struct Song: Codable {
    let trackId: Int?
    let artistName: String?
    let trackName: String?
    let previewUrl: URL?
    let artworkUrl100: URL?
    let trackPrice: Double?
    let releaseDate: CustomDate?
}
