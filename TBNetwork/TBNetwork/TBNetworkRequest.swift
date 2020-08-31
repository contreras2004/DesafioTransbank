//
//  TBNetworkRequest.swift
//  TBNetwork
//
//  Created by Matías Contreras on 31-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import Alamofire

public typealias TBEndpoint = String

protocol TBRequestPerformer: AnyObject {
    //static func request<T: Codable>(endpoint: TBEndpoint, completionHandler: @escaping (DataResponse<T, AFError>) -> Void)
    static func request<T: Codable>(endpoint: TBEndpoint, completionHandler: @escaping (Result<T, Error>) -> Void)
}

public class TBRequest: NSObject, TBRequestPerformer {
    public static func request<T: Codable>(endpoint: TBEndpoint, completionHandler: @escaping (Result<T, Error>) -> Void) {

        AF.request(endpoint).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completionHandler(Result.success(data))
            case .failure(let error):
                completionHandler(Result.failure(error))
            }
        }
    }
}
