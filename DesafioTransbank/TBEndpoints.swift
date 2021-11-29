//
//  TBEndpoints.swift
//  DesafioTransbank
//
//  Created by Matías Contreras on 31-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import TBNetwork
import Foundation

enum Endpoint: TBEndpoint {
    case itunes = "itunes.apple.com/chao"
    case thisIsAnotherDiferentEndpoint
}

enum EndpointBuilder {
    static func buildEndpoint(endpoint: Endpoint, extraQueryItems: [URLQueryItem]) -> String? {
        var queryItems: [URLQueryItem] = [
            URLQueryItem(name: "mediaType", value: "music"),
            URLQueryItem(name: "limit", value: "20")
        ]
        queryItems += extraQueryItems

        var components = URLComponents()
        components.scheme = "https"
        components.host = endpoint.rawValue
        components.path = "/search"
        components.queryItems = queryItems
        return components.url?.absoluteString
    }
}
