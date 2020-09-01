//
//  TBNetworkRequest.swift
//  TBNetwork
//
//  Created by Matías Contreras on 31-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import Alamofire

public typealias TBEndpoint = String

public protocol TBRequestPerformer: AnyObject {
    //static func request<T: Codable>(endpoint: TBEndpoint, completionHandler: @escaping (DataResponse<T, AFError>) -> Void)
    func request<T: Codable>(endpoint: TBEndpoint, completionHandler: @escaping (Result<T, Error>) -> Void)
}

public class TBRequest: NSObject, TBRequestPerformer {
    public func request<T: Codable>(endpoint: TBEndpoint, completionHandler: @escaping (Result<T, Error>) -> Void) {

        AF.request(endpoint) { urlRequest in
            urlRequest.timeoutInterval = 5
        }.response { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                guard let data = data else { return }
                do {
                    if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
                       print(JSONString)
                    }

                    let decodedData = try jsonDecoder.decode(T.self, from: data)
                    completionHandler(Result.success(decodedData))
                } catch (let error) {
                    debugPrint("Could not decode response: \(error)")
                    completionHandler(Result.failure(error))
                }

            case .failure(let error):
                debugPrint("Error: \(error)")
                completionHandler(Result.failure(error))
            }
        }
    }
}
