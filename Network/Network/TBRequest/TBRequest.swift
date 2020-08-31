//
//  TBRequest.swift
//  Network
//
//  Created by Matías Contreras on 31-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import Alamofire

public class TBRequest: NSObject {
    public static func request(){
        AF.request("https://itunes.apple.com/search?term=in+utero&mediaType=music&limit=20", method: .post).response { response in
            debugPrint(response)
        }

    }
}

