//
//  MockSongsListRequestPerformer.swift
//  DesafioTransbankTests
//
//  Created by Matías Contreras on 01-09-20.
//  Copyright © 2020 matias. All rights reserved.
//

import TBNetwork
@testable import DesafioTransbank

class MockSongsListRequestPerfomer: NSObject, TBRequestPerformer {
    enum State {
        case emptyResponse
        case error
        case withData
        case noResponse
    }
    var state: State = .withData

    func request<T>(endpoint: TBEndpoint, completionHandler: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        switch self.state {

        case .emptyResponse:
            let songs: T = JSONHelper.loadJSON(withFile: "EmptySongsResponse", inBundle: Bundle(for: type(of: self)))!
            completionHandler(.success(songs))
        case .error:
            completionHandler(.failure(NSError(domain: "", code: 500)))
        case .withData:
            let songs: T = JSONHelper.loadJSON(withFile: "SongsResponse", inBundle: Bundle(for: type(of: self)))!
            completionHandler(.success(songs))
        case .noResponse:
            return
        }

    }
}
