//
//  JSON+ext.swift
//  DesafioTransbankTests
//
//  Created by Matías Contreras on 01-09-20.
//  Copyright © 2020 matias. All rights reserved.
//

import Foundation

public enum JSONHelper {

    public static func loadJSON<Element: Decodable>(withFile fileName: String, inBundle bundle: Bundle) -> Element? {
        var jsonData: Element?
        if let url = bundle.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                debugPrint(Element.self)
                jsonData = try decoder.decode(Element.self, from: data)
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
        return jsonData
    }
}
